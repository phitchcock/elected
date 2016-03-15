class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :phone
      t.string :fax
      t.string :image
      t.text :bio
      t.string :facebook
      t.string :twitter
      t.belongs_to :district

      t.timestamps null: false
    end
  end
end
