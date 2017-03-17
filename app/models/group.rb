class Group < ApplicationRecord
  belongs_to :dept, required: true
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
