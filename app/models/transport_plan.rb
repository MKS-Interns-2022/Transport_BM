class TransportPlan < ApplicationRecord
  belongs_to :region, class_name: 'Location'

  REGIONAL = 'Regional'.freeze
  NON_REGIONAL = 'Non Regional'.freeze

  PLAN_TYPES = [REGIONAL, NON_REGIONAL].freeze


  validates :reference_no, :plan_type, presence: true
  validates :reference_no,  uniqueness: true

  validates :plan_type,  inclusion: {in: PLAN_TYPES}

  delegate(:name, to: :region, prefix: true)  
end
