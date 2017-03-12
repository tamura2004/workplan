class Cost < ApplicationRecord
  belongs_to :group, required: true
  belongs_to :project, required: true
  belongs_to :system, required: true
  belongs_to :rank, required: true
  belongs_to :month, required: true
end
