class Character < ActiveRecord::Base
  has_many :matchups

  validates :name,
    presence: true,
    uniqueness: true
end
