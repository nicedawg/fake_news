require 'rails_helper'

RSpec.describe FakeTweet, type: :model do
  describe 'valid?' do
    let(:fake_news_source) { FakeNewsSource.new(twitter_handle: 'nicedawg') }
    let(:valid_attributes) do
      {
        fake_news_source: fake_news_source,
        content: "Don't forget the Bowling Green Massacre",
      }
    end

    it 'is valid with valid attributes' do
      expect(FakeTweet.new(valid_attributes)).to be_valid
    end

    it 'is not valid when fake_news_source is missing' do
      fake_tweet = FakeTweet.new(valid_attributes)
      fake_tweet.fake_news_source = nil
      expect(fake_tweet).not_to be_valid
    end

    it 'is not valid when content is missing' do
      fake_tweet = FakeTweet.new(valid_attributes)
      fake_tweet.content = nil
      expect(fake_tweet).not_to be_valid
    end
  end
end
