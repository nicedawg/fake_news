require 'rails_helper'

RSpec.describe "fake_news_sources/show", type: :view do
  before(:each) do
    @fake_news_source = assign(:fake_news_source, FakeNewsSource.create!(
      :twitter_handle => "Twitter Handle",
      :filepath => "Filepath"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Twitter Handle/)
    expect(rendered).to match(/Filepath/)
  end
end
