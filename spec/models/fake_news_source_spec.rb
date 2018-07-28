require 'rails_helper'

RSpec.describe FakeNewsSource, type: :model do
  describe 'valid?' do
    it 'is valid with valid attributes' do
      expect(FakeNewsSource.new(twitter_handle: 'nicedawg')).to be_valid
    end
    
    it 'is not valid when twitter_handle is missing' do
      expect(FakeNewsSource.new(twitter_handle: nil)).not_to be_valid
    end

    it 'is not valid when twitter_handle is a duplicate' do
      FakeNewsSource.create(twitter_handle: 'barddawg')
      expect(FakeNewsSource.new(twitter_handle: 'barddawg')).not_to be_valid
    end
  end
end
