require 'rails_helper'

RSpec.describe FakeNewsSourcesController, type: :controller do
  let(:query) { "bitcoin" }
  let(:valid_attributes) {
    {
      query: query,
    }
  }

  let(:invalid_attributes) {
    {
      query: nil,
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FakeNewsSourcesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before { stub_news_search }

  describe "GET #index" do
    it "returns a success response" do
      fake_news_source = FakeNewsSource.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      fake_news_source = FakeNewsSource.create! valid_attributes
      get :show, params: {id: fake_news_source.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new FakeNewsSource" do
        expect {
          post :create, params: {fake_news_source: valid_attributes}, session: valid_session
        }.to change(FakeNewsSource, :count).by(1)
      end

      it "fetches a dictionary of articles" do
        expect_any_instance_of(FetchDictionaryService).to receive(:fetch).and_call_original
        post :create, params: {fake_news_source: valid_attributes}, session: valid_session
        expect(FakeNewsSource.last.dictionary).to be_present
      end

      it "redirects to the created fake_news_source" do
        post :create, params: {fake_news_source: valid_attributes}, session: valid_session
        expect(response).to redirect_to(FakeNewsSource.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {fake_news_source: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested fake_news_source" do
      fake_news_source = FakeNewsSource.create! valid_attributes
      expect {
        delete :destroy, params: {id: fake_news_source.to_param}, session: valid_session
      }.to change(FakeNewsSource, :count).by(-1)
    end

    it "redirects to the fake_news_sources list" do
      fake_news_source = FakeNewsSource.create! valid_attributes
      delete :destroy, params: {id: fake_news_source.to_param}, session: valid_session
      expect(response).to redirect_to(fake_news_sources_url)
    end
  end

end
