class AddProduktTytulToKoszyks < ActiveRecord::Migration
  def change
    add_column :koszyks, :produkt_tytul, :string
  end
end
