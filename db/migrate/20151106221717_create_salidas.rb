class CreateSalidas < ActiveRecord::Migration
  def change
    create_table :salidas do |t|
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
