json.(@users) do | user|
  json.extract! user, :name, :is_teacher
end
