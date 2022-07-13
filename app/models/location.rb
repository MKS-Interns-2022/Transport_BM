class Location < ApplicationRecord
  REGION = 'Region'.freeze
  ZONE = 'Zone'.freeze
  WOREDA = 'Woreda'.freeze
  FDP = 'Fdp'.freeze
  HUB = 'Hub'.freeze
  WAREHOUSE = 'Warehouse'.freeze

  LOCATION_TYPES = [REGION, ZONE, WOREDA, FDP, HUB, WAREHOUSE].freeze

  has_ancestry
end
