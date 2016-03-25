class ChangeColumnNameOfficials < ActiveRecord::Migration
  def change
    #change_column :officials, :city, :string
    rename_column :officials, :city, :city_code
  end
end
