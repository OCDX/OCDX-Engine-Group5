class AddPublicationToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publication, :string
  end
end
