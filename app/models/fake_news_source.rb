class FakeNewsSource < ApplicationRecord
  has_many :fake_articles, dependent: :destroy
  validates :query, presence: true, uniqueness: true
  validates_numericality_of :articles_count, only_integer: true, greater_than_or_equal_to: 0

  def generate_content
    markov = MarkyMarkov::TemporaryDictionary.new
    markov.parse_string Sanitize.clean(dictionary)
    markov.generate_50_sentences
  end
end
