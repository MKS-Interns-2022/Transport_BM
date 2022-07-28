class TransportOfferItemSerializer < ActiveModel::Serializer
  attributes :id, :price, :winner, :rank, :transport_bid_item_id
  has_one :transport_offer_id
end
