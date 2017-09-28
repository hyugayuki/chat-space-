json.array! @messages.each do |message|
  json.id          message.id
  json.username    message.user.username
  json.created_at  message.created_at.strftime("%Y-%m-%d %H:%M")
  json.content     message.content
  json.image       message.image
end
