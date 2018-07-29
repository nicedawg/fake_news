require 'rails_helper'

RSpec.describe "fake_articles/new", type: :view do
  before(:each) do
    @fake_news_source = FakeNewsSource.create!(
      query: 'bitcoin',
      articles_count: '50',
    )
    assign(:fake_article, FakeArticle.new(
      fake_news_source: @fake_news_source,
      content: 'This is a fake article. This is a fake article. This is a fake article.',
    ))
  end

  it "renders new fake_article form" do
    render

    assert_select "form[action=?][method=?]", fake_news_source_fake_articles_path(@fake_news_source), "post" do

      assert_select "textarea[name=?]", "fake_article[content]"
    end
  end
end
