class AddRozmiarToKoszyks < ActiveRecord::Migration
  def change
    add_column :koszyks, :rozmiar, :string
  end
end
