require 'rails_helper'

RSpec.describe UnitOfMeasure, type: :model do
  subject { create(:unit_of_measure) }
  
  it { is_expected.to(validate_presence_of(:name))}
  it { is_expected.to(validate_presence_of(:abreviation))}
  it { is_expected.to(validate_presence_of(:unit_type))}

  it { is_expected.to(validate_inclusion_of(:unit_type).in_array(UnitOfMeasure::UNIT_TYPES))}
end
