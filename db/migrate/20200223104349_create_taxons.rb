class CreateTaxons < ActiveRecord::Migration[6.0]
  def change
    create_table :taxons do |t|
      t.integer :parent_id
      t.integer :position, default: 0
      t.string :permalink
      t.string :name, null: false
      t.integer :taxonomy_id
      t.integer :lft
      t.integer :rgt
      t.text :description
      t.string :parameterized_name
      t.integer :depth
      

      t.timestamps
    end
  end
end
