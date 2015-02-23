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

ActiveRecord::Schema.define(version: 0) do

  create_table "class_students", primary_key: "ID", force: :cascade do |t|
    t.integer "student_id", limit: 4, null: false
    t.integer "class_id",   limit: 4, null: false
  end

  add_index "class_students", ["ID"], name: "CSID_UNIQUE", unique: true, using: :btree
  add_index "class_students", ["class_id"], name: "fk_class_class_student_idx", using: :btree
  add_index "class_students", ["student_id"], name: "fk_users_class_students_idx", using: :btree

  create_table "classes", primary_key: "ID", force: :cascade do |t|
    t.string  "name",           limit: 50, default: "", null: false
    t.integer "professors_id",  limit: 4,               null: false
    t.integer "code",           limit: 4,               null: false
    t.integer "class_date_id",  limit: 4,               null: false
    t.integer "class_time_id",  limit: 4,               null: false
    t.string  "abbreviation",   limit: 50, default: "", null: false
    t.integer "section_number", limit: 4,               null: false
    t.integer "time",           limit: 4,               null: false
    t.integer "professor",      limit: 4,               null: false
    t.string  "location",       limit: 50, default: "", null: false
    t.string  "room_number",    limit: 50, default: "", null: false
    t.string  "classify",       limit: 50, default: "", null: false
  end

  add_index "classes", ["ID"], name: "idClass_UNIQUE", unique: true, using: :btree
  add_index "classes", ["class_date_id"], name: "fk_possible_date_class_idx", using: :btree
  add_index "classes", ["class_time_id"], name: "fk_possible_time_class_idx", using: :btree
  add_index "classes", ["professors_id"], name: "fk_professor_class_idx", using: :btree

  create_table "messages", primary_key: "ID", force: :cascade do |t|
    t.string   "title",       limit: 255, default: "", null: false
    t.string   "content",     limit: 255, default: "", null: false
    t.integer  "receiver_ID", limit: 4,                null: false
    t.integer  "sender_ID",   limit: 4,                null: false
    t.datetime "date_time",                            null: false
    t.string   "status",      limit: 45,  default: "", null: false
  end

  add_index "messages", ["receiver_ID"], name: "fk_users_messages_idx", using: :btree
  add_index "messages", ["sender_ID"], name: "fk_messages_2_idx", using: :btree

  create_table "mod_privileges", primary_key: "ID", force: :cascade do |t|
    t.integer "privilege_ID", limit: 4, null: false
    t.integer "mod_ID",       limit: 4, null: false
  end

  add_index "mod_privileges", ["mod_ID"], name: "fk_mod_mod_p_idx", using: :btree
  add_index "mod_privileges", ["privilege_ID"], name: "fk_privileges_mod_p_idx", using: :btree

  create_table "mods", primary_key: "ID", force: :cascade do |t|
    t.string "mod_name", limit: 50
  end

  create_table "posts", primary_key: "ID", force: :cascade do |t|
    t.string   "content",   limit: 50, default: "", null: false
    t.datetime "date_time",                         null: false
    t.integer  "poster_ID", limit: 4,               null: false
  end

  add_index "posts", ["poster_ID"], name: "fk_user_post_idx", using: :btree

  create_table "privileges", primary_key: "ID", force: :cascade do |t|
    t.string "privilege_name", limit: 50, null: false
  end

  create_table "professors", primary_key: "ID", force: :cascade do |t|
    t.string  "name",            limit: 255, default: "", null: false
    t.string  "taking_class",    limit: 50,  default: "", null: false
    t.integer "taking_class_ID", limit: 4,                null: false
    t.string  "office_location", limit: 50,  default: "", null: false
    t.string  "email",           limit: 50,  default: "", null: false
    t.string  "phone_number",    limit: 50,  default: "", null: false
    t.string  "rate",            limit: 50,  default: "", null: false
    t.integer "weekday_ID",      limit: 4,                null: false
    t.integer "times_ID",        limit: 4,                null: false
  end

  add_index "professors", ["ID"], name: "PID_UNIQUE", unique: true, using: :btree
  add_index "professors", ["taking_class_ID"], name: "fk_class_professor_idx", using: :btree
  add_index "professors", ["times_ID"], name: "fk_possible_time_professor_idx", using: :btree
  add_index "professors", ["weekday_ID"], name: "fk_possible_date_professor_idx", using: :btree

  create_table "role_privileges", primary_key: "ID", force: :cascade do |t|
    t.integer "role_ID",          limit: 4, null: false
    t.integer "mod_privilege_ID", limit: 4, null: false
  end

  add_index "role_privileges", ["mod_privilege_ID"], name: "fk_mod_p_role_p_idx", using: :btree
  add_index "role_privileges", ["role_ID"], name: "fk_role_role_p_idx", using: :btree

  create_table "roles", primary_key: "ID", force: :cascade do |t|
    t.string "role_name", limit: 50, null: false
  end

  create_table "times", primary_key: "ID", force: :cascade do |t|
    t.time "start", null: false
    t.time "end",   null: false
  end

  add_index "times", ["ID"], name: "TIMEID_UNIQUE", unique: true, using: :btree

  create_table "user_roles", primary_key: "ID", force: :cascade do |t|
    t.integer "users_ID", limit: 4, null: false
    t.integer "role_ID",  limit: 4, null: false
  end

  add_index "user_roles", ["role_ID"], name: "fk_roles_user_roles_idx", using: :btree
  add_index "user_roles", ["users_ID"], name: "fk_users_ID_idx", using: :btree

  create_table "users", primary_key: "ID", force: :cascade do |t|
    t.string   "name",         limit: 50, default: "", null: false
    t.string   "password",     limit: 50, default: "", null: false
    t.datetime "last_login"
    t.string   "gender",       limit: 50, default: "", null: false
    t.date     "birthday",                             null: false
    t.string   "email",        limit: 50,              null: false
    t.integer  "phone_number", limit: 4
  end

  add_index "users", ["ID"], name: "idUser_UNIQUE", unique: true, using: :btree
  add_index "users", ["phone_number"], name: "phone_number_UNIQUE", unique: true, using: :btree

  create_table "weekdays", primary_key: "ID", force: :cascade do |t|
    t.date "date", null: false
  end

  add_index "weekdays", ["ID"], name: "DATEID_UNIQUE", unique: true, using: :btree

  add_foreign_key "class_students", "classes", primary_key: "ID", name: "fk_class_class_students"
  add_foreign_key "class_students", "users", column: "student_id", primary_key: "ID", name: "fk_users_class_students"
  add_foreign_key "classes", "professors", column: "professors_id", primary_key: "ID", name: "fk_professor_class"
  add_foreign_key "classes", "times", column: "class_time_id", primary_key: "ID", name: "fk_possible_time_class"
  add_foreign_key "classes", "weekdays", column: "class_date_id", primary_key: "ID", name: "fk_possible_date_class"
  add_foreign_key "messages", "users", column: "receiver_ID", primary_key: "ID", name: "fk_messages_1"
  add_foreign_key "messages", "users", column: "sender_ID", primary_key: "ID", name: "fk_messages_2"
  add_foreign_key "mod_privileges", "mods", column: "mod_ID", primary_key: "ID", name: "fk_mod_mod_p"
  add_foreign_key "mod_privileges", "privileges", column: "privilege_ID", primary_key: "ID", name: "fk_privileges_mod_p"
  add_foreign_key "posts", "users", column: "poster_ID", primary_key: "ID", name: "fk_user_post"
  add_foreign_key "professors", "classes", column: "taking_class_ID", primary_key: "ID", name: "fk_class_professor"
  add_foreign_key "professors", "times", column: "times_ID", primary_key: "ID", name: "fk_possible_time_professor"
  add_foreign_key "professors", "weekdays", column: "weekday_ID", primary_key: "ID", name: "fk_possible_date_professor"
  add_foreign_key "role_privileges", "mod_privileges", column: "mod_privilege_ID", primary_key: "ID", name: "fk_mod_p_role_p"
  add_foreign_key "role_privileges", "roles", column: "role_ID", primary_key: "ID", name: "fk_role_role_p"
  add_foreign_key "user_roles", "roles", column: "role_ID", primary_key: "ID", name: "fk_roles_user_roles"
  add_foreign_key "user_roles", "users", column: "users_ID", primary_key: "ID", name: "fk_users_ID"
end
