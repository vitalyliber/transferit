module Transferit
  module V1
    module Entities
      class Users < Grape::Entity
        expose :id
        expose :star
        expose :first_name
        expose :last_name
        expose :phone
        expose :avatar
      end
    end
    class Users < Grape::API
      format :json

      resource :users do

        desc 'Register user or authorization'
        params do
          requires :phone, type: Integer, default: 89008003344, desc: 'User phone number'
        end

        post 'auth' do
          user = MobileUser.find_or_create_by(phone: params[:phone])

          {user_id: user.id}
        end

        params do
          requires :first_name, type: String, desc: 'First name for user'
          requires :last_name, type: String, desc: 'Last name for user'
          requires :user_id, type: Integer, desc: 'User id'
        end

        post 'update_profile' do
          user = MobileUser.find_by_id(params[:user_id])

          user.update(first_name: params[:first_name], last_name: params[:last_name])

          {user_id: user.id, first_name: user.first_name, last_name: user.last_name}
        end

        desc 'Info about user'
        params do
          requires :user_id, type: Integer, desc: 'User id'
        end
        post 'info' do
          user = MobileUser.find_by_id(params[:user_id])

          present user, with: Transferit::V1::Entities::Users
        end

        desc "Update user avatar"
        params do
          requires :user_id, :type => Integer, :desc => "User id"
          requires :avatar, :type => Rack::Multipart::UploadedFile, :desc => "User avatar"
        end
        post 'avatar' do
          avatar_file = File.open(params[:avatar].tempfile.path)
          user = MobileUser.find_by_id(params[:user_id])
          user.avatar = avatar_file
          user.save
        end

      end

    end
  end
end

