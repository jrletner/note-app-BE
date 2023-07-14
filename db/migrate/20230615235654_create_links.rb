class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.references :note, null: false, foreign_key: true
      t.string :link, null: false
      t.timestamps
    end
  end
end
