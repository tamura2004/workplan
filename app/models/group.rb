class Group < ApplicationRecord
  belongs_to :dept
  validates :name, presence: true, uniqueness: true
  validates :dept, presence: true
end
