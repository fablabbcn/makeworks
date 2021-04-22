json.extract! user, :id, :first_name, :last_name, :created_at, :updated_at, :name
json.url user_url(user, format: :json)
if user.avatar.attached?
  json.avatar user.avatar.url
else
  json.avatar image_url('favicon.png')
end
