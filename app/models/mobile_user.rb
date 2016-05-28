class MobileUser < ActiveRecord::Base
  validates :phone, presence: :true
  has_many :comments, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'target_id'
end
