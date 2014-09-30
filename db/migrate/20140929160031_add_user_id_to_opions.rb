class AddUserIdToOpions < ActiveRecord::Migration
  def change
    add_column :opinions, :user_id, :integer, null: false
  end
end
