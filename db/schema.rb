# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151107004206) do

  create_table "alumnos", force: :cascade do |t|
    t.string   "rut"
    t.string   "nombre"
    t.integer  "salida_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cantidad"
  end

  add_index "alumnos", ["salida_id"], name: "index_alumnos_on_salida_id"

  create_table "personas", force: :cascade do |t|
    t.string   "rut"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cantidad"
  end

  create_table "sacas", force: :cascade do |t|
    t.datetime "fecha"
    t.integer  "persona_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sacas", ["persona_id"], name: "index_sacas_on_persona_id"

  create_table "salidas", force: :cascade do |t|
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
