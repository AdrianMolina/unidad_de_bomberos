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

ActiveRecord::Schema.define(version: 20140704163123) do

  create_table "emergencies", force: true do |t|
    t.string   "lugar"
    t.string   "denunciante"
    t.string   "telefono_denunciante"
    t.string   "numero_caso"
    t.string   "sigla_vehiculo"
    t.datetime "hora_salida"
    t.text     "observacion"
    t.text     "referencia_lugar"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "vehicle_id"
    t.boolean  "estado"
  end

  add_index "emergencies", ["user_id"], name: "index_emergencies_on_user_id"
  add_index "emergencies", ["vehicle_id"], name: "index_emergencies_on_vehicle_id"

  create_table "explosives", force: true do |t|
    t.string   "numero_caso"
    t.date     "fecha"
    t.string   "lugar_incidente"
    t.time     "hora_incidente"
    t.text     "descripcion_incidente"
    t.text     "material_utilizado"
    t.text     "observaciones_incidente"
    t.string   "jefe_brigada"
    t.string   "jefe_seguridad"
    t.integer  "emergency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "Longitude"
  end

  add_index "explosives", ["emergency_id"], name: "index_explosives_on_emergency_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "rango"
    t.string   "estado"
    t.string   "ap_materno"
    t.string   "escalafon"
    t.string   "especialidad"
    t.integer  "telefono"
    t.integer  "celular"
    t.date     "fecha_nacimiento"
    t.integer  "egreso"
    t.string   "institucion"
    t.string   "cargo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vehicles", force: true do |t|
    t.string   "sigla"
    t.string   "placa"
    t.string   "modelo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "especialidad"
  end

end
