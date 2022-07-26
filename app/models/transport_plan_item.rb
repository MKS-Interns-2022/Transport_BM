class TransportPlanItem < ApplicationRecord
  belongs_to :route
  belongs_to :transport_plan
  belongs_to :unit, class_name: 'UnitOfMeasure'

  validates :quantity, :planned, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}

  delegate(:name, to: :route, prefix: true)
  delegate(:reference_no, to: :transport_plan, prefix: true)
  delegate(:name, to: :unit, prefix: true)

end
