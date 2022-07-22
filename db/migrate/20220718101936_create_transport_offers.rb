class CreateTransportOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_offers do |t|
      t.references :transport_bid, null: false, foreign_key: true
      t.references :transporter, null: false, foreign_key: true
      t.date :offer_date, null:false

      t.timestamps
    end
  end
end
