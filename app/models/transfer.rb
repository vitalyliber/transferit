class Transfer < ActiveRecord::Base
  validates :description, :from, :to, :date, :time, :user, presence: :true

  belongs_to :from, class_name: 'City', foreign_key: 'from_id'
  belongs_to :to, class_name: 'City', foreign_key: 'to_id'
  belongs_to :user, dependent: :destroy
end
