require 'rails_helper'

RSpec.describe "TransportOffers", type: :request do
  let(:valid_attributes) do
    {
      transport_bid_id: create(:transport_bid).id,
      transporter_id: create(:transporter).id,
      offer_date: Faker::Date.in_date_period
    }
  end

  let(:invalid_attributes) do
    {
      transport_bid_id: create(:transport_bid).id,
      transporter_id: nil,
      offer_date: Faker::Date.in_date_period,
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it 'renders a successful response' do
      3.times { create(:transport_offer) }
      get transport_offers_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data'].count).to eq 3
    end
  end

  
  describe "GET /show" do
    it 'renders a successful response' do
      transport_offer = create(:transport_offer)
      get transport_offer_url(transport_offer), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq transport_offer.id
      expect(result['data'].count).to eq 4
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new transporter' do
        expect do
          post transport_offers_url, params: {transport_offer: valid_attributes}, headers: valid_headers, as: :json
        end.to change(TransportOffer, :count).by(1)
      end

      it 'renders a JSON response with the new transporter' do
        post transport_offers_url, params: { transport_offer: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_truthy
        expect(result['data'].count).to eq 4
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Transporter' do
        expect do
          post transport_offers_url, params: { transport_offer: invalid_attributes }, as: :json
        end.to change(TransportOffer, :count).by(0)
      end

      it 'renders a JSON response with errors for the new Transporter' do
        post transport_offers_url, params: { transport_offer: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_falsey
        expect(result['error']).to eq "Transporter must exist"
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          offer_date: Faker::Date.in_date_period(year: 2019, month: 2)
        }
      end

      it 'updates the requested transporter' do
        transport_offer = create(:transport_offer)
        expect(transport_offer.offer_date).not_to eq new_attributes[:offer_date]
        patch transport_offer_url(transport_offer), params: { transport_offer: new_attributes }, headers: valid_headers, as: :json
        transport_offer.reload
        expect(transport_offer.offer_date).to eq new_attributes[:offer_date]
      end

      it 'renders a JSON response with the tranporter' do
        transport_offer = create(:transport_offer)
        patch transport_offer_url(transport_offer), params: { transport_offer: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_truthy
        expect(result['data'].count).to eq 4
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the transporter' do
        transport_offer = create(:transport_offer)
        patch transport_offer_url(transport_offer), params: { transport_offer: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_falsey
        expect(result['error']).to eq "Transporter must exist"
      end
    end
  end
end
