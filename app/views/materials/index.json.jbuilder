json.array!(@materials) do |material|
  json.extract! material, :id, :especialidad, :codigo, :estado, :ubicacion
  json.url material_url(material, format: :json)
end
