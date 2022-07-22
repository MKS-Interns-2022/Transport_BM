FactoryBot.define do
  factory :transport_offer_item do
    transport_offer factory: :transport_offer
    transport_bid_item factory: :transport_bid_item
    price { Faker::Number.positive }
    winner { nil }
    rank { Faker::Number.between(from: 1, to: 1000) }

  end
end
