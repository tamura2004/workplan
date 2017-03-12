class Order < ApplicationRecord
  belongs_to :project
  belongs_to :group
  belongs_to :system

  validates :project, presence: true
  validates :group, presence: true
  validates :system, presence: true
  validates :price, presence: true
end
