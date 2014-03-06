json.array!(@theme_names) do |theme_name|
  json.extract! theme_name, :id, :name, :user_id
  json.url theme_name_url(theme_name, format: :json)
end
