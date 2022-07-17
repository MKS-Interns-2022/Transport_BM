class CreateTransportBids < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_bids do |t|
      t.string :reference_no
      t.text :description
      t.date :start_date
      t.date :end_date
      t.date :opening_date
      t.string :status
      t.integer :bid_bond_amount
      t.references :transport_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
