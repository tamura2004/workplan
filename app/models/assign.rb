class Assign < ApplicationRecord
  belongs_to :order, required: true
  belongs_to :user, required: true
  belongs_to :month, required: true

  scope :aligned, -> {
    all.sort_by do |assign|
      [
        assign.order.sortkey,
        assign.user.rank.id,
        assign.user.number,
        assign.month.date
      ]
    end
  }

end
