class RemoveProduktTytulToProdukts < ActiveRecord::Migration
  def up
    remove_column :produkts, :produkt_tytul
      end

  def down
    add_column :produkts, :produkt_tytul, :string
  end
end
