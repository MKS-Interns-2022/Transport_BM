FactoryBot.define do
  factory :location do
    code { FFaker::Code.npi }
    name { FFaker::Name.name }
    location_type { FFaker::Lorem.word }
    description { FFaker::Lorem.paragraph }
    ancestry { "MyString" }
  end
end
