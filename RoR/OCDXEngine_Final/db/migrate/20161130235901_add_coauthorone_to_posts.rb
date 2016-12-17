class AddCoauthoroneToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :coauthorone, :string
  end
end
