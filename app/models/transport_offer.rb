class TransportOffer < ApplicationRecord
  belongs_to :transport_bid
  belongs_to :transporter
end
