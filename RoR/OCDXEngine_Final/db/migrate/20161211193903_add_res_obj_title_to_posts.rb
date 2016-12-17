class AddResObjTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :resObjTitle, :string
  end
end
