require 'rails_helper'

RSpec.describe "fake_news_sources/index", type: :view do
  before(:each) do
    assign(:fake_news_sources, [
      FakeNewsSource.create!(
        :twitter_handle => "Twitter Handle",
        :filepath => "Filepath"
      ),
      FakeNewsSource.create!(
        :twitter_handle => "Twitter Handle #2",
        :filepath => "Filepath"
      )
    ])
  end

  it "renders a list of fake_news_sources" do
    render
    assert_select "tr>td", :text => "Twitter Handle".to_s, :count => 1
    assert_select "tr>td", :text => "Twitter Handle #2".to_s, :count => 1
    assert_select "tr>td", :text => "Filepath".to_s, :count => 2
  end
end
