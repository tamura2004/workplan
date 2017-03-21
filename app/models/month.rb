class Month < ApplicationRecord
  validates :date, presence: true, uniqueness: true

  has_many :works
  has_many :costs
  has_many :assigns
  has_many :orders, through: :assigns

  validate :must_be_first_day_of_month

  def must_be_first_day_of_month
    if date.day != 1
      errors.add(:illegal_date, "日付は月初１日でなくてはならない")
    end
  end

  def name
    date.strftime("%Y-%m")
  end
end
