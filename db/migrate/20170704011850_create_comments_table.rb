class CreateCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:comments) do |t|
      t.string :content
      t.integer :user_id
      t.integer :post_id
      t.datetime :date_created
    end
  end
end
