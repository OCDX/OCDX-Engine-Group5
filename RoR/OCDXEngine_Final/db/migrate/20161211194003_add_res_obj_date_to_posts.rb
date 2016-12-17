class AddResObjDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :resObjDate, :string
  end
end
