class Work < ApplicationRecord
  belongs_to :user
  belongs_to :month

  validates :user, presence: true, uniqueness: { scope: :user }
  validates :month, presence: true
  validates :power, presence: true
end
