class TransportOfferItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :winner, :rank
  has_one :transport_bid_item
  has_one :transport_offer_id
end
