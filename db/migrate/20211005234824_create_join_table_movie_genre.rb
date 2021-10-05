class CreateJoinTableMovieGenre < ActiveRecord::Migration[6.1]
  def change
    create_join_table :movies, :genres do |t|
    end
  end
end
