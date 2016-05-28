class City < ActiveRecord::Base
  validates :title, presence: :true

end
