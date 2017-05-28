class Player < ApplicationRecord
  before_create :confirmation_token
  
  has_secure_password
  before_save{|player| player.mail = player.mail.downcase}
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :mail, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validate :validate_dated_around_now
  has_many :teams

  private
  def validate_dated_around_now
  self.errors.add(:birthday, "is not valid") unless ((Time.now.to_date - 99.years)..(Time.now.to_date - 18.years)).include?(self.birthday)
  end

  def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
