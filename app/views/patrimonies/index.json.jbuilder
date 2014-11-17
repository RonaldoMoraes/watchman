json.array!(@patrimonies) do |patrimony|
  json.extract! patrimony, :id, :name, :identifier, :status, :description, :responsible_id, :room_id
  json.url patrimony_url(patrimony, format: :json)
end
