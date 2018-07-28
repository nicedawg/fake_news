class CreateFakeTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :fake_tweets do |t|
      t.references :fake_news_source, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
