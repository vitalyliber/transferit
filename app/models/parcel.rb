class Parcel < ActiveRecord::Base
  validates :description, :date, :user, :from, :to, presence: :true
  belongs_to :user
  belongs_to :from, class_name: 'City', foreign_key: 'from_id'
  belongs_to :to, class_name: 'City', foreign_key: 'to_id'
  belongs_to :user, class_name: 'MobileUser', foreign_key: 'user_id', dependent: :destroy
end
