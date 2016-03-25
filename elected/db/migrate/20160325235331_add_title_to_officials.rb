class AddTitleToOfficials < ActiveRecord::Migration
  def change
    add_column :officials, :title, :string
  end
end
