class Comment < ApplicationRecord
  # Enums
  enum category: { reply: 0, comment: 1 }

  # Associations
  belongs_to :user
  belongs_to :movie, counter_cache: true
  belongs_to :replied_to, counter_cache: :replies_count, class_name: 'Comment', optional: true

  has_many :replies, class_name: 'Comment', foreign_key: 'replied_to_id', dependent: :nullify,
                     inverse_of: 'replied_to'
  has_many :emotions, as: :emotionable, dependent: :destroy
  has_many :users_emotions, through: :emotions, source: :user

  # Validations
  validates :body, presence: true
  validates :body, length: { maximum: 150 }

  validate :set_tweet_or_reply_category

  def set_tweet_or_reply_category
    self.category = if replied_to.present?
                      0
                    else
                      1
                    end
  end
end
