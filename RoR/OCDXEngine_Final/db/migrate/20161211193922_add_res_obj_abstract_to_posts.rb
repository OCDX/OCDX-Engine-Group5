class AddResObjAbstractToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :resObjAbstract, :string
  end
end
