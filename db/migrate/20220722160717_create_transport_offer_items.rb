class CreateTransportOfferItems < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_offer_items do |t|
      t.references :transport_offer, null: false, foreign_key: true
      t.references :transport_bid_item, null: false, foreign_key: true
      t.float :price
      t.boolean :winner
      t.integer :rank

      t.timestamps
    end
  end
end
