require "rails_helper"

RSpec.describe FakeArticlesController, type: :routing do
  it "routes to #index" do
    expect(:get => "/fake_news_sources/1/fake_articles").to route_to("fake_articles#index", fake_news_source_id: "1")
  end

  it "routes to #new" do
    expect(:get => "/fake_news_sources/1/fake_articles/new").to route_to("fake_articles#new", fake_news_source_id: "1")
  end

  it "routes to #show" do
    expect(:get => "/fake_news_sources/1/fake_articles/1").to route_to("fake_articles#show", fake_news_source_id: "1", id: "1")
  end

  it "routes to #create" do
    expect(:post => "/fake_news_sources/1/fake_articles").to route_to("fake_articles#create", fake_news_source_id: "1")
  end

  it "routes to #destroy" do
    expect(:delete => "/fake_news_sources/1/fake_articles/1").to route_to("fake_articles#destroy", :fake_news_source_id => "1", id: "1")
  end
end
