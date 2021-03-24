class Alliance < ApplicationRecord
  has_many :businesses, through: :business_alliances
  has_many :users, through:  :user_alliances
end
