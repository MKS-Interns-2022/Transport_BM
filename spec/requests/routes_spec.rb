RSpec.describe "/routes", type: :request do

  let(:valid_attributes) do
    test_location1 = Location.create({
      code: Faker::Code.npi,
      name: Faker::Name.name,
      location_type: Location::REGION ,
      description: Faker::Lorem.paragraph,
      ancestry: nil
    })

    test_location2 = Location.create({
      code: Faker::Code.npi,
      name: Faker::Name.name,
      location_type: Location::REGION ,
      description: Faker::Lorem.paragraph,
      ancestry: nil
    })

    {
    name: Faker::Lorem.word,
    region_id: test_location1[:id],
    source_id: test_location1[:id],
    destination_id: test_location2[:id]
    }
  end

  let(:invalid_attributes) do 
    {
      name: Faker::Lorem.word,
      region_id: nil,
      source_id: nil,
      destination_id: nil
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      3.times {create(:route)}
      get routes_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      route = create(:route)
      get route_url(route), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq route.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "Creates a new Route" do
        expect do
          post routes_url,
               params: { route: valid_attributes }, as: :json
        end.to change(Route, :count).by(1)
      end

      it "renders a JSON response with the new route" do
        post routes_url,
             params: { route: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Route" do
        expect do
          post routes_url,
               params: { route: invalid_attributes }, as: :json
        end.to change(Route, :count).by(0)
      end

      it "renders a JSON response with errors for the new route" do
        post routes_url,
             params: { route: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: Faker::Lorem.word
        }
      }

      it "updates the requested route" do
        route = Route.create! valid_attributes
        patch route_url(route),
              params: { route: new_attributes }, as: :json
        route.reload
        expect(route.name).to eq new_attributes[:name]
      end

      it "renders a JSON response with the route" do
        route = Route.create! valid_attributes
        patch route_url(route),
              params: { route: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the route" do
        route = Route.create! valid_attributes
        patch route_url(route),
              params: { route: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  # describe "DELETE /destroy" do
  #   it "destroys the requested class_room" do
  #     class_room = ClassRoom.create! valid_attributes
  #     expect {
  #       delete class_room_url(class_room), headers: valid_headers, as: :json
  #     }.to change(ClassRoom, :count).by(-1)
  #   end
  # end
end

