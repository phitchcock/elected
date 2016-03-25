class ChangeCityInOfficials < ActiveRecord::Migration
  def change
    change_column :officials, :city, :city_code
  end
end
