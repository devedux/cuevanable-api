class Vote < ApplicationRecord
  # Assocations
  belongs_to :user
  belongs_to :movie, counter_cache: :votes_count

  # Validations
  validates :user, uniqueness: { scope: :movie, message: 'and Movie combination already taken' }
end
