class AddOpinionsTable < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.string :body, null: false
      t.integer :matchup_id, null: false
      t.boolean :vote, null: false
      t.timestamps
    end
  end
end
