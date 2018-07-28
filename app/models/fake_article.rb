class FakeArticle < ApplicationRecord
  belongs_to :fake_news_source
  validates :fake_news_source, presence: true
  validates :content, presence: true
end
