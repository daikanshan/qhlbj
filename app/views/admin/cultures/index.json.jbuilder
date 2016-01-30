json.array!(@admin_cultures) do |admin_culture|
  json.extract! admin_culture, :id, :title, :content
  json.url admin_culture_url(admin_culture, format: :json)
end
