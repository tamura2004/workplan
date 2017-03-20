class Schedule < ApplicationRecord
  belongs_to :project
  belongs_to :month
  belongs_to :step
end
