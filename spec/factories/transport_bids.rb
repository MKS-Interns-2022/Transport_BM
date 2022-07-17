FactoryBot.define do
  factory :transport_bid do
    reference_no { "MyString" }
    description { "MyText" }
    start_date { "2022-07-17" }
    end_date { "2022-07-17" }
    opening_date { "2022-07-17" }
    status { "MyString" }
    bid_bond_amount { 1 }
    transport_plan { nil }
  end
end
