class AddMatchupsTable < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.string :char_one, null: false
      t.string :char_two, null: false
      t.timestamps
    end

    add_index :matchups, [:char_one, :char_two], :unique => true

  end
end
