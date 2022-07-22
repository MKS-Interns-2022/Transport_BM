class TransportOfferSerializer < ActiveModel::Serializer
  attributes :id, :offer_date
  has_one :transport_bid
  has_one :transporter
end
