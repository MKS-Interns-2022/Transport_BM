class TransportPlan < ApplicationRecord
  belongs_to :region, class_name: 'Location'

  PLANNED = 'Planned'.freeze
  UNPLANNED = 'Unplanned'.freeze

  PLAN_TYPES = [PLANNED, UNPLANNED].freeze
end
