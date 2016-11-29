class AddFilefiveToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :filefive, :string
  end
end
