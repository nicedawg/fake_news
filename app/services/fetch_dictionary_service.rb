class FetchDictionaryService
  BASE_DIR = Rails.root.join('public', 'dictionaries')

  attr_accessor :query, :filepath, :status, :errors

  def initialize(query)
    self.query = query
    self.filepath = nil
    self.status = 'ERROR'
    self.errors = []
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
      filepath: filepath,
      status: status,
      errors: errors,
    }
  end

  class QueryNotProvided < Exception; end

  private

  def fetch_articles
    raise QueryNotProvided if query.blank?

    FileUtils.mkdir_p BASE_DIR
    filepath = BASE_DIR.join("#{query}-#{Time.now.to_i}.txt")

    File.open(filepath, 'wb') do |f|
      NewsApiClient.new(query).search.each do |article|
        f.puts article
      end
    end
    self.filepath = filepath.to_s
  end
end
