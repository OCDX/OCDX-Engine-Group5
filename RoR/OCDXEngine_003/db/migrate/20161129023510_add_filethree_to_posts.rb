class AddFilethreeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :filethree, :string
  end
end
