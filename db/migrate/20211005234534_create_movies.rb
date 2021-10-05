class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :summary, null: false
      t.references :professional, index: true, foreign_key: { to_table: :users }
      t.references :parent, index: true
      t.integer :duration, null: false
      t.integer :category, default: 0
      t.date :release_date, null: false
      t.integer :likes_count, default: 0
      t.integer :dislikes_count, default: 0
      t.integer :votes_count, default: 0

      t.timestamps
    end
  end
end
