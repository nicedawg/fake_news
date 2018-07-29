class FakeNewsSourcesController < ApplicationController
  before_action :set_fake_news_source, only: [:show, :destroy]

  # GET /fake_news_sources
  # GET /fake_news_sources.json
  def index
    @fake_news_sources = FakeNewsSource.all
  end

  # GET /fake_news_sources/1
  # GET /fake_news_sources/1.json
  def show
  end

  # GET /fake_news_sources/new
  def new
    @fake_news_source = FakeNewsSource.new
  end

  # POST /fake_news_sources
  # POST /fake_news_sources.json
  def create
    @fake_news_source = FakeNewsSource.new(fake_news_source_params)

    fetcher = FetchDictionaryService.new(@fake_news_source.query)
    fetch_status = fetcher.fetch
    @fake_news_source.filepath = fetch_status[:filepath]
    @fake_news_source.articles_count = fetch_status[:articles_count]

    respond_to do |format|
      if @fake_news_source.save
        format.html { redirect_to @fake_news_source, notice: 'Fake news source was successfully created.' }
        format.json { render :show, status: :created, location: @fake_news_source }
      else
        format.html { render :new }
        format.json { render json: @fake_news_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fake_news_sources/1
  # DELETE /fake_news_sources/1.json
  def destroy
    @fake_news_source.destroy
    respond_to do |format|
      format.html { redirect_to fake_news_sources_url, notice: 'Fake news source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fake_news_source
      @fake_news_source = FakeNewsSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fake_news_source_params
      params.require(:fake_news_source).permit(:query)
    end
end
