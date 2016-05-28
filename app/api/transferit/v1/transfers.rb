module Transferit
  module V1
    class Transfers < Grape::API
      format :json

      resource :transfers do

        desc 'Get Transfers'
        params do
          requires :from, type: String, default: 'Moscow', desc: 'Transfers from'
          requires :to, type: String, default: 'Novosibirsk', desc: 'Transfers to'
          optional :date, type: String, default: Time.now, desc: 'Transfers date'
        end

        post do
          {transfers: {hello: 'wow'}}
        end

      end
    end
  end
end
