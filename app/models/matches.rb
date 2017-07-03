class Matches < ApplicationRecord
  validates :local, presence: true
  validates :visitor, presence: true
  validates :date, presence: true
   has_many :teams
end
