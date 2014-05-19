json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :sigla, :placa, :modelo
  json.url vehicle_url(vehicle, format: :json)
end
