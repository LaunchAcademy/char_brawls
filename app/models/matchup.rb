class Matchup < ActiveRecord::Base
  validates :character_id, presence: true
  validates :opponent_id, presence: true, uniqueness: { scope: :character }
  validate :no_duplicate_characters

  def no_duplicate_characters
    if character_id == opponent_id
      errors.add(:character_id, "Characters cannot battle themselves!")
    end
  end

  has_many :opinions
  belongs_to :character
  belongs_to :opponent, class_name: "Character"
end