json.array!(@admission_requests) do |admission_request|
  json.extract! admission_request, :user_id, :why_join, :previous_programming_exp, :best_thing_ever, :find_about_cf, :phone_number
  json.url admission_request_url(admission_request, format: :json)
end
