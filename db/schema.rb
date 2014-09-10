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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140823222442) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "showcase_id"
    t.string   "content"
    t.integer  "likes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["showcase_id"], :name => "index_comments_on_showcase_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "documents", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "galleries", :force => true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "galleries", ["id"], :name => "index_galleries_on_id"
  add_index "galleries", ["user_id"], :name => "index_galleries_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "showcases", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "title"
    t.string   "description"
    t.string   "upload_date"
    t.integer  "likes"
    t.integer  "visits"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "canvas_file_name"
    t.string   "canvas_content_type"
    t.integer  "canvas_file_size"
    t.datetime "canvas_updated_at"
  end

  add_index "showcases", ["gallery_id", "id"], :name => "index_showcases_on_gallery_id_and_id", :unique => true
  add_index "showcases", ["gallery_id"], :name => "index_showcases_on_gallery_id"
  add_index "showcases", ["id"], :name => "index_showcases_on_id"

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email",                           :null => false
    t.string   "crypted_password",                :null => false
    t.string   "salt",                            :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
