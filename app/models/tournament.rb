class Tournament < ApplicationRecord

has_many :teams
belongs_to :organizers
end
