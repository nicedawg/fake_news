class FakeNewsSource < ApplicationRecord
  validates :twitter_handle, presence: true, uniqueness: true
end
