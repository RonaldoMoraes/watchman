json.array!(@patrimonies) do |patrimony|
  json.extract! patrimony, :id, :name, :status, :description
  json.url patrimony_url(patrimony, format: :json)
end
