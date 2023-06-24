class CreateChildCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :child_categories do |t|
      t.string :title
      t.references :parent_categories, null: false, foreign_key: true
      t.timestamps
    end
  end
end
