# rubocop:disable ClassLength
module API
  module V1
    class Posts < Grape::API
      resource :posts do
        helpers do
          def my_permitted_keys
            [:title, :content, :image]
          end
        end

        desc 'Create Post'

        params do
          requires :title, type: String, desc: 'Title of post'
          requires :content, type: String, desc: 'Content of post'
          requires :image, type: Rack::Multipart::UploadedFile
          requires :post_type, type: String, values: %w(image video article), desc: 'Post Type'
        end

        post do
          user_authenticate!

          post = Post.new my_permitted_params
          post.save!

          ApiResponse::Resource.new(post.as_json_api(params)).as_json
        end

        desc 'Get a post infomation'

        params do
          optional :include, desc: 'Available values: tags'
        end

        get ':id' do
          error!('401 Unauthorized', 401) unless current_user

          post = Post.find params[:id]

          ApiResponse::Resource.new(post.as_json_api(params)).as_json
        end
      end
    end
  end
end

