class ChangeVotesToWinnerId < ActiveRecord::Migration
  def up
    add_column :opinions, :winner_id, :integer, null: false
    remove_column :opinions, :vote
  end

  def down
    remove_column :opinions, :winner_id
    add_column :opinions, :vote, :boolean
  end
end
