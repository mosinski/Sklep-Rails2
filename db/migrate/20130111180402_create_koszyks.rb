class CreateKoszyks < ActiveRecord::Migration
  def change
    create_table :koszyks do |t|
      t.string :wlasciciel
      t.integer :produkt_id
      t.integer :ilosc
      t.decimal :cena
      t.decimal :wartosc

      t.timestamps
    end
  end
end
