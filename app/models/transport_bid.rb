class TransportBid < ApplicationRecord
  OPEN = 'Open'.freeze
  CLOSED = 'Closed'.freeze
  EVALUATED = 'Evaluated'.freeze
  STATUSES = [OPEN, CLOSED, EVALUATED].freeze
  
  belongs_to :transport_plan
  validates :reference_no, :start_date, :end_date, :opening_date, :status, :bid_bond_amount, presence: true
  validates :bid_bond_amount, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: STATUSES }
  validates :reference_no, uniqueness: {case_sensitive: false}


end
