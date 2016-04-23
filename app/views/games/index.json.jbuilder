json.array!(@games) do |game|
  json.extract! game, :id, :id
  json.url game_url(game, format: :json)
end
