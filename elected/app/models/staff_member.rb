class StaffMember < ActiveRecord::Base
  belongs_to :official

  validates :name, :email, :title, presence: true
end
