class AddJsonUpldToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :jsonUpld, :json
  end
end
