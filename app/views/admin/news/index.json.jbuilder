json.array!(@admin_news) do |admin_news|
  json.extract! admin_news, :id, :name, :content
  json.url admin_news_url(admin_news, format: :json)
end
