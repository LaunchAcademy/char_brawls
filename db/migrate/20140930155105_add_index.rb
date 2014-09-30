class AddIndex < ActiveRecord::Migration
  def change
    add_index :opinions, [:user_id, :matchup_id], unique: true
  end
end
