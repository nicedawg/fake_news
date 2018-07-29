require 'rails_helper'

RSpec.describe "fake_news_sources/show", type: :view do
  before(:each) do
    @fake_news_source = assign(:fake_news_source, FakeNewsSource.create!(
      :query => "BitCoin",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/BitCoin/)
  end
end
