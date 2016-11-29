class AddJsonTxtToPost < ActiveRecord::Migration
  def change
    add_column :posts, :jsonTxt, :text
  end
end
