class ChangeTypeToEmotionType < ActiveRecord::Migration[6.1]
  def up
    rename_column :emotions, :type, :category
  end

  def down
    rename_column :emotions, :category, :type
  end
end
