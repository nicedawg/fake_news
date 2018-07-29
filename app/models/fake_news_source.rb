class FakeNewsSource < ApplicationRecord
  has_many :fake_articles
  validates :query, presence: true, uniqueness: true
  validates_numericality_of :articles_count, only_integer: true, greater_than_or_equal_to: 0
end
