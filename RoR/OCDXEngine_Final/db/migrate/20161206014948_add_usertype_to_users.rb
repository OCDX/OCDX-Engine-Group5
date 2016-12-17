class AddUsertypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usertype, :int
  end
end
