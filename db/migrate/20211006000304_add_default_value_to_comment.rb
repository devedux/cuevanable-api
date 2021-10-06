class AddDefaultValueToComment < ActiveRecord::Migration[6.1]
  def change
    change_column_default :comments, :replies_count, 0
    change_column_default :comments, :likes_count, 0
    change_column_default :comments, :dislikes_count, 0
  end
end
