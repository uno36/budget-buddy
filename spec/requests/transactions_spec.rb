require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/transactions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
