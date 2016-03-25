class Official < ActiveRecord::Base
  belongs_to :city
  has_many :staff_members
end
