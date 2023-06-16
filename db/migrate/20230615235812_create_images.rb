class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :notes, null: false, foreign_key: true
      t.string :image_path, null: false
      t.timestamps
    end
  end
end
