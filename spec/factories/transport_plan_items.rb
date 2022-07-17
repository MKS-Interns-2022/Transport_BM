FactoryBot.define do
  factory :transport_plan_item do
    route factory: :route
    transport_plan factory: :transport_plan
    quantity { 1 }
    unit factory: :unit_of_measure
    planned { true }
  end
end
