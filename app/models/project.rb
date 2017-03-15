class Project < ApplicationRecord
  belongs_to :month, required: true
  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def fullname
    "#{number}:#{name}"
  end
end
