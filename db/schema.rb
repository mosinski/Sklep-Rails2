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

ActiveRecord::Schema.define(:version => 20130123222012) do

  create_table "koszyks", :force => true do |t|
    t.string   "wlasciciel"
    t.integer  "produkt_id"
    t.integer  "ilosc"
    t.decimal  "cena"
    t.decimal  "wartosc"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "rozmiar"
    t.string   "produkt_tytul"
  end

  create_table "produkts", :force => true do |t|
    t.string   "tytul"
    t.text     "opis"
    t.decimal  "cena"
    t.string   "obrazek_url"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "rozmiarxs",   :default => "0"
    t.string   "rozmiars",    :default => "0"
    t.string   "rozmiarm",    :default => "0"
    t.string   "rozmiarl",    :default => "0"
    t.string   "rozmiarxl",   :default => "0"
    t.string   "rozmiarxxl",  :default => "0"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "imie"
    t.string   "nazwisko"
    t.integer  "data_urodzenia_dzien"
    t.integer  "data_urodzenia_miesiac"
    t.integer  "data_urodzenia_rok"
    t.string   "adres_ulica"
    t.string   "adres_kod"
    t.string   "adres_miasto"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",            :default => 0, :null => false
    t.integer  "failed_login_count",     :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
