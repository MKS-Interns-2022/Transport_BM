require 'rails_helper'

RSpec.describe Location, type: :model do
    subject { create(:location) }

    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location_type) }

    it { should validate_uniqueness_of(:code).case_insensitive }

    it { should validate_inclusion_of(:location_type).in_array(Location::LOCATION_TYPES)  }

    it 'validates that parent is nil for region' do
      region = create(:location)
      zone = create(:location, location_type: Location::ZONE, parent: region)
      location1 = build(:location, parent: zone)
      expect(location1).not_to(be_valid)
      expect(location1.errors.full_messages[0]).to eq "Region cannot have a parent"
    end

    it 'validates that each location has a valid parent' do
      region = create(:location)
      zone = create(:location, location_type: Location::ZONE, parent: region)
      woreda = create(:location, location_type: Location::WOREDA, parent: zone)
      location1 = build(:location, location_type:Location::ZONE, parent: woreda)
      expect(location1).not_to(be_valid)
      expect(location1.errors.full_messages[0]).to eq "Zone cannot have Woreda as a parent."
    end
end
