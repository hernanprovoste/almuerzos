json.array!(@personas) do |persona|
  json.extract! persona, :id, :rut, :nombre
  json.url persona_url(persona, format: :json)
end
