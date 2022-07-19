require 'rails_helper'

RSpec.describe "TransportBidItems", type: :request do
  describe "GET /transport_bid:references" do
    it "returns http success" do
      get "/transport_bid_items/transport_bid:references"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /transport_plan_item:references" do
    it "returns http success" do
      get "/transport_bid_items/transport_plan_item:references"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /quantity:integer" do
    it "returns http success" do
      get "/transport_bid_items/quantity:integer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /unit_of_measure:references" do
    it "returns http success" do
      get "/transport_bid_items/unit_of_measure:references"
      expect(response).to have_http_status(:success)
    end
  end

end
