require 'rails_helper'

RSpec.describe "fake_news_sources/show", type: :view do
  before(:each) do
    @fake_news_source = assign(:fake_news_source, FakeNewsSource.create!(
      :query => "BitCoin",
    ))
    @fake_articles = @fake_news_source.fake_articles
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/BitCoin/)
  end

  it "has a link to generate a new fake article" do
    render
    expect(rendered).to match(/Generate new fake article/)
  end
end
