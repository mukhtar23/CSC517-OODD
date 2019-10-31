json.extract! user, :id, :name, :email, :password, :phone, :contact_method, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
