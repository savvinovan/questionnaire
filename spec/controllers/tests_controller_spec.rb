require 'rails_helper'

RSpec.describe TestsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #take" do
    it "returns http success" do
      get :take
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #intro" do
    it "returns http success" do
      get :intro
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #results" do
    it "returns http success" do
      get :results
      expect(response).to have_http_status(:success)
    end
  end

end
