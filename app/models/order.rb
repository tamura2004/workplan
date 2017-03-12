class Order < ApplicationRecord
  belongs_to :project, required: true
  belongs_to :group, required: true
  belongs_to :system, required: true
end
