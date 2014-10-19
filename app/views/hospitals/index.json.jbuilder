json.array!(@hospitals) do |hospital|
  json.extract! hospital, :id, :nombre_hospital, :telefono, :nivel, :tipo, :direccion, :latitude, :longitude
  json.url hospital_url(hospital, format: :json)
end
