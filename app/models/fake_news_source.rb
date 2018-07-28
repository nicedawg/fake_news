class FakeNewsSource < ApplicationRecord
  has_many :fake_articles
  validates :query, presence: true, uniqueness: true
end
