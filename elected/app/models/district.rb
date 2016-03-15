class District < ActiveRecord::Base
  has_one :supervisor
  has_many :cities
end
