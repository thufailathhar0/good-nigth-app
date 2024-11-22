require 'rails_helper'

RSpec.describe "Follows::Sleeps", type: :request do
  describe "GET /follows/sleeps" do
    let!(:current_user) { FactoryBot.create(:user) }
    let!(:followed_user) { FactoryBot.create(:user) }
    let!(:follow) { FactoryBot.create(:follow, follower: current_user, followed: followed_user) }
    let!(:followed_user_sleep) { FactoryBot.create(:sleep, user: followed_user) }

    it "return list sleeps of followed user" do
      get follows_sleeps_path, headers: { 'Authorization': "Bearer #{current_user.id}" }
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body).first['id']).to eq(followed_user_sleep.id)
      end
    end
  end
end
