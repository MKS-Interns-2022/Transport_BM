FactoryBot.define do
  factory :transport_plan do
    reference_no { Faker::Code.npi }
    plan_type { 'Planned' }
    region factory: :location
  end
end
