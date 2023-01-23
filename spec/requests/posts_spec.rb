require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }

    it "is a success" do
      expect(response).to have_http_status(:ok)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "displays the correct HTML" do
      expect(response.body).to include("Lists of Posts for a user")
    end
  end
end
