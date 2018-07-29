class AddDictionaryToFakeNewsSources < ActiveRecord::Migration[5.2]
  def change
    add_column :fake_news_sources, :dictionary, :text
  end
end
