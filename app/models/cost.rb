class Cost < ApplicationRecord
  belongs_to :group
  belongs_to :project
  belongs_to :system
  belongs_to :rank
end
