class Matches < ApplicationRecord
  validates [:local,:visitor,:date], presence: true
   has_many :teams
end
