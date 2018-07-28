class RenameFakeNewsSourceTwitterHandleToQuery < ActiveRecord::Migration[5.2]
  def change
    rename_column :fake_news_sources, :twitter_handle, :query
  end
end
