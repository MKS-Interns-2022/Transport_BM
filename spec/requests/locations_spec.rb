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


  describe "GET /show" do
    it 'renders a succesful response' do
      location = create(:location)
      get location_url(location), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq location.id
    end
  end


describe 'POST /create' do
  context "with valid parameters" do
    it "creates a new location" do
      expect {
        post locations_url,
          params: { location: valid_attributes }, as: :json
      }.to change(Location, :count).by(1)
    end

    it "renders a JSON response with a new location" do
      post locations_url,
        params: {location: valid_attributes}, as: :json
      expect(response).to have_http_status(:created)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end

  context "with invalid parameters" do
    it "doesn't create a new location" do
      expect{
        post locations_url,
          params: { location: invalid_attributes }, as: :json
      }.to change(Location, :count).by(0)
    end

    it "renders a JSON response with errors for the new Location" do
      post locations_url,
        params: { location: invalid_attributes }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end

end




end
