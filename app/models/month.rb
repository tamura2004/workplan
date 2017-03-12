class Month < ApplicationRecord
  validates :date, presence: true, uniqueness: true
end
