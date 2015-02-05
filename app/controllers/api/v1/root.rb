module API
  module V1
    class Root < Grape::API
      include API::V1::ExceptionsHandler

      version 'v1'

      mount API::V1::Users
      mount API::V1::Posts
    end
  end
end

