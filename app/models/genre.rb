class Genre < ApplicationRecord
  # Associations
  has_and_belongs_to_many :movies

  # Validations
  validates :name, presence: true
  validates :name, length: { minimum: 5 }
end
