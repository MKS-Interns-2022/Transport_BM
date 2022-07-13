class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :code, null: false, unique: true
      t.string :name, null: false
      t.string :location_type, null: false
      t.text :description, null: false
      t.string :ancestry, null: false

      t.timestamps
    end
    add_index :locations, :ancestry
  end
end
