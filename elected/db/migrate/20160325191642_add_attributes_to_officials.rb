class AddAttributesToOfficials < ActiveRecord::Migration
  def change
    add_column :officials, :bio, :text
    add_column :officials, :street, :string
    add_column :officials, :city, :string
    add_column :officials, :state, :string
    add_column :officials, :zip, :string
    add_column :officials, :phone, :string
    add_column :officials, :fax, :string
    add_column :officials, :email, :string
    add_column :officials, :facebook, :string
  end
end
