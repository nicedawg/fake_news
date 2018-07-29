require 'rails_helper'

RSpec.describe "fake_news_sources/index", type: :view do
  before(:each) do
    assign(:fake_news_sources, [
      FakeNewsSource.create!(
        :query => "Bitcoin",
        :articles_count => 7,
      ),
      FakeNewsSource.create!(
        :query => "Donald Trump",
        :articles_count => 50,
      )
    ])
  end

  it "renders a list of fake_news_sources" do
    render
    assert_select "tr>td", :text => "Bitcoin".to_s, :count => 1
    assert_select "tr>td", :text => "7".to_s, :count => 1
    assert_select "tr>td", :text => "Donald Trump".to_s, :count => 1
    assert_select "tr>td", :text => "50".to_s, :count => 1
  end
end
