class Assign < ApplicationRecord
  belongs_to :order, required: true
  belongs_to :user, required: true
  belongs_to :month, required: true
end
