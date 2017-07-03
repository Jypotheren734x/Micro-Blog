class CreateUserTable < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :name
      t.integer :age
      t.integer :rating
      t.integer :number_of_posts
      t.integer :visibility
      t.datetime :date_joined
    end
  end
end
