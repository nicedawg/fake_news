class RemoveFilepathFromFakeNewsSources < ActiveRecord::Migration[5.2]
  def change
    remove_column :fake_news_sources, :filepath
  end
end
