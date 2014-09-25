class ChangeMatchupsTableToIncludeOpponents < ActiveRecord::Migration
  def up
    remove_column :matchups, :char_one
    remove_column :matchups, :char_two
    add_column :matchups, :character_id, :integer, null: false
    add_column :matchups, :opponent_id, :integer, null: false

    add_index :matchups, [:character_id, :opponent_id], unique: true
  end

  def down
    add_column :matchups, :char_one, :integer
    add_column :matchups, :char_two, :integer
    remove_column :matchups, :character_id
    remove_column :matchups, :opponent_id
  end
end
