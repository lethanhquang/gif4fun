# rubocop:disable ClassLength
module API
  module V1
    class Users < Grape::API
      resource :users do
        helpers do
          def my_permitted_keys
            [:name, :email, :avatar, :current_password, :password]
          end
        end

        desc 'Register User'

        params do
          requires :name, type: String, desc: 'Name'
          requires :email, type: String, desc: 'Email'
          requires :password, type: String, desc: 'Password'
          requires :avatar, type: Rack::Multipart::UploadedFile
        end

        post :sign_up do
          user = User.create! my_permitted_params

          ApiResponse::Resource.new(
            user.as_api_response,
            access_token: user.authentication_token
          ).as_json
        end

        desc 'Returns User & access_token if valid login'

        params do
          requires :email, type: String, desc: 'Email'
          requires :password, type: String, desc: 'Password'
        end

        post :sign_in do
          user = User.authorize! my_params

          ApiResponse::Resource.new(user.as_api_response, access_token: user.authentication_token).as_json
        end

        desc 'User signs out'

        delete :sign_out do
          user_authenticate!

          current_user.sign_out_api

          status 204
        end

        resource :me do
          desc 'Get User info'

          get do
            user_authenticate!

            ApiResponse::Resource.new(current_user.as_api_response).as_json
          end

          desc 'Update User'

          params do
            optional :email, type: String, desc: 'Phone'
            optional :name, type: String, desc: 'Name'
            optional :avatar, type: Rack::Multipart::UploadedFile
            optional :current_password, type: String, desc: 'Current Password'
            optional :password, type: String, desc: 'Password'
          end

          put do
            user_authenticate!

            User.update! my_permitted_params
            ApiResponse::Resource.new(current_user.as_api_response).as_json
          end

        end
      end
    end
  end
end

