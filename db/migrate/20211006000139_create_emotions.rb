class CreateEmotions < ActiveRecord::Migration[6.1]
  def change
    create_table :emotions do |t|
      t.references :emotionable, polymorphic: true, null: false, index: true
      t.integer :type, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
