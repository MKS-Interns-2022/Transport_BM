class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name, null: false
      t.references :region, null: false, foreign_key: {to_table: :locations}
      t.references :source, null: false, foreign_key: {to_table: :locations}
      t.references :destination, null: false, foreign_key: {to_table: :locations}

      t.timestamps
    end
  end
end
