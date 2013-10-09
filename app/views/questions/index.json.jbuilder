json.array!(@questions) do |question|
  json.extract! question, :name
  json.url question_url(question, format: :json)
end
