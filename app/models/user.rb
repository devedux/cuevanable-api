class User < ApplicationRecord
  # Constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  # Enums
  enum role: { member: 0, actor: 1, director: 2, admin: 3 }

  # Associations
  has_many :votes, dependent: :destroy
  has_many :movies_votes, through: :votes, source: :movie
  has_many :comments, dependent: :destroy
  has_many :emotions, dependent: :destroy
  has_many :comments_emotions, through: :emotions, source: :emotionable, source_type: 'Comment'
  has_many movies_emotions, through: :emotions, source: :emotionable, source_type: 'Movie'

  has_and_belongs_to_many :movies, join_table: 'movies_users', class_name: 'Movie'

  # Validations
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :username, uniqueness: true
  validates :username, presence: true
end
