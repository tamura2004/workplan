class Assign < ApplicationRecord
  belongs_to :group
  belongs_to :project
  belongs_to :system
  belongs_to :user
  belongs_to :month

  validates :group, presence: true
  validates :project, presence: true
  validates :system, presence: true
  validates :user, presence: true
  validates :month, presence: true
end
