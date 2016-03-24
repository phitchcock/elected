class RemoveCityFromSupervisors < ActiveRecord::Migration
  def change
    remove_column :supervisors, :city_id
  end
end
