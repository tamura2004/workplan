class User < ApplicationRecord
  belongs_to :rank, required: true
  belongs_to :group, required: true
  belongs_to :month, required: true

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_many :works
  has_many :assigns
  has_many :orders, through: :assigns
  has_many :projects, through: :orders

  def fullname
    number + " " + name
  end
end
