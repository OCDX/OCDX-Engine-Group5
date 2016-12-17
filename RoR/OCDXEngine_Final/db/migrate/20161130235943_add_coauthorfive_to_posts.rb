class AddCoauthorfiveToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :coauthorfive, :string
  end
end
