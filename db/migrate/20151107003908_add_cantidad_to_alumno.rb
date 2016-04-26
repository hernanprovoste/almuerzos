class AddCantidadToAlumno < ActiveRecord::Migration
  def change
    add_column :alumnos, :cantidad, :integer
  end
end
