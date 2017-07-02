class CreateUserTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:users) do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :name
      t.integer :age
      t.integer :rating
      t.integer :favorite_games
      t.integer :number_of_posts
      t.integer :visibility
      t.datetime :date_joined
    end
  end
end
