class AddProvenanceNarrativeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :provenanceNarrative, :string
  end
end
