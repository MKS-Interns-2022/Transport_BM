class TransportPlan < ApplicationRecord
  belongs_to :region, class_name: 'Location'

  PLANNED = 'Planned'.freeze
  UNPLANNED = 'Unplanned'.freeze

  PLAN_TYPES = [PLANNED, UNPLANNED].freeze


  validates :reference_no, :plan_type, presence: true
  validates :reference_no,  uniqueness: true

  validates :plan_type,  inclusion: {in: PLAN_TYPES}
  
  validate :validates_location_type
  def validates_location_type
    return unless region
    return if region.location_type == "Region"
    errors.add(:base, "Location can only be a Region.") if region.location_type != 'Region'
  end
  
end
