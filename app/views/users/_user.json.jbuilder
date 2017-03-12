json.extract! user, :id, :number, :name, :rank_id, :group_id, :end_month, :created_at, :updated_at
json.url user_url(user, format: :json)
