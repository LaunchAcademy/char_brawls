class Matchup < ActiveRecord::Base
  validates :character, presence: true
  validates :opponent, presence: true, uniqueness: {scope: :character}
  validate :no_duplicate_characters

  def no_duplicate_characters
    if character_id == opponent_id
      errors.add(:character_id, 'Characters cannot battle themselves!')
    end
  end

  belongs_to :character
  belongs_to :opponent, class_name: "Character"
end


# for character model
# has_many :matchups
# has_many :opponents, :through => :matchups
# has_many :inverse_matchups, :class_name "Matchup", :foreign_key => "opponent_id"
# has_many :inverse_opponents, :through => :inverse_matchups, :source => :character
