require 'rails_helper'

RSpec.describe TransportPlanItem, type: :model do
  subject { create(:transport_plan_item) }
  
  it {is_expected.to(belong_to(:route))}
  it {is_expected.to(belong_to(:transport_plan))}
  it {is_expected.to(belong_to(:unit))}

  it {is_expected.to(validate_presence_of(:planned))}
  it {is_expected.to(validate_presence_of(:quantity))}

  it {is_expected.to(validate_numericality_of(:quantity).is_greater_than(0))}

  it 'validates transport plan is planned or unplanned' do
    regiona = create(:location)
    plan = create(:transport_plan, region: regiona, plan_type: TransportPlan::UNPLANNED)
    plan_item = build(:transport_plan_item)
    expect(plan).not_to(be_valid)  
    expect(plan.errors_full_messages[0]).to eq ""  
  end
end
