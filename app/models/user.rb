class User < ApplicationRecord
  belongs_to :rank, required: true
  belongs_to :group, required: true

  validates :number, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_many :works
  has_many :assigns
  has_many :orders, through: :assigns
  has_many :projects, through: :orders

  accepts_nested_attributes_for :assigns, allow_destroy: true

  scope :aligned, -> { includes(:group, :rank).order("ranks.number desc").order(number: :asc) }

  def fullname
    number + " " + name
  end
end
