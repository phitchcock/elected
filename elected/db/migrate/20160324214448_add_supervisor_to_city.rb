class AddSupervisorToCity < ActiveRecord::Migration
  def change
    add_reference :supervisors, :city, index: true, foreign_key: true
  end
end
