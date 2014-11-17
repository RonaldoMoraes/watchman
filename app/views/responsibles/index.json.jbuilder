json.array!(@responsibles) do |responsible|
  json.extract! responsible, :id, :identifier, :name, :email, :birth, :address, :tel
  json.url responsible_url(responsible, format: :json)
end
