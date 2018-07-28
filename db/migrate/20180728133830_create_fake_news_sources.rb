class CreateFakeNewsSources < ActiveRecord::Migration[5.2]
  def change
    create_table :fake_news_sources do |t|
      t.string :twitter_handle
      t.string :filepath

      t.timestamps
    end
  end
end
