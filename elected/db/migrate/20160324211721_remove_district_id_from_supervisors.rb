class RemoveDistrictIdFromSupervisors < ActiveRecord::Migration
  def change
    remove_column :supervisors, :district_id
  end
end
