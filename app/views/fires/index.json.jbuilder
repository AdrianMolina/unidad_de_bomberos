json.array!(@fires) do |fire|
  json.extract! fire, :id, :numero_caso, :lugar_incidente, :hora_incidente, :descripcion_incidente, :jefe_brigada, :jefe_seguridad, :latitude, :longitude, :emergency_id
  json.url fire_url(fire, format: :json)
end
