json.array!(@pre_hospitals) do |pre_hospital|
  json.extract! pre_hospital, :id, :numero_caso, :hora_incidente, :accidente_vehicular, :peritaje_vehicular, :trauma, :diagnostico, :prioridad_traslado, :desarrollo_atencion, :pertenencias_victima, :emergency_id
  json.url pre_hospital_url(pre_hospital, format: :json)
end
