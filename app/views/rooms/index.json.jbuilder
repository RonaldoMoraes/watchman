json.array!(@rooms) do |room|
  json.extract! room, :id, :identifier, :locale, :capacity, :lab
  json.url room_url(room, format: :json)
end
