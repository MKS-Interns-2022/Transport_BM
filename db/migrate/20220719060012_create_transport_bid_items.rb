class CreateTransportBidItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_bid_items do |t|
      t.references :transport_bid, null: false, foreign_key: true
      t.references :transport_plan_item, null: false, foreign_key: true
      t.integer :quantity
      t.references :unit_of_measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
