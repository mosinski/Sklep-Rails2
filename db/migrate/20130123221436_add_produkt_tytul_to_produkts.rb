class AddProduktTytulToProdukts < ActiveRecord::Migration
  def change
    add_column :produkts, :produkt_tytul, :string
  end
end
