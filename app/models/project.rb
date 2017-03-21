class Project < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_many :orders

  def fullname
    "#{number}:#{name}"
  end
end
