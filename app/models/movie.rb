class Movie < ApplicationRecord
  # Enums
  enum category: { main_movie: 0, expansion: 1 }

  # Assocations
  belongs_to :parent, class_name: 'Movie', optional: true

  has_many :expansions, class_name: 'Movie', foreign_key: 'parent_id', dependent: :nullify,
                        inverse_of: 'parent'
  has_many :votes, dependent: :destroy
  has_many :users_votes, through: :votes, source: :user
  has_many :comments, dependent: :destroy
  has_many :emotions, as: :emotionable, dependent: :nullify
  has_many :user_emotions, through: :emotions, source: :user

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :professionals, join_table: 'movies_users', class_name: 'User'

  has_one_attached :cover

  # validations
  validates :duration, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :title, presence: true
  validates :summary, presence: true
  validates :release_date, presence: true
end
