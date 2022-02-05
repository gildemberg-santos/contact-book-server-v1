require 'rails_helper'

RSpec.describe "Slacks", type: :request do
  describe "GET /meet" do
    it "returns http success" do
      get "/slack/meet"
      expect(response).to have_http_status(:success)
    end
  end

end
