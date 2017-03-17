class Rank < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :unit_price, presence: true
end
