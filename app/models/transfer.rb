class Transfer < ActiveRecord::Base
  enum transfer_type: [:post, :necessary]
  validates :description, :from, :to, :date, :time, :transfer_type, presence: :true

  belongs_to :from, class_name: 'City', foreign_key: 'from_id'
  belongs_to :to, class_name: 'City', foreign_key: 'to_id'
end
