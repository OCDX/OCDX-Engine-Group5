class AddCoauthorfourToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :coauthorfour, :string
  end
end
