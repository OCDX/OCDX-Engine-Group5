class AddCoauthorthreeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :coauthorthree, :string
  end
end
