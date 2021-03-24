class Business < ApplicationRecord
  # has_secure_password
  has_many :alliances, through: :business_alliances
  belongs_to :user
  # validates :name, presence: true,
  # validates :email, presence: true, uniqueness: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, length: { minimum: 6 }
end
