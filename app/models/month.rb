class Month < ApplicationRecord
  validates :date, presence: true, uniqueness: true
  has_many :works
end
