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

ActiveRecord::Schema[7.0].define(version: 2023_08_15_163236) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Like", force: :cascade do |t|
    t.bigint "UserId_id", null: false
    t.bigint "PostId_id", null: false
    t.datetime "CreatedAt"
    t.datetime "UpdatedAt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["PostId_id"], name: "index_Like_on_PostId_id"
    t.index ["UserId_id"], name: "index_Like_on_UserId_id"
  end

  create_table "Post", force: :cascade do |t|
    t.bigint "AuthorId_id", null: false
    t.string "Title"
    t.text "Text"
    t.datetime "CreatedAt"
    t.datetime "UpdatedAt"
    t.integer "CommentsCounter"
    t.integer "LikesCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["AuthorId_id"], name: "index_Post_on_AuthorId_id"
  end

  create_table "User", force: :cascade do |t|
    t.string "Name"
    t.string "Photo"
    t.text "Bio"
    t.datetime "UpdatedAt"
    t.datetime "CreatedAt"
    t.integer "PostsCounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "UserId_id", null: false
    t.bigint "PostId_id", null: false
    t.text "Text"
    t.datetime "UpdatedAt"
    t.datetime "CreatedAt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["PostId_id"], name: "index_comments_on_PostId_id"
    t.index ["UserId_id"], name: "index_comments_on_UserId_id"
  end

  add_foreign_key "Like", "Post", column: "PostId_id"
  add_foreign_key "Like", "User", column: "UserId_id"
  add_foreign_key "Post", "User", column: "AuthorId_id"
  add_foreign_key "comments", "Post", column: "PostId_id"
  add_foreign_key "comments", "User", column: "UserId_id"
end
