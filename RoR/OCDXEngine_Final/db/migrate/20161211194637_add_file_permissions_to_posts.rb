class AddFilePermissionsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :filePermissions, :string
  end
end
