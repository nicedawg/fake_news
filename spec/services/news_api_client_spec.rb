require 'rails_helper'

RSpec.describe NewsApiClient, type: :service do
  before { stub_news_search }

  describe '#search' do
    subject { NewsApiClient.new(query).search }
    let(:query) { 'bitcoin' }

    context 'when query is blank' do
      let(:query) { ' ' }

      it 'returns an empty array' do
        expect(subject).to eq []
      end
    end

    it 'returns an array of strings' do
      results = subject
      expect(results).to be_an Array
      expect(results.first).to be_a String
    end

    context 'when searching for the same thing twice' do
      it 'returns the cached result the 2nd time' do
        results = described_class.new(query).search

        expect_any_instance_of(described_class).not_to receive(:get_results_from_api)
        results2 = described_class.new(query).search

        expect(results).to eq results2
      end
    end
  end
end
