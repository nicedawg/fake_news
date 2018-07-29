require 'rails_helper'

RSpec.describe "fake_news_sources/new", type: :view do
  before(:each) do
    assign(:fake_news_source, FakeNewsSource.new(
      :query => "MyString",
    ))
  end

  it "renders new fake_news_source form" do
    render

    assert_select "form[action=?][method=?]", fake_news_sources_path, "post" do

      assert_select "input[name=?]", "fake_news_source[query]"
    end
  end
end
