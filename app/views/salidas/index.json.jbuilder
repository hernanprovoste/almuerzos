json.array!(@salidas) do |salida|
  json.extract! salida, :id, :fecha
  json.url salida_url(salida, format: :json)
end
