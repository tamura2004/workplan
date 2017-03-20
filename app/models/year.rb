class Year < ApplicationRecord
  has_many :months
  has_many :assigns, through: :months
  has_many :orders, through: :assigns
  has_many :users, through: :assigns
end
