class Player < ApplicationRecord
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :mail, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :age, presence: true, allow_blank: false,
                    numericality: {only_integer: true, greater_than_or_equal_to: 15,
                      less_than_or_equal_to:99}


has_many :teams

end
