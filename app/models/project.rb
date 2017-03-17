class Project < ApplicationRecord
  belongs_to :month, required: true #終了日

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_many :orders

  def fullname
    "#{number}:#{name}"
  end
end
