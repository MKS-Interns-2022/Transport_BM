class TransportBidItemSerializer < ActiveModel::Serializer
    attributes :id, :quantity, :transport_bid_reference_no, :unit_of_measure_name
    has_one :transport_plan_item
  end