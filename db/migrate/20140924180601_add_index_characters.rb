class AddIndexCharacters < ActiveRecord::Migration
  def change
    change_column_null :characters, :name, true
    add_index :characters, :name, unique: true
  end
end
