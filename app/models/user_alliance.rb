class UserAlliance < ApplicationRecord
  belongs_to :user
  belongs_to :alliance
end