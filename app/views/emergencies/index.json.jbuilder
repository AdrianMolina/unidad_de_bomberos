json.array!(@emergencies) do |emergency|
  json.extract! emergency, :id, :lugar, :denunciante, :telefono_denunciante, :numero_caso, :hora_salida, :observacion, :referencia_lugar, :tipo
  json.url emergency_url(emergency, format: :json)
end
