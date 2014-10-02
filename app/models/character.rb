class Character < ActiveRecord::Base
  has_many :matchups

  validates :name,
    presence: true,
    uniqueness: true

  def self.search(query)
    where("character_id ilike ?", "%#{query}%")
  end
end
