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

ActiveRecord::Schema.define(:version => 20130316191748) do

  create_table "carts", :force => true do |t|
    t.integer  "shopper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "saved_id"
  end

  create_table "carts_items", :id => false, :force => true do |t|
    t.integer "cart_id"
    t.integer "item_id"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "shopkeeper_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.decimal  "price"
  end

  create_table "items_orders", :id => false, :force => true do |t|
    t.integer "order_id"
    t.integer "item_id"
  end

  create_table "items_saveds", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "saved_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders_shopkeepers", :id => false, :force => true do |t|
    t.integer "shopkeeper_id"
    t.integer "order_id"
  end

  create_table "saveds", :force => true do |t|
    t.integer  "shopper_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "saveds", ["shopper_id"], :name => "index_saveds_on_shopper_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "type"
  end

end
