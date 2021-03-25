class User < ApplicationRecord
  has_secure_password
  has_many :alliances, through: :user_alliances
  has_many :businesses
  

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }
end
