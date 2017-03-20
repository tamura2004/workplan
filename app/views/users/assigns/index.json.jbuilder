json.user do
  json.merge! @user.attributes.except("created_at", "updated_at")
  json.rank_name @user.rank.name

  json.months do
    json.array! @year.months do |month|
      json.extract! month, :date, :name
    end
  end

  json.orders_attributes do
    json.array! @user.orders do |order|
      json.merge! order.attributes.except("created_at", "updated_at")
      json.project_name order.project.name
      json.group_name order.group.name
      json.system_name order.system.name

      json.assigns_attributes do
        json.array! @year.months do |month|
          assign = @user.assigns.find_by(order_id: order.id, month_id: month.id)
          if assign
            json.merge! assign.attributes.except("created_at", "updated_at")
            json.month_name month.name
          else
            json.merge! @user.assigns.build(order_id: order.id, month_id: month.id).attributes.except("created_at", "updated_at")
          end
          json.month_name month.name
        end
      end

    end
  end
end
