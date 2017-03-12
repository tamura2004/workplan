class Group < ApplicationRecord
  belongs_to :dept, required: true
  validates :name, presence: true, uniqueness: true
end
