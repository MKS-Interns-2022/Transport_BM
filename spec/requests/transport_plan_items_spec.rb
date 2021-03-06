require 'rails_helper'

RSpec.describe "TransportPlanItems", type: :request do
  let(:valid_attributes) do

    {
      route_id: create(:route).id,
      transport_plan_id: create(:transport_plan).id,
      quantity: 1,
      unit_id: create(:unit_of_measure).id,
      planned: true
    }
  end

  let(:invalid_attributes) do
    {
      route_id: create(:route).id,
      transport_plan_id: create(:transport_plan).id,
      quantity: "num",
      unit_id: create(:unit_of_measure).id,
      planned: nil
    }
  end

  describe 'GET /index' do
    it 'renders a succesful response' do
      3.times { create(:transport_plan_item) }
      get transport_plan_items_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end


  describe "GET /show" do
    it 'renders a succesful response' do
      transport_plan_item = create(:transport_plan_item)
      get transport_plan_item_url(transport_plan_item), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['id']).to eq transport_plan_item.id
    end
  end


describe 'POST /create' do
  context "with valid parameters" do
    it "creates a new Transport Plan Item" do
      expect {
        post transport_plan_items_url,
          params: { transport_plan_item: valid_attributes }, as: :json
      }.to change(TransportPlan, :count).by(1)
    end

    it "renders a JSON response with a new transport plan item" do
      post transport_plan_items_url,
        params: {transport_plan_item: valid_attributes}, as: :json
      expect(response).to have_http_status(:created)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end

  context "with invalid parameters" do
    it "doesn't create a new transport_plan_item" do
      expect{
        post transport_plan_items_url,
          params: { transport_plan_item: invalid_attributes }, as: :json
      }.to change(TransportPlanItem, :count).by(0)
    end

    it "renders a JSON response with errors for the new Transport Plan" do
      post transport_plan_items_url,
        params: { transport_plan_item: invalid_attributes }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to match(a_string_including("application/json"))
    end
  end
end


  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes){
        { quantity: 3 }
      }

      it "updates the requested Transport Plan Item" do
        transport_plan_item = TransportPlanItem.create! valid_attributes
        patch transport_plan_item_url(transport_plan_item),
          params: { transport_plan_item: new_attributes }, as: :json
        transport_plan_item.reload
        expect(new_attributes[:quantity]).to eq transport_plan_item.quantity
      end

      it "renders a JSON reponse with the Transport Plan Item" do
        transport_plan_item = TransportPlanItem.create! valid_attributes
        patch transport_plan_item_url(transport_plan_item),
          params: { transport_plan_item: new_attributes }, as: :json
        transport_plan_item.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON reponse with the Transport Plan Item" do
        transport_plan_item = TransportPlanItem.create! valid_attributes
        patch transport_plan_item_url(transport_plan_item),
          params: { transport_plan_item: invalid_attributes }, as: :json
        transport_plan_item.reload
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
