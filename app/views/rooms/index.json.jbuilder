json.array!(@rooms) do |room|
  json.extract! room, :id, :local
  json.url room_url(room, format: :json)
end
