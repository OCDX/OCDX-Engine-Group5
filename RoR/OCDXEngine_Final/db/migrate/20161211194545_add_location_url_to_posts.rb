class AddLocationUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :locationURL, :string
  end
end
