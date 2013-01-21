class AddRozmiarxsAndRozmiarsAndRozmiarmAndRozmiarlAndRozmiarxlAndRozmiarxxlToProdukts < ActiveRecord::Migration
  def change
    add_column :produkts, :rozmiarxs, :string, :default => "0"
    add_column :produkts, :rozmiars, :string, :default => "0"
    add_column :produkts, :rozmiarm, :string, :default => "0"
    add_column :produkts, :rozmiarl, :string, :default => "0"
    add_column :produkts, :rozmiarxl, :string, :default => "0"
    add_column :produkts, :rozmiarxxl, :string, :default => "0"
  end
end
