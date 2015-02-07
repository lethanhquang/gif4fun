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
          requires :post_type, type: String, values: %w(image video article), desc: 'Post Type'
          requires :image, type: Rack::Multipart::UploadedFile
          optional :content, type: String, desc: 'Content of post'
        end

        post do
          user_authenticate!

          post = Post.new my_permitted_params
          post.save!

          ApiResponse::Resource.new(post.as_json_api(params)).as_json
        end

        desc 'Get top posts'

        params do
          requires :sort_by, type: String, values: %w(id total_like), desc: 'Sort by'
          optional :page, desc: 'Page of content'
          optional :limit, desc: 'Limit of posts per page'
          optional :include, desc: 'Avaiable values: tags'
        end

        get do
          error!('401 Unauthorized', 401) unless current_user

          posts = Post.filtered(params).sorted(params).as_json_api(params)
          ApiResponse::Collection.new(posts).as_json
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

