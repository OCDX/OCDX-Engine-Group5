class AddPrivacyIConsentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :privacyIConsent, :string
  end
end
