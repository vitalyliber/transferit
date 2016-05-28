module Transferit
  class API < Grape::API
    prefix    'api'
    format    :json

    rescue_from :all, :backtrace => true

    mount Transferit::V1::Root

    add_swagger_documentation api_version: "v1", mount_path: "/"

  end
end

