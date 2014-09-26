class AddPhototoCharacters < ActiveRecord::Migration
  def change
  add_column :characters, :photo, :string
  end
end
