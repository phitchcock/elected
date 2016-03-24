class RemoveCities < ActiveRecord::Migration
  def change
    drop_table :cities
    drop_table :supervisors
  end
end
