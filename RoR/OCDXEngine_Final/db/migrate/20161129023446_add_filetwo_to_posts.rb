class AddFiletwoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :filetwo, :string
  end
end
