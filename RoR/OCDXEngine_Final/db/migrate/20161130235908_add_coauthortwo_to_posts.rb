class AddCoauthortwoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :coauthortwo, :string
  end
end
