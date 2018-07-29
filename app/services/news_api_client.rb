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

  def get_results_from_api
    HTTParty
      .get('https://content.guardianapis.com/search',
           query: {
             q: query,
             'api-key': ENV['GUARDIAN_API_KEY'],
             'show-fields': 'body',
             'show-blocks': 'body',
           })
      .parsed_response['response']['results']
      .map do |result|
        result['fields']['body']
      end
  end
end
