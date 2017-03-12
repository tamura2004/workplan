class Dept < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
