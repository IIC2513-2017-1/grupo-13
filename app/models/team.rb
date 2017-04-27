class Team < ApplicationRecord

has_many :tournaments
has_many :players
end
