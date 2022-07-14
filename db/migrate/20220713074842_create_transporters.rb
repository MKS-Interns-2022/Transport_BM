class CreateTransporters < ActiveRecord::Migration[7.0]
  def change
    create_table :transporters do |t|
      t.string :code, null: false, unique: true
      t.string :name, null:false
      t.string :address, null:false
      t.string :contact_phone, null:false

      t.timestamps
    end
  end
end
