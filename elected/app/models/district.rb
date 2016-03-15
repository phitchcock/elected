class District < ActiveRecord::Base
  has_many :supervisors
  has_many :cities
end
