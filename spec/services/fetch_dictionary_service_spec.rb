require 'rails_helper'

RSpec.describe FetchDictionaryService, type: :service do
  describe '#fetch' do
    subject { described_class.new('bitcoin').fetch }

    context 'when dictionary can be fetched' do
      it 'returns a path to the created file' do
        expect(subject[:filepath]).to match(/bitcoin-/)
      end
      it 'actually creates the file' do
        expect(File).to receive(:open)
        subject
      end
      it 'returns status OK' do
        expect(subject[:status]).to eq 'OK'
      end
      it 'returns an empty errors array' do
        expect(subject[:errors]).to eq []
      end
      it 'calls NewsApiClient.new.search' do
        expect_any_instance_of(NewsApiClient).to receive(:search).and_return([])
        subject
      end
    end

    context 'when query not provided' do
      subject { described_class.new(' ').fetch }

      it 'returns nil for the filepath' do
        expect(subject[:filename]).to be_nil
      end
      it 'returns status ERROR' do
        expect(subject[:status]).to eq 'ERROR'
      end
      it 'returns an error description' do
        expect(subject[:errors]).to eq ['A query was not provided']
      end
    end

    context 'when an error occurs' do
      before { expect_any_instance_of(described_class).to receive(:fetch_articles).and_raise('The internet tubes are clogged') }
      it 'returns nil for the filepath' do
        expect(subject[:filename]).to be_nil
      end
      it 'returns status ERROR' do
        expect(subject[:status]).to eq 'ERROR'
      end
      it 'returns an error description' do
        expect(subject[:errors]).to eq ['An error occurred - The internet tubes are clogged']
      end
    end
  end
end
