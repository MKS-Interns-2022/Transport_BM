FactoryBot.define do
  factory :unit_of_measure do
    name { Faker::Name.name }
    abreviation { Faker::Lorem.characters(number: 4) }
    unit_type { UnitOfMeasure::WEIGHT }
  end
end
