class AddPrivacyAnonDataToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :privacyAnonData, :string
  end
end
