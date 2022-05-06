# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_06_065505) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "name", null: false
    t.text "cover_image_data"
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title", null: false
    t.string "color", null: false
    t.text "cover_image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_songs", id: false, force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "genre_id", null: false
    t.index ["genre_id"], name: "index_genres_songs_on_genre_id"
    t.index ["song_id"], name: "index_genres_songs_on_song_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name", null: false
    t.text "cover_image_data"
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.boolean "is_public", default: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "playlist_id", null: false
    t.index ["playlist_id"], name: "index_playlists_songs_on_playlist_id"
    t.index ["song_id"], name: "index_playlists_songs_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.text "music_file_data", null: false
    t.string "title", null: false
    t.bigint "artist_id", null: false
    t.string "color", null: false
    t.text "cover_image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "album_id"
    t.boolean "published", default: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "provider"
    t.string "uid"
    t.jsonb "avatar_data"
    t.boolean "is_admin", default: false
    t.index ["avatar_data"], name: "index_users_on_avatar_data", using: :gin
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "users", column: "artist_id"
  add_foreign_key "playlists", "users"
  add_foreign_key "songs", "albums"
  add_foreign_key "songs", "users", column: "artist_id"
end
