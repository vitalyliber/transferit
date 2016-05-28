class Comment < ActiveRecord::Base
  validates :description, :star, :author, :target, presence: :true
  validates :star, inclusion: { in: (1..5).to_a }
  validates :description, length: { in: 10..200 }
  belongs_to :author, class_name: 'MobileUser', foreign_key: 'author_id'
  belongs_to :target, class_name: 'MobileUser', foreign_key: 'target_id'
end