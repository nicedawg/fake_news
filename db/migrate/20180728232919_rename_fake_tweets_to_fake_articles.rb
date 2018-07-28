class RenameFakeTweetsToFakeArticles < ActiveRecord::Migration[5.2]
  def change
    rename_table :fake_tweets, :fake_articles
  end
end
