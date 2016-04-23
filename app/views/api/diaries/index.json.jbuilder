json.array!(@diaries) do |diary|
  json.extract! diary, :id, :diaryname, :published, :content, :status, :keywords
  json.url diary_url(diary, format: :json)
end
