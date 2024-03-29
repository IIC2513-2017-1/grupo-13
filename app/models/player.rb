class Player < ApplicationRecord
  has_secure_password
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/player_not_available.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_save{|player| player.mail = player.mail.downcase}
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, allow_blank: false
  validates :mail, presence: true, uniqueness: true, allow_blank: false,
                    format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validate :validate_dated_around_now
  has_many :teams


  def generate_token_and_save
    loop do 
      self.token = SecureRandom.hex(64)
      break if save
    end
  end 

  private
  def validate_dated_around_now
  self.errors.add(:birthday, "is not valid") unless ((Time.now.to_date - 99.years)..(Time.now.to_date - 18.years)).include?(self.birthday)
end



end
