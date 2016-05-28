module Transferit
  module V1
    class Users < Grape::API
      format :json

      resource :users do

        desc 'Register user or authorization'
        params do
          requires :phone, type: Integer, default: 89008003344, desc: 'User phone number'
        end

        post do
        end

      end

    end
  end
end

