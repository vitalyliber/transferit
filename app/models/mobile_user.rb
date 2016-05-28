class MobileUser < ActiveRecord::Base
  validates :phone, presence: :true
end
