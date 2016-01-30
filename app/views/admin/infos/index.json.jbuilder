json.array!(@admin_infos) do |admin_info|
  json.extract! admin_info, :id, :title, :content
  json.url admin_info_url(admin_info, format: :json)
end
