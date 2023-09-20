class Group < ApplicationRecord
  has_many :entities
  has_many :authors, through: :entities
end
