class AddJsonToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :json, :string
  end
end
