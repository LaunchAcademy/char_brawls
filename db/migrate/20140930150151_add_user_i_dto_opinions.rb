class AddUserIDtoOpinions < ActiveRecord::Migration
  def change
      add_column :opinions, :user_id, :integer
  end
end
