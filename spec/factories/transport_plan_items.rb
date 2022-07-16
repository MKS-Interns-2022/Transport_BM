FactoryBot.define do
  factory :transport_plan_item do
    route { nil }
    transport_plan { nil }
    quantity { 1 }
    unit { nil }
    planned { false }
  end
end
