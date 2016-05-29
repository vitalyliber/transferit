class MobileUser < ActiveRecord::Base
  validates :phone, presence: :true
  has_many :comments, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'target_id'
  has_attached_file :avatar, styles: { thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
