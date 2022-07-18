FactoryBot.define do
  factory :transport_offer do
    transport_bid { nil }
    transporter { nil }
    offer_date { "2022-07-18" }
  end
end
