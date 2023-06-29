class AddLinkNameToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :link_name, :string, null: false
  end
end
