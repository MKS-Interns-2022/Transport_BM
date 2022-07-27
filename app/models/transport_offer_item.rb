class TransportOfferItem < ApplicationRecord
  belongs_to :transport_offer
  belongs_to :transport_bid_item

  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :rank, numericality: { greater_than_or_equal_to: 0 }

  delegate(:transport_bid_item_id, to: :transport_bid_item, prefix: true)
  delegate(:transport_offer_id, to: :transport_offer, prefix: true)

end
