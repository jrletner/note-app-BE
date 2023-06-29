class AddLinkNameToLink < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :link_name, :string
  end
end
