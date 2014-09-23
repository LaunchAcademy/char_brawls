class CreateCharactersTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
