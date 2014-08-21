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

ActiveRecord::Schema.define(version: 20140821151731) do

  create_table "affected_people", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.integer  "explosive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "affected_people", ["explosive_id"], name: "index_affected_people_on_explosive_id"

  create_table "assist_explosives", force: true do |t|
    t.integer  "user_id"
    t.integer  "explosive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assist_explosives", ["explosive_id"], name: "index_assist_explosives_on_explosive_id"
  add_index "assist_explosives", ["user_id"], name: "index_assist_explosives_on_user_id"

  create_table "assist_fires", force: true do |t|
    t.integer  "user_id"
    t.integer  "fire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assist_fires", ["fire_id"], name: "index_assist_fires_on_fire_id"
  add_index "assist_fires", ["user_id"], name: "index_assist_fires_on_user_id"

  create_table "assist_rescues", force: true do |t|
    t.integer  "user_id"
    t.integer  "rescue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assist_rescues", ["rescue_id"], name: "index_assist_rescues_on_rescue_id"
  add_index "assist_rescues", ["user_id"], name: "index_assist_rescues_on_user_id"

  create_table "assists", force: true do |t|
    t.integer  "user_id"
    t.integer  "explosive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assists", ["explosive_id"], name: "index_assists_on_explosive_id"
  add_index "assists", ["user_id"], name: "index_assists_on_user_id"

  create_table "drivers", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drivers", ["user_id"], name: "index_drivers_on_user_id"
  add_index "drivers", ["vehicle_id"], name: "index_drivers_on_vehicle_id"

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

  create_table "explosive_material_useds", force: true do |t|
    t.integer  "material_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "explosive_id"
  end

  add_index "explosive_material_useds", ["explosive_id"], name: "index_explosive_material_useds_on_explosive_id"
  add_index "explosive_material_useds", ["material_id"], name: "index_explosive_material_useds_on_material_id"

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

  create_table "fire_affected_people", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.integer  "fire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fire_affected_people", ["fire_id"], name: "index_fire_affected_people_on_fire_id"

  create_table "fire_institutions", force: true do |t|
    t.string   "nombre"
    t.string   "trabajo"
    t.integer  "fire_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fire_institutions", ["fire_id"], name: "index_fire_institutions_on_fire_id"

  create_table "fires", force: true do |t|
    t.string   "numero_caso"
    t.string   "lugar_incidente"
    t.time     "hora_incidente"
    t.text     "descripcion_incidente"
    t.string   "jefe_brigada"
    t.string   "jefe_seguridad"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "emergency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fires", ["emergency_id"], name: "index_fires_on_emergency_id"

  create_table "institutions", force: true do |t|
    t.string   "nombre"
    t.string   "trabajo"
    t.integer  "explosive_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institutions", ["explosive_id"], name: "index_institutions_on_explosive_id"

  create_table "materials", force: true do |t|
    t.string   "especialidad"
    t.string   "codigo"
    t.string   "estado"
    t.string   "ubicacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rescue_affected_people", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.integer  "rescue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rescue_affected_people", ["rescue_id"], name: "index_rescue_affected_people_on_rescue_id"

  create_table "rescue_institutions", force: true do |t|
    t.string   "nombre"
    t.string   "trabajo"
    t.integer  "rescue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rescue_institutions", ["rescue_id"], name: "index_rescue_institutions_on_rescue_id"

  create_table "rescues", force: true do |t|
    t.string   "numero_caso"
    t.string   "lugar_incidente"
    t.time     "hora_incidente"
    t.text     "descripcion_incidente"
    t.text     "observaciones"
    t.string   "danos_materiales"
    t.string   "jefe_brigada"
    t.string   "jefe_seguridad"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "emergency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rescues", ["emergency_id"], name: "index_rescues_on_emergency_id"

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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vehicle_drivers", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_drivers", ["user_id"], name: "index_vehicle_drivers_on_user_id"
  add_index "vehicle_drivers", ["vehicle_id"], name: "index_vehicle_drivers_on_vehicle_id"

  create_table "vehicles", force: true do |t|
    t.string   "sigla"
    t.string   "placa"
    t.string   "modelo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "especialidad"
  end

end
