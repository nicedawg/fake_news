require 'rails_helper'

RSpec.describe FetchDictionaryService, type: :service do
  describe '#fetch' do
    subject { described_class.new('nicedawg').fetch }

    context 'when dictionary can be fetched' do
      it 'returns a path to the created file' do
        expect(subject[:filepath]).to match(/nicedawg-/)
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
    end

    context 'when twitter username not provided' do
      subject { described_class.new(' ').fetch }

      it 'returns nil for the filepath' do
        expect(subject[:filename]).to be_nil
      end
      it 'returns status ERROR' do
        expect(subject[:status]).to eq 'ERROR'
      end
      it 'returns an error description' do
        expect(subject[:errors]).to eq ['A username was not provided']
      end
    end

    context 'when twitter username does not exist' do
      before { expect_any_instance_of(described_class).to receive(:fetch_tweets).and_raise(FetchDictionaryService::UsernameDoesNotExist) }
      it 'returns nil for the filepath' do
        expect(subject[:filename]).to be_nil
      end
      it 'returns status ERROR' do
        expect(subject[:status]).to eq 'ERROR'
      end
      it 'returns an error description' do
        expect(subject[:errors]).to eq ['The requested username does not exist']
      end
    end

    context 'when twitter username is protected' do
      before { expect_any_instance_of(described_class).to receive(:fetch_tweets).and_raise(FetchDictionaryService::UsernameIsProtected) }
      it 'returns nil for the filepath' do
        expect(subject[:filename]).to be_nil
      end
      it 'returns status ERROR' do
        expect(subject[:status]).to eq 'ERROR'
      end
      it 'returns an error description' do
        expect(subject[:errors]).to eq ['The requested username is protected']
      end
    end

    context 'when some other error occurs' do
      before { expect_any_instance_of(described_class).to receive(:fetch_tweets).and_raise('The internet tubes are clogged') }
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
