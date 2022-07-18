class CreateTransportPlanItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_plan_items do |t|
      t.references :route, null: false, foreign_key: true
      t.references :transport_plan, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.references :unit, null: false, foreign_key: {to_table: :unit_of_measures}
      t.boolean :planned, null: false

      t.timestamps
    end
  end
end
