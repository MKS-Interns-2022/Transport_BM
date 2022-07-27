class TransportOfferSerializer < ActiveModel::Serializer
  attributes :id, :offer_date, :transport_bid_reference_no, :transporter_code
end
