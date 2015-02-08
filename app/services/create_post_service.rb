class CreatePostService
  def self.create!(params, current_user = nil)
    booking = Post.new params
    booking.user = current_user if current_user
    booking.save!

    booking
  end
end

