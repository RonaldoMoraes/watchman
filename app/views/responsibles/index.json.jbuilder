json.array!(@responsibles) do |responsible|
  json.extract! responsible, :id, :name, :email
  json.url responsible_url(responsible, format: :json)
end
