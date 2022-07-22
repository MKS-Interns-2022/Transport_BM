FactoryBot.define do
  factory :transport_bid_item do
    transport_bid factory: :transport_bid
    transport_plan_item factory: :transport_plan_item
    quantity { Faker::Number.positive }
    unit_of_measure factory: :unit_of_measure
  end
end
