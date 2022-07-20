require 'rails_helper'

RSpec.describe "TransportPlans", type: :request do
  let(:valid_attributes) do

    {
      reference_no: Faker::Code.npi,
      plan_type: TransportPlan::PLANNED,
      region_id: create(:location).id
    }
  end

  let(:invalid_attributes) do
    {
      reference_no: Faker::Code.npi,
      plan_type: TransportPlan::PLANNED,
      region_id: nil
    }
  end

  describe 'GET /index' do
    it 'renders a succesful response' do
      3.times { create(:transport_plan) }
      get transport_plans_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end


  describe "GET /show" do
    it 'renders a succesful response' do
      transport_plan = create(:transport_plan)
      get transport_plan_url(transport_plan), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq transport_plan.id
    end
  end


describe 'POST /create' do
  context "with valid parameters" do
    it "creates a new Transport Plan" do
      expect {
        post transport_plans_url,
          params: { transport_plan: valid_attributes }, as: :json
      }.to change(TransportPlan, :count).by(1)
    end

    it "renders a JSON response with a new transport plan" do
      post transport_plans_url,
        params: {transport_plan: valid_attributes}, as: :json
      expect(response).to have_http_status(:created)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end

  context "with invalid parameters" do
    it "doesn't create a new transport_plan" do
      expect{
        post transport_plans_url,
          params: { transport_plan: invalid_attributes }, as: :json
      }.to change(TransportPlan, :count).by(0)
    end

    it "renders a JSON response with errors for the new Transport Plan" do
      post transport_plans_url,
        params: { transport_plan: invalid_attributes }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end
end


  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes){
        { reference_no: Faker::Code.npi }
      }

      it "updates the requested Transport Plan" do
        transport_plan = TransportPlan.create! valid_attributes
        patch transport_plan_url(transport_plan),
          params: { transport_plan: new_attributes }, as: :json
        transport_plan.reload
        expect(new_attributes[:reference_no]).to eq transport_plan.reference_no
      end

      it "renders a JSON reponse with the Transport Plan" do
        transport_plan = TransportPlan.create! valid_attributes
        patch transport_plan_url(transport_plan),
          params: { transport_plan: new_attributes }, as: :json
        transport_plan.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON reponse with the Transport Plan" do
        transport_plan = TransportPlan.create! valid_attributes
        patch transport_plan_url(transport_plan),
          params: { transport_plan: invalid_attributes }, as: :json
        transport_plan.reload
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
