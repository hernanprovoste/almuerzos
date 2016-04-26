json.array!(@alumnos) do |alumno|
  json.extract! alumno, :id, :rut, :nombre, :salida_id
  json.url alumno_url(alumno, format: :json)
end
