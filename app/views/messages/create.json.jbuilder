  json.id @message.id
  json.content @message.content
  json.image @message.image
  json.user_id @message.user_id
  json.group_id @message.group_id
  json.created_at @message.created_at.strftime("%Y-%m-%d %H:%M")
  json.updated_at @message.updated_at
  json.username @message.user.username
