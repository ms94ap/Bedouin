class AddSlugToTaxonomies < ActiveRecord::Migration[6.0]
  def change
    add_column :taxonomies, :slug, :string
    add_index :taxonomies, :slug, unique: true
  end
end
