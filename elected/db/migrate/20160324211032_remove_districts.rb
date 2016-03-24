class RemoveDistricts < ActiveRecord::Migration
  def change
    drop_table :districts
    remove_column :cities, :district_id
    remove_column :supervisors, :district_id
  end
end
