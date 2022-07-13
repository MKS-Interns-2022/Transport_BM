FactoryBot.define do
  factory :location do
    code { FFaker::Code.npi }
    name { FFaker::Name.name }
    location_type { Location::REGION }
    description { FFaker::Lorem.paragraph }
    ancestry { nil }
  end
end
