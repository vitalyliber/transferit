class MobileUser < ActiveRecord::Base
  validates :phone, :first_name, :last_name, presence: :true
end
