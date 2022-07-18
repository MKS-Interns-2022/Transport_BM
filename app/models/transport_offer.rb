class TransportOffer < ApplicationRecord
  belongs_to :transport_bid
  belongs_to :transporter

  validates :offer_date, presence: true
end
