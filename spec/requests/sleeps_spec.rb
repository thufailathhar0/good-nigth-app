require 'rails_helper'

RSpec.describe "Sleeps", type: :request do
  describe "GET /sleeps" do
    let!(:current_user) { FactoryBot.create(:user) }
    let!(:sleeps) { FactoryBot.create_list(:sleep, 10, user: current_user) }

    it "return list users" do
      get sleeps_path, headers: { 'Authorization': "Bearer #{current_user.id}" }
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).first['id']).to eq(sleeps.last.id)
      end
    end
  end

  describe "POST /sleeps" do
    let!(:current_user) { FactoryBot.create(:user) }

    it "return list users" do
      post sleeps_path, headers: { 'Authorization': "Bearer #{current_user.id}" }
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(response.body).to eq({ message: "Clock in successfully" }.to_json)
      end
    end
  end
end
