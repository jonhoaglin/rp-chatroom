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

ActiveRecord::Schema.define(version: 20160322171829) do

  create_table "char_pictures", force: :cascade do |t|
    t.integer  "character_id",      limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "picture_type_id",   limit: 4
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
  end

  add_index "char_pictures", ["character_id"], name: "index_char_pictures_on_character_id", using: :btree
  add_index "char_pictures", ["picture_type_id"], name: "index_char_pictures_on_picture_type_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "text_color",          limit: 255
    t.integer  "user_id",             limit: 4
    t.integer  "universe_id",         limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "age",                 limit: 255
    t.string   "gender",              limit: 255
    t.string   "location",            limit: 255
    t.string   "occupation",          limit: 255
    t.string   "height",              limit: 255
    t.string   "weight",              limit: 255
    t.text     "likes",               limit: 65535
    t.text     "dislikes",            limit: 65535
    t.text     "interests",           limit: 65535
    t.text     "personality",         limit: 65535
    t.text     "history",             limit: 65535
    t.text     "description",         limit: 65535
    t.text     "misc",                limit: 65535
    t.text     "abilities",           limit: 65535
    t.text     "weaknesses",          limit: 65535
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "characters", ["universe_id"], name: "index_characters_on_universe_id", using: :btree
  add_index "characters", ["user_id"], name: "index_characters_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "universe_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "private"
    t.boolean  "hidden"
  end

  add_index "groups", ["universe_id"], name: "index_groups_on_universe_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "level",      limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "approved"
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "room_id",      limit: 4
    t.integer  "speaker_id",   limit: 4
    t.string   "speaker_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "messages", ["room_id"], name: "index_messages_on_room_id", using: :btree
  add_index "messages", ["speaker_type", "speaker_id"], name: "index_messages_on_speaker_type_and_speaker_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "character_id", limit: 4
    t.integer  "room_id",      limit: 4
    t.boolean  "approved",               default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "participants", ["character_id"], name: "index_participants_on_character_id", using: :btree
  add_index "participants", ["room_id"], name: "index_participants_on_room_id", using: :btree

  create_table "picture_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.boolean  "uni_only"
    t.integer  "group_id",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "private"
    t.boolean  "closed_canon"
    t.boolean  "approval_only"
  end

  add_index "rooms", ["group_id"], name: "index_rooms_on_group_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "universes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.string   "password_digest",     limit: 255
    t.integer  "role_id",             limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "activation_digest",   limit: 255
    t.string   "remember_digest",     limit: 255
    t.string   "reset_digest",        limit: 255
    t.boolean  "activated",                       default: false
    t.datetime "activated_at"
    t.datetime "reset_sent_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "char_pictures", "characters"
  add_foreign_key "char_pictures", "picture_types"
  add_foreign_key "characters", "universes"
  add_foreign_key "characters", "users"
  add_foreign_key "groups", "universes"
  add_foreign_key "members", "groups"
  add_foreign_key "messages", "rooms"
  add_foreign_key "participants", "characters"
  add_foreign_key "participants", "rooms"
  add_foreign_key "rooms", "groups"
  add_foreign_key "users", "roles"
end
