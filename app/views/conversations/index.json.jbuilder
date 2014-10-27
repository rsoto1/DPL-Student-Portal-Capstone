json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :board_id, :user_id, :title, :last_commenter_id, :last_comment_at
  json.url conversation_url(conversation, format: :json)
end
