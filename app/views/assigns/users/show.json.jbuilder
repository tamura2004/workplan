json.user do
  json.extract! @user, :id, :number, :name, :rank_id, :group_id
  json.rank_name @user.rank.name
  json.group_name @user.group.name

  json.months do
    json.array! @year.months do |month|
      json.extract! month, :id, :date, :name
    end
  end

  json.users do
    json.array! @users do |user|
      json.extract! user, :id, :number, :name
      json.rank_name user.rank.name
      json.group_name user.group.name
    end
  end

  json.all_orders do
    json.array! @all_orders do |order|
      json.extract! order, :id, :project_id, :group_id, :system_id, :price
      json.project_name order.project.name
      json.group_name order.group.name
      json.system_name order.system.name
    end
  end

  json.orders do
    json.array! @orders do |order|
      json.extract! order, :id, :project_id, :group_id, :system_id, :price
      json.project_name order.project.name
      json.group_name order.group.name
      json.system_name order.system.name

      json.assigns do
        json.array! @year.months do |month|
          assign = @assign_table[order.id][month.id]
          if assign.nil?
            json.merge! @user.assigns.build(order_id: order.id, month_id: month.id).attributes.except("created_at", "updated_at")
          else
            json.extract! assign, :id, :order_id, :user_id, :month_id, :power
            json.prev assign.power
          end
        end
      end
    end
  end
end

