json.array!(@offerings) do |offering|
  json.extract! offering, :name, :detail,:start_date,:end_date,:created_at
  json.url offering_url(offering, format: :json)
end
