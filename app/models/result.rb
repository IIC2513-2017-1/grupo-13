class Result < ApplicationRecord
  validates :local,presence: true, numericality: { only_integer: true ,greater_than_or_equal_to: 0}
  validates :visitor,presence: true, numericality: { only_integer: true ,greater_than_or_equal_to: 0}

end
