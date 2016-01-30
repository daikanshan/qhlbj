json.array!(@admin_information) do |admin_information|
  json.extract! admin_information, :id, :title, :content, :tp
  json.url admin_information_url(admin_information, format: :json)
end
