json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :title, :suite_or_floor, :availability, :sf, :rental_rate, :content, :user_id
  json.url availability_url(availability, format: :json)
end
