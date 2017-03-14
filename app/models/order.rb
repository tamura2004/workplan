class Order < ApplicationRecord
  belongs_to :project, required: true
  belongs_to :group, required: true
  belongs_to :system, required: true

  def name
    [project.number, project.name, group.name, system.number, system.name].join(' ')
  end

  def sortkey
    sprintf("%12s%02d%10s", project.number, group.id, system.number)
  end
end
