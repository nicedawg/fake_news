json.extract! fake_news_source, :id, :twitter_handle, :filepath, :created_at, :updated_at
json.url fake_news_source_url(fake_news_source, format: :json)
