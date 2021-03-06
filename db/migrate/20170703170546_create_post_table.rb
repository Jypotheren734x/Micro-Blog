class CreatePostTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:posts) do |t|
      t.string :title
      t.string :content
      t.integer :rating
      t.integer :user_id
      t.datetime :date_created
    end
  end
end
