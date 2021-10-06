class Emotion < ApplicationRecord
  # Enums
  enum category: { like: 0, dislike: 1 }

  # Associations
  belongs_to :emotionable, polymorphic: true
  belongs_to :user

  # Validations
  validates :category, presence: true

  # Callbacks
  before_save :increase_counter_cache
  before_destroy :decrease_counter_cache

  private

  def increase_counter_cache
    emotionable = get_emotionable

    if category == 'like'
      emotionable.likes_count += 1
    else
      emotionable.dislikes_count += 1
    end
  end

  def decrease_counter_cache
    emotionable = get_emotionable

    if emotionable.likes_count.positive? && category == 'like'
      emotionable.likes_count -= 1
    elsif emotionable.dislikes_count.positive? && category == 'dislike'
      emotionable.dislikes_count -= 1
    end
    emotionable.save
  end

  def get_emotionable
    return Comment.find(emotionable_id) if emotionable_type == 'Comment'

    Movie.find(emotionable_id) if emotionable_type == 'Movie'
  end
end
