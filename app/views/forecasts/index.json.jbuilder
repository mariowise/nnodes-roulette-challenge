json.array!(@forecasts) do |forecast|
  json.extract! forecast, :id, :date, :text, :rain
  json.url forecast_url(forecast, format: :json)
end
