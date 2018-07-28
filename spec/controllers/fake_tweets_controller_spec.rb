require 'rails_helper'

RSpec.describe FakeTweetsController, type: :controller do

  let(:fake_news_source) { FakeNewsSource.create(twitter_handle: 'nicedawg') }

  let(:valid_attributes) {
    {
      fake_news_source_id: fake_news_source.id,
      content: 'Never forget the Bowling Green Massacre.',
    }
  }

  let(:invalid_attributes) {
    {
      fake_news_source_id: fake_news_source.id,
      content: nil,
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FakeNewsSourcesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      fake_tweet = FakeTweet.create! valid_attributes
      get :index, params: { fake_news_source_id: fake_news_source.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      fake_tweet = FakeTweet.create! valid_attributes
      get :show, params: { fake_news_source_id: fake_news_source.id, id: fake_tweet.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { fake_news_source_id: fake_news_source.id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new FakeTweet" do
        expect {
          post :create, params: {fake_news_source_id: fake_news_source.id, fake_tweet: valid_attributes}, session: valid_session
        }.to change(FakeTweet, :count).by(1)
      end

      it "redirects to the created fake_tweet" do
        post :create, params: {fake_news_source_id: fake_news_source.id, fake_tweet: valid_attributes}, session: valid_session
        expect(response).to redirect_to(fake_news_source_fake_tweet_path(fake_news_source, FakeTweet.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {fake_news_source_id: fake_news_source.id, fake_tweet: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested fake_news_source" do
      fake_tweet = FakeTweet.create! valid_attributes
      expect {
        delete :destroy, params: {fake_news_source_id: fake_news_source.id, id: fake_tweet.to_param}, session: valid_session
      }.to change(FakeTweet, :count).by(-1)
    end

    it "redirects to the fake_news_sources list" do
      fake_tweet = FakeTweet.create! valid_attributes
      delete :destroy, params: {id: fake_tweet.to_param, fake_news_source_id: fake_news_source.id}, session: valid_session
      expect(response).to redirect_to(fake_news_source_fake_tweets_url(fake_news_source))
    end
  end
end
