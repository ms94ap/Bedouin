class CreateTaxonomies < ActiveRecord::Migration[6.0]
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.integer :position, default: 0
      
      t.timestamps
    end
  end
end
