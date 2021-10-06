class CreateJoinTableMoviesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :movies, :users do |t|
    end
  end
end
