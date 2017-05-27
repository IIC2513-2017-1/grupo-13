class Tournamentteam < ApplicationRecord
  validates :team_id, presence: true, uniqueness: true
end
