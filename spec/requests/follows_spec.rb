require 'rails_helper'

RSpec.describe "Follows", type: :request do
  describe "POST /follows" do
    let!(:current_user) { FactoryBot.create(:user) }
    let!(:user) { FactoryBot.create(:user) }

    it "return list users" do
      post follows_path, params: { user_id: user.id }, headers: { 'Authorization': "Bearer #{current_user.id}" }
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(response.body).to eq(FollowSerializer.new(current_user.followed_users.last).to_json)
      end
    end
  end

  describe "DELETE /follows" do
    let!(:current_user) { FactoryBot.create(:user) }
    let!(:user) { FactoryBot.create(:user) }
    let!(:follow) { FactoryBot.create(:follow, follower: current_user, followed: user) }

    it "return list users" do
      delete follow_path(user), headers: { 'Authorization': "Bearer #{current_user.id}" }
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(response.body).to eq({ message: "Unfollowed" }.to_json)
        expect(Follow.count).to eq(0)
      end
    end
  end
end
