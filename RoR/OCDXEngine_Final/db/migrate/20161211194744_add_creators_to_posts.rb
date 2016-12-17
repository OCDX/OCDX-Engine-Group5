class AddCreatorsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :creators, :string
  end
end
