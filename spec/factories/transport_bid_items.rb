FactoryBot.define do
  factory :transport_bid_item do
    transport_bid { nil }
    transport_plan_item { nil }
    quantity { 1 }
    unit_of_measure { nil }
  end
end
