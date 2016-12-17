class AddManifestVersionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :manifestVersion, :string
  end
end
