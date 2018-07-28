require 'rails_helper'

RSpec.describe FakeArticle, type: :model do
  describe 'valid?' do
    let(:fake_news_source) { FakeNewsSource.new(query: 'bitcoin') }
    let(:valid_attributes) do
      {
        fake_news_source: fake_news_source,
        content: "Don't forget the Bowling Green Massacre",
      }
    end

    it 'is valid with valid attributes' do
      expect(FakeArticle.new(valid_attributes)).to be_valid
    end

    it 'is not valid when fake_news_source is missing' do
      fake_article = FakeArticle.new(valid_attributes)
      fake_article.fake_news_source = nil
      expect(fake_article).not_to be_valid
    end

    it 'is not valid when content is missing' do
      fake_article = FakeArticle.new(valid_attributes)
      fake_article.content = nil
      expect(fake_article).not_to be_valid
    end
  end
end
