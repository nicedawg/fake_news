class FakeTweetsController < ApplicationController
  before_action :set_fake_tweets
  before_action :set_fake_tweet, only: [:show, :edit, :destroy]

  # GET fake_news_sources/1/fake_tweets
  def index
    @fake_tweets = @fake_news_source.fake_tweets
  end

  # GET fake_news_sources/1/fake_tweets/1
  def show
  end

  # GET fake_news_sources/1/fake_tweets/new
  def new
    @fake_tweet = @fake_news_source.fake_tweets.build
  end

  # POST fake_news_sources/1/fake_tweets
  def create
    @fake_tweet = @fake_news_source.fake_tweets.build(fake_tweet_params)

    if @fake_tweet.save
      redirect_to([@fake_tweet.fake_news_source, @fake_tweet], notice: 'Fake tweet was successfully created.')
    else
      render action: 'new'
    end
  end

  # DELETE fake_news_sources/1/fake_tweets/1
  def destroy
    @fake_tweet.destroy

    redirect_to fake_news_source_fake_tweets_url(@fake_news_source)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fake_tweets
      @fake_news_source = FakeNewsSource.find(params[:fake_news_source_id])
    end

    def set_fake_tweet
      @fake_tweet = @fake_news_source.fake_tweets.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fake_tweet_params
      params.require(:fake_tweet).permit(:content)
    end
end
