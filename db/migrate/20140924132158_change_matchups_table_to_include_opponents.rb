class ChangeMatchupsTableToIncludeOpponents < ActiveRecord::Migration
  def up
    remove_column :matchups, :char_one
    remove_column :matchups, :char_two
    add_column :matchups, :character_id, :string
    add_column :matchups, :opponent_id, :string

    add_column :matchups, :votes, :integer
    add_index :matchups, [:character_id, :opponent_id], unique: true
  end

  def down
    add_column :matchups, :char_one, :string
    add_column :matchups, :char_two, :string
    remove_column :matchups, :character_id
    remove_column :matchups, :opponent_id
    remove_column :matchups, :votes
  end
end
