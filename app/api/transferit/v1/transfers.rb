module Transferit
  module V1
    module Entities
      class Parcels < Grape::Entity
        expose :parcel do
          expose :description
          expose :from_id
          expose :to_id
          expose :date
          expose :user_id
        end
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
        end

        post do
          transfers = Transfer.where(from: params[:from],
                                     to: params[:to])

          transfers = transfers.where(date: params[:date]) if params[:date].present?

          present transfers, with: Transferit::V1::Entities::Transfers, root: 'transfers'
        end

        desc 'Get Parcels'
        params do
          requires :from, type: Integer, default: 1, desc: 'City id'
          requires :to, type: Integer, default: 2, desc: 'City id'
          optional :date, type: String, default: Time.now.to_date, desc: 'Transfers date'
        end

        post 'parcels' do
          parcels = Parcel.where(from: params[:from],
                                     to: params[:to],
                                     date: params[:date])

          parcels = parcels.where(date: params[:date]) if params[:date].present?

          present parcels, with: Transferit::V1::Entities::Parcels, root: 'parcels'
        end

      end
    end
  end
end
