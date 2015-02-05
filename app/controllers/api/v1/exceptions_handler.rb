module API
  module V1
    module ExceptionsHandler
      extend ActiveSupport::Concern

      included do
        rescue_from :all do |e|
          status = case e
                   when ActiveRecord::RecordInvalid
                     422
                   else
                     400
                   end

          error_response message: e.message, status: status
        end
      end
    end
  end
end
