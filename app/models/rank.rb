class Rank < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :unit_price, presence: true
end
