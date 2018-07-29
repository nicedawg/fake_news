class AddArticlesCountToFakeNewsSources < ActiveRecord::Migration[5.2]
  def change
    add_column :fake_news_sources, :articles_count, :integer, default: 0
  end
end
