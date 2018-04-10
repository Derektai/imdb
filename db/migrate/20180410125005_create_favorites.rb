class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :rank
      t.integer :movie_id
      t.integer :users_id

      t.timestamps

    end
  end
end
