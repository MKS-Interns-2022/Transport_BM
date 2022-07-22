FactoryBot.define do
  factory :route do
    name { Faker::Lorem.word }
    region factory: :location
    source factory: :location
    destination factory: :location
  end
end
