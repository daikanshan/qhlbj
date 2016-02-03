json.array!(@admin_configs) do |admin_config|
  json.extract! admin_config, :id, :name, :avatar, :val, :url
  json.url admin_config_url(admin_config, format: :json)
end
