class AddCantidadToPersona < ActiveRecord::Migration
  def change
    add_column :personas, :cantidad, :integer
  end
end
