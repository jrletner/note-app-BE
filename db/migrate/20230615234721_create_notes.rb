
class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :child_category, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end