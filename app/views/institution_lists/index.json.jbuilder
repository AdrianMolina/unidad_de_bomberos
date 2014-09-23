json.array!(@institution_lists) do |institution_list|
  json.extract! institution_list, :id, :sigla, :nombre
  json.url institution_list_url(institution_list, format: :json)
end
