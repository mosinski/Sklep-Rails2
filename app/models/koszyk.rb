class Koszyk < ActiveRecord::Base
  attr_accessible :cena, :ilosc, :produkt_id, :wartosc, :wlasciciel
end
