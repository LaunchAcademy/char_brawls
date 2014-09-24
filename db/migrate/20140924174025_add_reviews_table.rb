class AddReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :matchup_id, null: false
      t.timestamps
    end
  end
end
