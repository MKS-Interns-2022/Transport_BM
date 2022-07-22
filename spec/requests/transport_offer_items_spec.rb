require 'rails_helper'

RSpec.describe "TransportOfferItems", type: :request do
  
  let(:valid_attributes) do
    {
      transport_offer_id: create(:transport_offer).id,
      transport_bid_item_id: create(:transport_bid_item).id,
      price: Faker::Number.positive,
      winner: nil,
      rank: Faker::Number.between(from: 1, to: 1000)
    }
  end

  let(:invalid_attributes) do 
    {
      transport_offer_id: nil,
      transport_bid_item_id: create(:transport_bid_item).id,
      price: Faker::Number.positive,
      winner: nil,
      rank: Faker::Number.between(from: 1, to: 1000)
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      3.times {create(:transport_offer_item)}
      get transport_offer_items_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transport_offer_item = create(:transport_offer_item)
      get transport_offer_item_url(transport_offer_item), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq transport_offer_item.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "Creates a new TransportOfferItem" do
        expect do
          post transport_offer_items_url,
               params: { transport_offer_item: valid_attributes }, as: :json
        end.to change(TransportOfferItem, :count).by(1)
      end

      it "renders a JSON response with the new transport_offer_item" do
        post transport_offer_items_url,
             params: { transport_offer_item: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TransportOfferItem" do
        expect do
          post transport_offer_items_url,
               params: { transport_offer_item: invalid_attributes }, as: :json
        end.to change(TransportOfferItem, :count).by(0)
      end

      it "renders a JSON response with errors for the new transport_offer_item" do
        post transport_offer_items_url,
             params: { transport_offer_item: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          price: Faker::Number.number
        }
      end

      it 'updates the requested transport_offer_item' do
        transport_offer_item = create(:transport_offer_item)
        expect(transport_offer_item.price).not_to eq new_attributes[:price]
        patch transport_offer_item_url(transport_offer_item),
        params: { transport_offer_item: new_attributes }, headers: valid_headers, as: :json
        transport_offer_item.reload
        expect(transport_offer_item.price).to eq new_attributes[:price]
      end

      it 'renders a JSON response with the transport_offer_item' do
        transport_offer_item = create(:transport_offer_item)
        patch transport_offer_item_url(transport_offer_item),
        params: { transport_offer_item: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_truthy
        expect(result['data'].count).to eq 6
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the transport_offer_item' do
        transport_offer_item = create(:transport_offer_item)
        patch transport_offer_item_url(transport_offer_item),
        params: { transport_offer_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_falsey
        expect(result['error']).to eq "Transport offer must exist"
      end
    end
  end

  
end
