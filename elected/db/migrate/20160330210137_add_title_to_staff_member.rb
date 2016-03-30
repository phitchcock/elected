class AddTitleToStaffMember < ActiveRecord::Migration
  def change
    add_column :staff_members, :title, :string
  end
end
