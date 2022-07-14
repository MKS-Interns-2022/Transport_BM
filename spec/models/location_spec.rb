require 'rails_helper'

RSpec.describe Location, type: :model do
    subject { create(:location) }

    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location_type) }

    it { should validate_uniqueness_of(:code) }

    it { should validate_inclusion_of(:location_type).in_array(Location::LOCATION_TYPES)  }

    it 'validates that parent is nil for region' do
      parent1 = create(:location, location_type: Location::ZONE)
      location1 = create(:location, location_type: Location::REGION, parent: parent1)
      expect(location1).not_to(be_valid)
    end

    it 'validates that each location has a valid parent' do
      parent1 = create(:location, location_type: Location::ZONE)
      location1 = create(:location, location_type:Location::REGION, parent: parent1)
      expect(location1).not_to(be_valid)
    end
end
