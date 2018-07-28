require 'rails_helper'

RSpec.describe FakeNewsSource, type: :model do
  describe 'valid?' do
    it 'is valid with valid attributes' do
      expect(FakeNewsSource.new(query: 'nicedawg')).to be_valid
    end

    it 'is not valid when query is missing' do
      expect(FakeNewsSource.new(query: nil)).not_to be_valid
    end

    it 'is not valid when query is a duplicate' do
      FakeNewsSource.create(query: 'barddawg')
      expect(FakeNewsSource.new(query: 'barddawg')).not_to be_valid
    end
  end
end
