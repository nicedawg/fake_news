require "rails_helper"

RSpec.describe FakeNewsSourcesController, type: :routing do
  it "routes to #index" do
    expect(:get => "/fake_news_sources").to route_to("fake_news_sources#index")
  end

  it "routes to #new" do
    expect(:get => "/fake_news_sources/new").to route_to("fake_news_sources#new")
  end

  it "routes to #show" do
    expect(:get => "/fake_news_sources/1").to route_to("fake_news_sources#show", :id => "1")
  end

  it "routes to #create" do
    expect(:post => "/fake_news_sources").to route_to("fake_news_sources#create")
  end

  it "routes to #destroy" do
    expect(:delete => "/fake_news_sources/1").to route_to("fake_news_sources#destroy", :id => "1")
  end
end
