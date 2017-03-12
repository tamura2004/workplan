class User < ApplicationRecord
  belongs_to :rank, required: true
  belongs_to :group, required: true
  belongs_to :month, required: true

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
