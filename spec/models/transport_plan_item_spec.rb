require 'rails_helper'

RSpec.describe TransportPlanItem, type: :model do
  subject { create(:transport_plan_item) }
  
  it {is_expected.to(belong_to(:route))}
  it {is_expected.to(belong_to(:transport_plan))}
  it {is_expected.to(belong_to(:unit))}

  #it {is_expected.to(validate_presence_of(:planned))}
  it {is_expected.to(validate_presence_of(:quantity))}

  it {is_expected.to(validate_numericality_of(:quantity).is_greater_than(0))}
end
