json.array!(@comments) do |comment|
  json.extract! comment, :id, :description, :createddate
  json.url comment_url(comment, format: :json)
end
