require 'rails_helper'

RSpec.describe "WakeUps", type: :request do
  describe "POST /sleeps" do
    let!(:current_user) { FactoryBot.create(:user) }
    let!(:sleep) { FactoryBot.create(:sleep, user: current_user, clock_in: DateTime.now - 1.hours, clock_out: nil) }

    it "return list users" do
      post wake_ups_path, headers: { 'Authorization': "Bearer #{current_user.id}" }
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(response.body).to eq({ message: "Clock out successfully" }.to_json)
        expect(sleep.reload.clock_out).to be_present
      end
    end
  end
end
