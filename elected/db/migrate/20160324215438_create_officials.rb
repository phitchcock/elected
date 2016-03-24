class CreateOfficials < ActiveRecord::Migration
  def change
    create_table :officials do |t|
      t.string :name
      t.string :image
      t.references :city, index: true, foreign_key: true

      t.timestamps
    end
  end
end
