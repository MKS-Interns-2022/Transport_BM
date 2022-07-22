class TransportPlanItem < ApplicationRecord
  belongs_to :route
  belongs_to :transport_plan
  belongs_to :unit, class_name: 'UnitOfMeasure'

  validates :quantity, :planned, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}
  validate :validates_plan_type

  def validates_plan_type
    return unless transport_plan
    return if transport_plan.plan_type == TransportPlan::PLANNED
    errors.add(:base, "PlanType can't be unplanned.") if transport_plan.plan_type != TransportPlan::PLANNED
  end
end
