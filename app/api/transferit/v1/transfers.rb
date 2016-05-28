module Transferit
  module V1
    module Entities
      class Languages < Grape::Entity
        expose :title
        expose :code
      end

      class Transfers < Grape::Entity

        expose :transfer do
          expose :description
          expose :from_id
          expose :to_id
          expose :date
          expose :time do |model|
            model.time.strftime('%H:%M')
          end
          expose :user_id
          expose :transfer_type
        end

      end
    end

    class Transfers < Grape::API
      format :json

      resource :transfers do

        desc 'Get Transfers'
        params do
          requires :from, type: Integer, default: 1, desc: 'City id'
          requires :to, type: Integer, default: 2, desc: 'City id'
          optional :date, type: String, default: Time.now.to_date, desc: 'Transfers date'
          optional :type, type: Symbol, default: :post, values: [:post, :necessary], desc: 'Transfers type'
        end

        post do
          transfers = Transfer.where(transfer_type: Transfer.transfer_types[ params[:type] ],
                                     from: params[:from],
                                     to: params[:to],
                                     date: params[:date])

          present transfers, with: Transferit::V1::Entities::Transfers, root: 'transfers'

        end

      end
    end
  end
end
