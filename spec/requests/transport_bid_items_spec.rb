RSpec.describe "/transport_bid_items", type: :request do

  let(:valid_attributes) do
    {
      transport_bid_id: create(:transport_bid).id,
      transport_plan_item_id: create(:transport_plan_item).id,
      quantity: Faker::Number.positive,
      unit_of_measure_id: create(:unit_of_measure).id 
    }
  end

  let(:invalid_attributes) do 
    {
      transport_bid_id: nil,
      transport_plan_item_id: nil,
      quantity: Faker::Number.positive,
      unit_of_measure_id: nil
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      3.times {create(:transport_bid_item)}
      get transport_bid_items_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transport_bid_item = create(:transport_bid_item)
      get transport_bid_item_url(transport_bid_item), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq transport_bid_item.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "Creates a new TransportBidItem" do
        expect do
          post transport_bid_items_url,
               params: { transport_bid_item: valid_attributes }, as: :json
        end.to change(TransportBidItem, :count).by(1)
      end

      it "renders a JSON response with the new transport_bid_item" do
        post transport_bid_items_url,
             params: { transport_bid_item: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TransportBidItem" do
        expect do
          post transport_bid_items_url,
               params: { transport_bid_item: invalid_attributes }, as: :json
        end.to change(TransportBidItem, :count).by(0)
      end

      it "renders a JSON response with errors for the new transport_bid_item" do
        post transport_bid_items_url,
             params: { transport_bid_item: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          transport_bid_id: create(:transport_bid).id
        }
      }

      it "updates the requested transport_bid_item" do
        transport_bid_item = TransportBidItem.create! valid_attributes
        patch transport_bid_item_url(transport_bid_item),
              params: { transport_bid_item: new_attributes }, as: :json
        transport_bid_item.reload
        expect(transport_bid_item.transport_bid_id).to eq new_attributes[:transport_bid_id]
      end

      it "renders a JSON response with the transport_bid_item" do
        transport_bid_item = TransportBidItem.create! valid_attributes
        patch transport_bid_item_url(transport_bid_item),
              params: { transport_bid_item: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the transport_bid_item" do
        transport_bid_item = TransportBidItem.create! valid_attributes
        patch transport_bid_item_url(transport_bid_item),
              params: { transport_bid_item: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  # describe "DELETE /destroy" do
  #   it "destroys the requested transport_bid_item" do
  #     transport_bid_item = TransportBidItem.create! valid_attributes
  #     expect {
  #       delete transport_bid_item_url(transport_bid_item), headers: valid_headers, as: :json
  #     }.to change(TransportBidItem, :count).by(-1)
  #   end
  # end
end