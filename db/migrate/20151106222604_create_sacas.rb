class CreateSacas < ActiveRecord::Migration
  def change
    create_table :sacas do |t|
      t.datetime :fecha
      t.references :persona, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
