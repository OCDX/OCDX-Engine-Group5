class AddPrivacyConsiderationsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :privacyConsiderations, :string
  end
end
