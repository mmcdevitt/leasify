json.array!(@sidebar_links) do |sidebar_link|
  json.extract! sidebar_link, :id, :name, :link_to, :icon
  json.url sidebar_link_url(sidebar_link, format: :json)
end
