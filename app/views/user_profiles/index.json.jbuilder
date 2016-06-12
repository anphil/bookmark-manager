json.array!(@user_profiles) do |user_profile|
  json.extract! user_profile, :id, :background_image, :user_id
  json.url user_profile_url(user_profile, format: :json)
end