json.array!(@admin_messages) do |admin_message|
  json.extract! admin_message, :id, :contact, :content
  json.url admin_message_url(admin_message, format: :json)
end
