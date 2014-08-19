json.array!(@rescues) do |rescue|
  json.extract! rescue, :id, :numero_caso, :lugar_incidente, :hora_incidente, :descripcion_incidente, :observaciones, :danos_materiales, :jefe_brigada, :jefe_seguridad, :latitude, :longitude, :emergency_id
  json.url rescue_url(rescue, format: :json)
end
