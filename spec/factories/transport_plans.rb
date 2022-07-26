FactoryBot.define do
  factory :transport_plan do
    reference_no { Faker::Code.npi }
    plan_type { TransportPlan::REGIONAL }
    region factory: :location
  end
end
