require 'rails_helper'

RSpec.describe "Routes", type: :request do
  describe "GET /name" do
    it "returns http success" do
      get "/route/name"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /region:references" do
    it "returns http success" do
      get "/route/region:references"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /source:references" do
    it "returns http success" do
      get "/route/source:references"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destination:references" do
    it "returns http success" do
      get "/route/destination:references"
      expect(response).to have_http_status(:success)
    end
  end

end
