class Parcel < ActiveRecord::Base
  validates :description, :date, :user, :from, :to, presence: :true
  belongs_to :user
  belongs_to :from, class_name: 'City', foreign_key: 'from_id'
  belongs_to :to, class_name: 'City', foreign_key: 'to_id'
end
