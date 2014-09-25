class AddResourceIDtoCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :resource_uri, :string
  end
end
