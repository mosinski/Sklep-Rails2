class CreateProdukts < ActiveRecord::Migration
  def change
    create_table :produkts do |t|
      t.string :tytul
      t.text :opis
      t.decimal :cena
      t.string :obrazek_url

      t.timestamps
    end
  end
end
