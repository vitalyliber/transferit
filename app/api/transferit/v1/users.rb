module Transferit
  module V1
    class Users < Grape::API
      format :json

      resource :users do

        desc 'Register user or authorization'
        params do
          requires :phone, type: Integer, default: 89008003344, desc: 'User phone number'
          requires :first_name, type: String, default: 'Banana', desc: 'First name for user'
          requires :last_name, type: String, default: 'Rich', desc: 'Last name for user'
        end

        post 'auth' do
          user = MobileUser.find_or_create_by(phone: params[:phone])

          user.update(first_name: params[:first_name], last_name: params[:last_name]) if user.new_record?

          {user_id: user.id}
        end

      end

    end
  end
end

