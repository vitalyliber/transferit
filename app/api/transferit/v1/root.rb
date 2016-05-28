module Transferit
  module V1
    class Root < Grape::API
      version 'v1', using: :path

      rescue_from ActiveRecord::RecordNotFound do |e|
        rack_response({ message: e.message, status: 404 }.to_json, 404)
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        rack_response e.to_json, 400
      end

      rescue_from :all do |e|
        raise e
      end

      mount Transferit::V1::Transfers
      mount Transferit::V1::Users
      mount Transferit::V1::Comments

      add_swagger_documentation api_version: "v1", mount_path: "/"
    end
  end
end
