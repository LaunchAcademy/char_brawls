class Opinion < ActiveRecord::Base
  belongs_to :matchup
  belongs_to :user
  belongs_to :winner, class_name: "Character"

  validates :body, presence: {:message => "The opinion can't be empty!"}
  validates :body, uniqueness: {:message => "That opinion already exists!"}
  validates :winner_id, presence: {:message => "You must vote!"}
end
