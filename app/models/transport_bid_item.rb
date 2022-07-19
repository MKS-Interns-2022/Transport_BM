class TransportBidItem < ApplicationRecord
  belongs_to :transport_bid
  belongs_to :transport_plan_item
  belongs_to :unit_of_measure
end
