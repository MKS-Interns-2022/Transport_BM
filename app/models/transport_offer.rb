class TransportOffer < ApplicationRecord
  belongs_to :transport_bid
  belongs_to :transporter

  validates :offer_date, presence: true

  delegate(:transport_bid_id, to: :transport_bid, prefix: true)
  delegate(:transporter_id, to: :transporter, prefix: true)
  delegate(:transporter_name, to: :transporter, prefix: true)
end
