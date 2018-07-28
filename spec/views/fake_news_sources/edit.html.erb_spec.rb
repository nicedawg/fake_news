require 'rails_helper'

RSpec.describe "fake_news_sources/edit", type: :view do
  before(:each) do
    @fake_news_source = assign(:fake_news_source, FakeNewsSource.create!(
      :query => "MyString",
      :filepath => "MyString"
    ))
  end

  it "renders the edit fake_news_source form" do
    render

    assert_select "form[action=?][method=?]", fake_news_source_path(@fake_news_source), "post" do

      assert_select "input[name=?]", "fake_news_source[query]"

      assert_select "input[name=?]", "fake_news_source[filepath]"
    end
  end
end
