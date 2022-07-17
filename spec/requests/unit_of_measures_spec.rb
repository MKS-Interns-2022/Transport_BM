require 'rails_helper'

RSpec.describe "UnitOfMeasures", type: :request do
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      abreviation: Faker::Lorem.characters(number: 4),
      unit_type: UnitOfMeasure::WEIGHT
    }
  end

  let(:invalid_attributes) do
    {
      name: Faker::Name.name,
      abreviation: Faker::Lorem.characters(number: 4),
      unit_type: Faker::Lorem.word
    }
  end

  describe 'GET /index' do
    it 'renders a succesful response' do
      3.times { create(:unit_of_measure) }
      get unit_of_measures_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end


  describe "GET /show" do
    it 'renders a succesful response' do
      unit_of_measure = create(:unit_of_measure)
      get unit_of_measure_url(unit_of_measure), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq unit_of_measure.id
    end
  end


  describe 'POST /create' do
    context "with valid parameters" do
      it "creates a new Unit Of Measure" do
        expect {
          post unit_of_measures_url,
            params: { unit_of_measure: valid_attributes }, as: :json
        }.to change(UnitOfMeasure, :count).by(1)
      end

      it "renders a JSON response with a new Unit Of Measure" do
        post unit_of_measures_url,
          params: {unit_of_measure: valid_attributes}, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "doesn't create a new Unit Of Measure" do
        expect{
          post unit_of_measures_url,
            params: { unit_of_measure: invalid_attributes }, as: :json
        }.to change(UnitOfMeasure, :count).by(0)
      end

      it "renders a JSON response with errors for the new Unit Of Measure" do
        post unit_of_measures_url,
          params: { unit_of_measure: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end


  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes){
        { abreviation: Faker::Lorem.characters(number: 4) }
      }

      it "updates the requested Transport Plan" do
        unit_of_measure = UnitOfMeasure.create! valid_attributes
        patch unit_of_measure_url(unit_of_measure),
          params: { unit_of_measure: new_attributes }, as: :json
        unit_of_measure.reload
        expect(new_attributes[:abreviation]).to eq unit_of_measure.abreviation
      end

      it "renders a JSON reponse with the Unit Of Measure" do
        unit_of_measure = UnitOfMeasure.create! valid_attributes
        patch unit_of_measure_url(unit_of_measure),
          params: { unit_of_measure: new_attributes }, as: :json
        unit_of_measure.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON reponse with the Unit Of Measure" do
        unit_of_measure = UnitOfMeasure.create! valid_attributes
        patch unit_of_measure_url(unit_of_measure),
          params: { unit_of_measure: invalid_attributes }, as: :json
        unit_of_measure.reload
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
