class TransportBidItem < ApplicationRecord
  belongs_to :transport_bid
  belongs_to :transport_plan_item
  belongs_to :unit_of_measure

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
