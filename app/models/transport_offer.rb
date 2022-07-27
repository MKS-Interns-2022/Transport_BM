class TransportOffer < ApplicationRecord
  belongs_to :transport_bid
  belongs_to :transporter

  validates :offer_date, presence: true

  delegate(:reference_no, to: :transport_bid, prefix: true)
  delegate(:code, to: :transporter, prefix: true) 
end
