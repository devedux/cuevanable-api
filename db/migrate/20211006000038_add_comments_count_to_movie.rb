class AddCommentsCountToMovie < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :comments_count, :integer
  end
end
