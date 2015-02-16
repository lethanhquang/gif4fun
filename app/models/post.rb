class Post < ActiveRecord::Base
  include ExtActiveRecord
  extend Enumerize

  TYPE = { normal_post: 1, admin_post: 2, sponsor_post: 3, anonymous_post: 4 }
  CONTENT_TYPE = { article: 1, image: 2 , video: 3 }
  STATUS = { pending: 1, scheduled: 2, published: 3, banned: 4, rejected: 5 }

  enumerize :post_type,    in: TYPE,         scope: true, default: :normal_post
  enumerize :content_type, in: CONTENT_TYPE, scope: true, default: :image
  enumerize :status,       in: STATUS,       scope: true, default: :pending

 has_attached_file :thumbnail,
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

  has_attached_file :image,
    styles: {
      medium:  '400>x',
      large:   '800>x'
    },
    default_url: '/assets/placeholder.png',
    convert_options: {
      medium: '-quality 90',
      large: '-quality 90'
    }

  validates_attachment :image,
    content_type: { content_type: ['image/jpeg', 'image/png', 'image/jpg', 'image/gif'] },
    size: { less_than: 3.megabyte }

  validates_attachment :image,
    content_type: { content_type: ['image/jpeg', 'image/png', 'image/jpg', 'image/gif'] },
    size: { less_than: 3.megabyte }

  # thumbnail
  before_thumbnail_post_process :rename_file_name
  before_thumbnail_post_process :extract_gif_before_post_proccess

  # image
  before_image_post_process :skip_for_gif

  # association
  belongs_to :user

  validates :title, presence: true, length: { maximum: 255 }


  scope :filtered, lambda{ |params|
    filtered_by_status(params)
  }
  scope :filtered_by_status, -> (params) { with_status params[:status] if params[:status].present? }

  private

  def rename_file_name
    extension = File.extname(thumbnail_file_name).downcase
    basename  = "THUMBNAIL_" + File.basename(thumbnail_file_name, '.*')
    thumbnail.instance_write(:file_name, "#{basename}#{extension}")
  end

  def skip_for_gif
    ! %w(image/gif).include?(image_content_type)
  end

  def extract_gif_before_post_proccess
    success = true
    if %w(image/gif).include?(thumbnail_content_type)
      success = false
      begin
        parameters = []
        parameters << ":source"
        parameters << ":dest"
        parameters = parameters.flatten.compact.join(' ').strip.squeeze(' ')
        src = thumbnail.queued_for_write[:original]
        dst = src
        Paperclip.run('convert', parameters, :source => "#{File.expand_path(src.path)}[0]",
                                             :dest => File.expand_path(dst.path))
        success = true
      rescue Paperclip::PaperclipCommandLineError => e
        puts e
      end
    end
    success
  end

end
