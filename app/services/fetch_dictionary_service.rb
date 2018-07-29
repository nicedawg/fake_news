class FetchDictionaryService
  BASE_DIR = Rails.root.join('public', 'dictionaries')

  attr_accessor :query, :dictionary, :status, :errors, :articles_count

  def initialize(query)
    self.query = query
    self.dictionary = nil
    self.status = 'ERROR'
    self.errors = []
    self.articles_count = 0
  end

  def fetch
    begin
      fetch_articles
      self.status = 'OK'
    rescue QueryNotProvided
      self.errors << 'A query was not provided'
    rescue => e
      self.errors << "An error occurred - #{e.message}"
    end

    {
      dictionary: dictionary,
      status: status,
      errors: errors,
      articles_count: articles_count,
    }
  end

  class QueryNotProvided < Exception; end

  private

  def fetch_articles
    raise QueryNotProvided if query.blank?

    articles = NewsApiClient.new(query).search

    self.dictionary = articles.join("\n")
    self.articles_count = articles.length
  end
end
