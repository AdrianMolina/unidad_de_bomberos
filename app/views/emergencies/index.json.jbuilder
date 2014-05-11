json.array!(@emergencies) do |emergency|
  json.extract! emergency, :id, :lugar, :denunciante, :telefono_denunciante, :numero_caso, :sigla_vehiculo, :hora_salida, :observacion, :despachador, :referencia_lugar, :tipo
  json.url emergency_url(emergency, format: :json)
end
