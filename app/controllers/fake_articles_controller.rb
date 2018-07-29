class FakeArticlesController < ApplicationController
  before_action :set_fake_articles
  before_action :set_fake_article, only: [:show, :edit, :destroy]

  # GET fake_news_sources/1/fake_articles
  def index
    @fake_articles = @fake_news_source.fake_articles
  end

  # GET fake_news_sources/1/fake_articles/1
  def show
  end

  # GET fake_news_sources/1/fake_articles/new
  def new
    @fake_article = @fake_news_source.fake_articles.build
    @fake_article.content = @fake_news_source.generate_content
  end

  # POST fake_news_sources/1/fake_articles
  def create
    @fake_article = @fake_news_source.fake_articles.build(fake_article_params)

    if @fake_article.save
      redirect_to([@fake_article.fake_news_source, @fake_article], notice: 'Fake article was successfully created.')
    else
      render action: 'new'
    end
  end

  # DELETE fake_news_sources/1/fake_articles/1
  def destroy
    @fake_article.destroy

    redirect_to fake_news_source_fake_articles_url(@fake_news_source)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fake_articles
      @fake_news_source = FakeNewsSource.find(params[:fake_news_source_id])
    end

    def set_fake_article
      @fake_article = @fake_news_source.fake_articles.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fake_article_params
      params.require(:fake_article).permit(:content)
    end
end
