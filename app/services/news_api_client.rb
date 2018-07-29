class NewsApiClient
  attr_accessor :query

  def initialize(query)
    self.query = query
  end

  def search
    return [] if query.blank?

    Rails.cache.fetch("search-#{query.downcase}", expires_in: 1.week) do
      get_results_from_api
    end
  end

  private

  def client
    News.new ENV['NEWSAPI_KEY']
  end

  def get_results_from_api
    client.get_everything(q: query).map { |article| article.description }
  end
end
