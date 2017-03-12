class Work < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :month, required: true

  validates :user, uniqueness: { scope: :month }
  validates :power, presence: true
end
