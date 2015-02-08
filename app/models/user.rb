class User < ActiveRecord::Base
  include ExtActiveRecord
  include Devise::Controllers::UrlHelpers

  # association
  has_many :posts

  before_save :ensure_authentication_token

  TEMP_EMAIL_PREFIX = 'system@gif4fun.me'
  TEMP_EMAIL_REGEX = /\Asystem@gif4fun.me/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  has_attached_file :avatar,
    styles: {
      thumb:   '200x200#',
      medium:  '400>x',
      large:   '800>x',
      square:  '400x400#'
    },
    default_url: '/assets/placeholder.png',
    convert_options: {
      thumb: '-quality 90',
      medium: '-quality 90',
      large: '-quality 90',
      square: '-quality 90'
    }

  validates_attachment :avatar,
                        content_type: { content_type: ['image/jpeg', 'image/png', 'image/jpg', 'image/gif'] },
                        size: { less_than: 3.megabyte }

  def as_api_response
    as_json methods: :avatar_square
  end

  def avatar_square
    avatar.url :thumb
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation! if user.respond_to?(:skip_confirmation)
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def self.find_for_database_authentication(params)
    where(params).first
  end

  def self.authorize(params)
    return find_by authentication_token: params[:access_token] if params[:access_token]

    user = find_for_database_authentication(params.slice(*authentication_keys))

    return unless user && user.valid_password?(params[:password])

    user
  end

  def self.authorize!(params)
    user = authorize(params)
    return user if user

    fail 'Invalid email or password.', authentication_keys: authentication_keys.join(', ')
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  # Skip required confirmation all-together
  # Allowing Unconfirmed Access
  protected

  def confirmation_required?
    false
  end

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless self.class.exists? authentication_token: token
    end
  end

end
