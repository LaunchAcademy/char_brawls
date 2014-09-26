class Matchup < ActiveRecord::Base
  has_many :opinions
  belongs_to :character
  belongs_to :opponent, class_name: "Character"

  validates :character, presence: true
  validates :opponent,
    presence: true,
    uniqueness: { scope: :character, message: "That matchup already exists!" }
  validate :no_duplicate_characters

  def tabulate
    char_count = 0
    opp_count = 0

    self.opinions.each do |opinion|
      if opinion.winner_id == character.id
        char_count += 1

      elsif opinion.winner_id == opponent.id
        opp_count += 1
      end
    end

    if char_count > opp_count
      return "#{self.character.name} is winning by #{char_count}."
    elsif opp_count > char_count
      return "#{self.opponent.name} is winning by #{opp_count}."
    else
      return 'No Contest!'
    end
  end

  def no_duplicate_characters
    if character_id == opponent_id
      errors.add(:character_id, "Characters cannot battle themselves!")
    end
  end
end

