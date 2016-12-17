class AddLocationCommentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :locationComment, :string
  end
end
