json.array!(@explosives) do |explosife|
  json.extract! explosife, :id, :numero_caso, :fecha, :lugar_incidente, :hora_incidente, :descripcion_incidente, :material_utilizado, :observaciones_incidente, :jefe_brigada, :jefe_seguridad, :emergency_id
  json.url explosife_url(explosife, format: :json)
end
