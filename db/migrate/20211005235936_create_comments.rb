class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :replied_to, index: true
      t.integer :category
      t.integer :replies_count
      t.integer :likes_count
      t.integer :dislikes_count

      t.timestamps
    end
  end
end
