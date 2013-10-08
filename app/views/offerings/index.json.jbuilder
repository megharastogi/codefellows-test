json.array!(@offerings) do |offering|
  json.extract! offering, :name, :detail
  json.url offering_url(offering, format: :json)
end
