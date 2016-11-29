class AddFilefourToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :filefour, :string
  end
end
