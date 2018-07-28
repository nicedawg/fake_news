require "rails_helper"

RSpec.describe FakeTweetsController, type: :routing do
  it "routes to #index" do
    expect(:get => "/fake_news_sources/1/fake_tweets").to route_to("fake_tweets#index", fake_news_source_id: "1")
  end

  it "routes to #new" do
    expect(:get => "/fake_news_sources/1/fake_tweets/new").to route_to("fake_tweets#new", fake_news_source_id: "1")
  end

  it "routes to #show" do
    expect(:get => "/fake_news_sources/1/fake_tweets/1").to route_to("fake_tweets#show", fake_news_source_id: "1", id: "1")
  end

  it "routes to #create" do
    expect(:post => "/fake_news_sources/1/fake_tweets").to route_to("fake_tweets#create", fake_news_source_id: "1")
  end

  it "routes to #destroy" do
    expect(:delete => "/fake_news_sources/1/fake_tweets/1").to route_to("fake_tweets#destroy", :fake_news_source_id => "1", id: "1")
  end
end
