# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_003_145_610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'blog_tags', force: :cascade do |t|
    t.bigint 'blog_id'
    t.bigint 'tag_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[blog_id tag_id], name: 'index_blog_tags_on_blog_id_and_tag_id', unique: true
    t.index ['blog_id'], name: 'index_blog_tags_on_blog_id'
    t.index ['tag_id'], name: 'index_blog_tags_on_tag_id'
  end

  create_table 'blogs', force: :cascade do |t|
    t.string 'title', null: false
    t.text 'body', null: false
    t.integer 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'status', default: 0, null: false
    t.index ['author_id'], name: 'index_blogs_on_author_id'
  end

  create_table 'identities', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.string 'provider', limit: 64, null: false
    t.string 'uid', limit: 64, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[provider uid], name: 'index_identities_on_provider_and_uid', unique: true
    t.index ['user_id'], name: 'index_identities_on_user_id'
  end

  create_table 'invitations', force: :cascade do |t|
    t.string 'email', limit: 256, null: false
    t.text 'message', null: false
    t.integer 'introducer_id', null: false
    t.string 'token', null: false
    t.datetime 'expired_at', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['introducer_id'], name: 'index_invitations_on_introducer_id'
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_tags_on_name', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'nickname', limit: 64, null: false
    t.string 'icon_url'
    t.text 'introduction'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'blog_tags', 'blogs'
  add_foreign_key 'blog_tags', 'tags'
end
