class FakeNewsSource < ApplicationRecord
  has_many :fake_tweets
  validates :twitter_handle, presence: true, uniqueness: true
end
