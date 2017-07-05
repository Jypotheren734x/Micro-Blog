class CreateCommentCommentsTabel < ActiveRecord::Migration[5.1]
  def change
    create_table(:comment_sub_comments) do |t|
      t.integer :comment_id
      t.integer :sub_comments_id
    end
  end
end
