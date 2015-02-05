require 'grape-swagger'

module API
  class Root < Grape::API
    prefix 'api'
    format :json

    helpers do
      def user_authenticate!
        error!('401 Unauthorized', 401) unless current_user
      end

      def current_user
        @user ||= User.authorize params
      end

      def my_params
        ApiParams::Hash.new(params).as_rails_params
      end

      def my_permitted_params
        my_params.permit(*my_permitted_keys)
      end
    end

    mount API::V1::Root
    # mount API::V2::Root (next version)

    add_swagger_documentation(api_version: 'v1', hide_format: true, hide_documentation_path: true)
  end
end
