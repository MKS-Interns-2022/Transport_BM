require 'rails_helper'

RSpec.describe TransportPlan, type: :model do
  subject { create(:transport_plan) }

  it{is_expected.to(belong_to(:region))}
  it{is_expected.to(validate_presence_of(:reference_no))}
  it{is_expected.to(validate_uniqueness_of(:reference_no).case_insensitive)}
  it{is_expected.to(validate_presence_of(:plan_type))}
  it{is_expected.to(validate_inclusion_of(:plan_type).in_array(TransportPlan::PLAN_TYPES))}

  it 'validates that the plan belongs to a region' do
    regiona = create(:location)
    zone = create(:location, location_type: Location::ZONE, parent: regiona)
    plan = build(:transport_plan, region: zone)
    expect(plan).not_to(be_valid)
    expect(plan.errors.full_messages[0]).to eq "Location can only be a Region."
  end
end
