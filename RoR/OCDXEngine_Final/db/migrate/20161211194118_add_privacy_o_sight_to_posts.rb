class AddPrivacyOSightToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :privacyOSight, :string
  end
end
