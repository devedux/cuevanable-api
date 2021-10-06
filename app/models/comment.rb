class Comment < ApplicationRecord
  # Enums
  enum category: { reply: 0, comment: 1 }

  # Associations
  belongs_to :user
  belongs_to :movie

  # Validations
  validates :body, presence: true
  validates :body, length: { maximun: 150 }

  validate :set_tweet_or_reply_category

  def set_tweet_or_reply_category
    self.category = if replied_to.present?
                      0
                    else
                      1
                    end
  end
end
