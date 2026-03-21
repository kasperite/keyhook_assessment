require 'rails_helper'

RSpec.describe "Admin::Dashboards", type: :request do
  let(:user) { FactoryBot.create(:user) }
  describe "GET /admin" do
    context "when user is not signed in" do
      it "redirects to the login page" do
        get "/admin"
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(new_session_path)
      end
    end

    context "when user is signed in" do
      before do
        sign_in_user user
      end

      it "returns a successful response" do
        get "/admin"
        expect(response).to have_http_status(:success)
      end
    end
  end

end
