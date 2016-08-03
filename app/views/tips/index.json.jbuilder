json.array!(@tips) do |tip|
  json.extract! tip, :id, :title, :body, :audience
  json.url tip_url(tip, format: :json)
end
