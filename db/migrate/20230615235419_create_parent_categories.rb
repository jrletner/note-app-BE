class CreateParentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :parent_categories do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title, null: false
      t.timestamps
    end
  end
end
