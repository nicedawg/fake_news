require 'rails_helper'

RSpec.describe "fake_news_sources/index", type: :view do
  before(:each) do
    assign(:fake_news_sources, [
      FakeNewsSource.create!(
        :query => "Bitcoin",
      ),
      FakeNewsSource.create!(
        :query => "Donald Trump",
      )
    ])
  end

  it "renders a list of fake_news_sources" do
    render
    assert_select "tr>td", :text => "Bitcoin".to_s, :count => 1
    assert_select "tr>td", :text => "Donald Trump".to_s, :count => 1
  end
end
