class TransportBidItemSerializer < ActiveModel::Serializer
    attributes :id, :quantity
    has_one :transport_bid
    has_one :transport_plan_item
    has_one :unit_of_measure
  end