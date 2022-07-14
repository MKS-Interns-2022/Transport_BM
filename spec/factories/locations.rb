FactoryBot.define do
  factory :location do
    code { Faker::Code.npi }
    name { Faker::Name.name }
    location_type { Location::REGION }
    description { Faker::Lorem.paragraph }
    ancestry { nil }
  end
end
