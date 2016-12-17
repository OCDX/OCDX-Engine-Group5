class AddResObjDateLabelToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :resObjDateLabel, :string
  end
end
