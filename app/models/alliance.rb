class Alliance < ApplicationRecord
  has_many :businesses
  has_many :users, through:  :user_alliances
end
