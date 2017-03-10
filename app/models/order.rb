class Order < ApplicationRecord
  belongs_to :project
  belongs_to :group
  belongs_to :system
end
