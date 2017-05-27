class Event < ApplicationRecord
  validates :player_id, presence: true, uniqueness: true

end
