require 'rails_helper'

RSpec.describe "FakeNewsSources", type: :request do
  describe "GET /fake_news_sources" do
    it "works! (now write some real specs)" do
      get fake_news_sources_path
      expect(response).to have_http_status(200)
    end
  end
end
