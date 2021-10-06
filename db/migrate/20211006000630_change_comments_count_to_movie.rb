class ChangeCommentsCountToMovie < ActiveRecord::Migration[6.1]
  def change
    change_column_default :movies, :comments_count, 0
  end
end
