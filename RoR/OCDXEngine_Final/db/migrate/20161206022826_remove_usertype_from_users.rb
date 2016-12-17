class RemoveUsertypeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :usertype, :int
  end
end
