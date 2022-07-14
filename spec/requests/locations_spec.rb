require 'rails_helper'

RSpec.describe "Locations", type: :request do
  let(:valid_attributes) do
    {
      code: Faker::Code.npi ,
      name: Faker::Name.name ,
      location_type: Location::REGION ,
      description: Faker::Lorem.paragraph ,
      ancestry: nil
    }
  end

  let(:invalid_attributes) do
    {
      code: Faker::Code.npi ,
      name: Faker::Name.name ,
      location_type: Location::REGION ,
      description: Faker::Lorem.paragraph ,
      ancestry: Location::ZONE
    }
  end

  describe 'GET /index' do
    it 'renders a succesful response' do
      3.times { create(:location) }
      get locations_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

end
