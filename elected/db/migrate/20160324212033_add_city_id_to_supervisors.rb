class AddCityIdToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :city_id, :integer
  end
end
