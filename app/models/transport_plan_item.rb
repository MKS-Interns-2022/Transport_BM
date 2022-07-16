class TransportPlanItem < ApplicationRecord
  belongs_to :route
  belongs_to :transport_plan
  belongs_to :unit, class_name: 'UnitOfMeasure'
end
