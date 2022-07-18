FactoryBot.define do
  factory :transport_bid do
    reference_no { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    start_date { Faker::Date.in_date_period }
    end_date { Faker::Date.in_date_period }
    opening_date { Faker::Date.in_date_period }
    status { TransportBid::OPEN }
    bid_bond_amount { Faker::Number.positive }
    transport_plan { nil }
  end
end
