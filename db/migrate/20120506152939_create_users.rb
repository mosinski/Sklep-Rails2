class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :imie
      t.string  :nazwisko
      t.integer :data_urodzenia_dzien
      t.integer :data_urodzenia_miesiac
      t.integer :data_urodzenia_rok
      t.string  :adres_ulica
      t.string  :adres_kod
      t.string  :adres_miasto
      t.string  :email
      t.string  :crypted_password
      t.string  :password_salt
      t.string  :persistence_token

      t.integer   :login_count,         :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.integer   :failed_login_count,  :null => false, :default => 0 # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_request_at                                    # optional, see Authlogic::Session::MagicColumns
      t.datetime  :current_login_at                                   # optional, see Authlogic::Session::MagicColumns
      t.datetime  :last_login_at                                      # optional, see Authlogic::Session::MagicColumns
      t.string    :current_login_ip                                   # optional, see Authlogic::Session::MagicColumns
      t.string    :last_login_ip    

      t.timestamps
    end
  end
end
