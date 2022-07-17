class CreateTransportBids < ActiveRecord::Migration[7.0]
  def change
    create_table :transport_bids do |t|
      t.string :reference_no, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.date :opening_date, null: false
      t.string :status, null: false
      t.integer :bid_bond_amount, null: false
      t.references :transport_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
