class RemoveJsonUpldFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :jsonUpld, :json
  end
end
