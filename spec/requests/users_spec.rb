require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    let!(:users) { FactoryBot.create_list(:user, 10) }

    it "return list users" do
      get users_path
      aggregate_failures do
        expect(response).to have_http_status(200)
        expect(response.body).to include(users.first.name)
      end
    end
  end
end
