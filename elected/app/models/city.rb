class City < ActiveRecord::Base
  has_many :officials

  validates :name, :image, presence: true
end
