FactoryBot.define do
  factory :transport_offer do
    transport_bid 
    transporter
    offer_date { Faker::Date.in_date_period }
  end
end
