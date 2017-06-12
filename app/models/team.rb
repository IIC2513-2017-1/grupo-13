class Team < ApplicationRecord
has_attached_file :logo, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/assets/team_not_available.png"
validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
has_many :tournaments
has_many :players
end
