json.extract! entry, :id, :target_id, :source, :title, :description, :grouping, :date, :commentsretweets, :responses, :likes, :created_at, :updated_at
json.url entry_url(entry, format: :json)
