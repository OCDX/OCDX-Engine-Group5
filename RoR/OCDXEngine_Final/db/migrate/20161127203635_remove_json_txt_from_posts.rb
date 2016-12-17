class RemoveJsonTxtFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :jsonTxt, :text
  end
end
