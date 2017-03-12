class User < ApplicationRecord
  belongs_to :rank
  belongs_to :group

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :rank, presence: true
  validates :group, presence: true
end
