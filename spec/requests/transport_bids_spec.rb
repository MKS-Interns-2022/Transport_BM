RSpec.describe "/transport_bids", type: :request do

  let(:valid_attributes) do
    {
    reference_no: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    start_date: Faker::Date.in_date_period,
    end_date: Faker::Date.in_date_period,
    opening_date: Faker::Date.in_date_period,
    status: TransportBid::OPEN,
    bid_bond_amount: Faker::Number.positive,
    transport_plan_id: create(:transport_plan).id
    }
  end

  let(:invalid_attributes) do 
    {
      reference_no: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      start_date: Faker::Date.in_date_period,
      end_date: Faker::Date.in_date_period,
      opening_date: Faker::Date.in_date_period,
      status: TransportBid::OPEN,
      bid_bond_amount: Faker::Number.positive,
      transport_plan_id: nil
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      3.times {create(:transport_bid)}
      get transport_bids_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transport_bid = create(:transport_bid)
      get transport_bid_url(transport_bid), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq transport_bid.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "Creates a new TransportBid" do
        expect do
          post transport_bids_url,
               params: { transport_bid: valid_attributes }, as: :json
        end.to change(TransportBid, :count).by(1)
      end

      it "renders a JSON response with the new transport_bid" do
        post transport_bids_url,
             params: { transport_bid: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TransportBid" do
        expect do
          post transport_bids_url,
               params: { transport_bid: invalid_attributes }, as: :json
        end.to change(TransportBid, :count).by(0)
      end

      it "renders a JSON response with errors for the new transport_bid" do
        post transport_bids_url,
             params: { transport_bid: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          reference_no: Faker::Lorem.word,
        }
      }

      it "updates the requested transport_bid" do
        transport_bid = TransportBid.create! valid_attributes
        patch transport_bid_url(transport_bid),
              params: { transport_bid: new_attributes }, as: :json
        transport_bid.reload
        expect(transport_bid.reference_no).to eq new_attributes[:reference_no]
      end

      it "renders a JSON response with the transport_bid" do
        transport_bid = TransportBid.create! valid_attributes
        patch transport_bid_url(transport_bid),
              params: { transport_bid: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the transport_bid" do
        transport_bid = TransportBid.create! valid_attributes
        patch transport_bid_url(transport_bid),
              params: { transport_bid: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  # describe "DELETE /destroy" do
  #   it "destroys the requested transport_bid" do
  #     transport_bid = TransportBid.create! valid_attributes
  #     expect {
  #       delete transport_bid_url(transport_bid), headers: valid_headers, as: :json
  #     }.to change(TransportBid, :count).by(-1)
  #   end
  # end
end