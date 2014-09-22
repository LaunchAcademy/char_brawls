class CreateUsersMatchupsReviews < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :characters do |t|
    end


    create_table :matchups do |t|

    end

    create_table :reviews do |t|

    end

  end
end
