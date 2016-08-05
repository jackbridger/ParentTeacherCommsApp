json.array!(@shortcut_texts) do |shortcut_text|
  json.extract! shortcut_text, :id, :teacher_id, :body
  json.url shortcut_text_url(shortcut_text, format: :json)
end
