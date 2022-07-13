class CreateTransporters < ActiveRecord::Migration[7.0]
  def change
    create_table :transporters do |t|
      t.string :code
      t.string :name
      t.string :address
      t.string :contact_phone

      t.timestamps
    end
  end
end
