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
            model.time.try(:strftime, '%H:%M')
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

        desc 'Create Parcel'
        params do
          requires :from, type: Integer, default: 1, desc: 'City id'
          requires :to, type: Integer, default: 2, desc: 'City id'
          requires :user, type: Integer, default: 1, desc: 'User id'
          requires :description, type: String, default: 'Hello...', desc: 'Comment for parcel'
          requires :date, type: String, default: Time.now.to_date, desc: 'Parcel date'
        end
        post 'create_parcel' do
          parcel = Parcel.new(
                     from: City.find(params[:from]),
                     to: City.find(params[:to]),
                     user: MobileUser.find(params[:user]),
                     description: params[:description],
                     date: params[:date]
          )

          error!('Invalid Parcel', 400) unless parcel.valid?

          parcel.save

          {parcel_id: parcel.id}
        end

        desc 'Create Transfer'
        params do
          requires :from, type: Integer, default: 1, desc: 'City id'
          requires :to, type: Integer, default: 2, desc: 'City id'
          requires :user, type: Integer, default: 1, desc: 'User id'
          requires :description, type: String, default: 'Hello...', desc: 'Comment for transfer'
          requires :date, type: String, default: Time.now.to_date, desc: 'Transfers date'
          requires :time, type: String, default: '11:05', desc: 'Transfers date'
        end
        post 'create_transfer' do
          transfer = Transfer.new(
              from: City.find(params[:from]),
              to: City.find(params[:to]),
              user: MobileUser.find(params[:user]),
              description: params[:description],
              date: params[:date],
              time: params[:time]
          )

          error!('Invalid Transfer', 400) unless transfer.valid?

          transfer.save

          {transfer_id: transfer.id}
        end

        desc 'Find Parcel'
        params do
          requires :parcel_id, type: Integer, default: 1, desc: 'Parcel id'
        end
        post 'find_parcel' do
          parcel = Parcel.find_by(id: params[:parcel_id])

          present parcel, with: Transferit::V1::Entities::Parcels
        end

        desc 'Find Transfer'
        params do
          requires :transfer_id, type: Integer, default: 1, desc: 'Transfer id'
        end
        post 'find_transfer' do
          transfer = Transfer.find_by(id: params[:transfer_id])

          present transfer, with: Transferit::V1::Entities::Transfers
        end

      end
    end
  end
end
