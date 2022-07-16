class CreateUnitOfMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_of_measures do |t|
      t.string :name, null: false
      t.string :abreviation, null: false
      t.string :unit_type, null: false

      t.timestamps
    end
  end
end
