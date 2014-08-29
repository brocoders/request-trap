json.array!(@requests) do |request|
  json.extract! request, :id, :trap_id, :data
  json.url request_url(request, format: :json)
end
