class AddOpinionsTable < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :body, null: false
      t.integer :matchup_id, null: false
      #if true, character wins, false, opponent wins
      t.boolean :vote, null: false
      t.timestamps
    end
  end
end
