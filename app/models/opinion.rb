class Opinion < ActiveRecord::Base
  belongs_to :matchup
  belongs_to :user
  belongs_to :winner, class_name: "Character"

  validates :body,
    presence: { message: "The opinion can't be empty!" },
    uniqueness: { message: "That opinion already exists!" }
  # validates :user, uniqueness: { scope: matchup } (also need uniqueness constraint on DB)
  validates :winner, presence: { message: "You must vote!" }
  validate :winner_in_matchup
  validates :user, uniqueness: {scope: :matchup}

  def winner_in_matchup
    if winner != matchup.character && winner != matchup.opponent
      errors.add(:winner_id, "Winner must be in matchup!")
    end
  end
end
