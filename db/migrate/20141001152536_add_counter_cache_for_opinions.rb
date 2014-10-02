class AddCounterCacheForOpinions < ActiveRecord::Migration
  def up
    add_column :matchups, :opinions_count, :integer
  end

  def down
    remove_column :matchups, :opinions_count
  end
end
