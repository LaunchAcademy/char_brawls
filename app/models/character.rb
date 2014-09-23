class Character < ActiveRecord::Base
validates :name, presence:true
validates_uniqueness_of :name
validates :body, presence:true
end