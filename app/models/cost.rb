class Cost < ApplicationRecord
  belongs_to :order, required: true
  belongs_to :rank, required: true
  belongs_to :month, required: true
end
