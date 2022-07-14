require 'rails_helper'

RSpec.describe "TransportersController", type: :request do
  let(:valid_attributes) do
    {
      code: Faker::Code.npi,
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      contact_phone: Faker::PhoneNumber.cell_phone_in_e164
    }
  end

  let(:invalid_attributes) do
    {
      code: nil,
      name: Faker::Name.name,
      address: Faker::Address.street_address,
      contact_phone: Faker::PhoneNumber.cell_phone_in_e164
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it 'renders a successful response' do
      3.times { create(:transporter) }
      get transporters_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data'].count).to eq 5
    end
  end

  
  describe "GET /show" do
    it 'renders a successful response' do
      transporter = create(:transporter)
      get transporter_url(transporter), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq transporter.id
      expect(result['data'].count).to eq 5
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new transporter' do
        expect do
          post transporters_url,
          params: { transporter: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Transporter, :count).by(1)
      end

      it 'renders a JSON response with the new transporter' do
        post transporters_url,
        params: { transporter: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_truthy
        expect(result['data'].count).to eq 5
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Transporter' do
        expect do
          post transporters_url,
          params: { transporter: invalid_attributes }, as: :json
        end.to change(Transporter, :count).by(0)
      end

      it 'renders a JSON response with errors for the new Transporter' do
        post transporters_url,
        params: { transporter: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_falsey
        expect(result['error']).to eq "Code can't be blank"
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: Faker::Name.name
        }
      end

      it 'updates the requested transporter' do
        transporter = create(:transporter)
        expect(transporter.name).not_to eq new_attributes[:name]
        patch transporter_url(transporter),
        params: { transporter: new_attributes }, headers: valid_headers, as: :json
        transporter.reload
        expect(transporter.name).to eq new_attributes[:name]
      end

      it 'renders a JSON response with the tranporter' do
        transporter = create(:transporter)
        patch transporter_url(transporter),
        params: { transporter: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_truthy
        expect(result['data'].count).to eq 5
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the transporter' do
        transporter = create(:transporter)
        patch transporter_url(transporter),
        params: { transporter: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        result = JSON(response.body)
        expect(result['success']).to be_falsey
        expect(result['error']).to eq "Code can't be blank"
      end
    end
  end


end
