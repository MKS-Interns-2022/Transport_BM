class Location < ApplicationRecord
  REGION = 'Region'.freeze
  ZONE = 'Zone'.freeze
  WOREDA = 'Woreda'.freeze
  FDP = 'Fdp'.freeze
  HUB = 'Hub'.freeze
  WAREHOUSE = 'Warehouse'.freeze

  LOCATION_TYPES = [REGION, ZONE, WOREDA, FDP, HUB, WAREHOUSE].freeze

  has_ancestry

  validates :code, :name, :location_type, presence: true
  validates :code, uniqueness: {case_sensitive: false}
  validates :location_type, inclusion: {in: LOCATION_TYPES}
  validate  :validates_ancestry


  def validates_ancestry
    parents = {
      REGION => [],
      ZONE => [REGION],
      WOREDA => [ZONE, REGION],
      FDP => [WOREDA, ZONE, REGION],
      HUB => [WOREDA, ZONE, REGION],
      WAREHOUSE => [HUB, WOREDA, ZONE, REGION]
    }



    return if location_type.nil? || location_type.empty?

    return if location_type == REGION && parent.nil?

    errors.add(:base, "#{location_type} cannot have a parent") if location_type == REGION && !parent.nil?

    errors.add(:base , 'parent cannot be empty') if parent == nil

    return unless parent

    return if parents[location_type].include?(parent.location_type)

    errors.add(:base, "#{location_type} cannot have #{parent.location_type} as a parent." )


  end

end
