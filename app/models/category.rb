class Category < ApplicationRecord
  # has_many :brains
  validates :name, presence: true, uniqueness: true
end
