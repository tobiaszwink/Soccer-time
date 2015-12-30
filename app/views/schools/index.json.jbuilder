json.array!(@schools) do |school|
  json.extract! school, :id, :name, :times
  json.url school_url(school, format: :json)
end
