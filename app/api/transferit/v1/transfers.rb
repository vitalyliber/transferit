module Transferit
  module V1
    class Transfers < Grape::API
      format :json

      resource :transfers do

        desc 'Get Transfers'
        params do
          requires :from, type: String, default: 'Moscow', desc: 'Transfers from'
          requires :to, type: String, default: 'Novosibirsk', desc: 'Transfers to'
          optional :date, type: String, default: Time.now.to_date, desc: 'Transfers date'
          optional :type, type: Symbol, default: :send, values: [:send, :necessary], desc: 'Transfers type'
        end

        post do
          {transfers: {hello: 'wow'}}
        end

      end
    end
  end
end
