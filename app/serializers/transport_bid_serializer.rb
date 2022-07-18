class TransportBidSerializer < ActiveModel::Serializer
    attributes :id, :reference_no, :description, :start_date, :end_date, :opening_date, :status, :bid_bond_amount
    has_one :transport_plan
  end