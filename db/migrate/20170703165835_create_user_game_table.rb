class CreateUserGameTable < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :type
      t.string :violence_rating
      t.string :descripiton
      t.integer :rating
    end
  end
end
