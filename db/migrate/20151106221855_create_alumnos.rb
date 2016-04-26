class CreateAlumnos < ActiveRecord::Migration
  def change
    create_table :alumnos do |t|
      t.string :rut
      t.string :nombre
      t.references :salida, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
