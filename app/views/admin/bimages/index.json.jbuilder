json.array!(@admin_bimages) do |admin_bimage|
  json.extract! admin_bimage, :id, :title, :avatar, :shown, :abstract
  json.url admin_bimage_url(admin_bimage, format: :json)
end
