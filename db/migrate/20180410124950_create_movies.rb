class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :title
      t.string :description
      t.integer :director_id

      t.timestamps

    end
  end
end
