class Work < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :month, required: true

  validates :user, uniqueness: { scope: :month }
  validates :power, presence: true
end
