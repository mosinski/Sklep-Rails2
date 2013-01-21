class Koszyk < ActiveRecord::Base
  attr_accessible :cena, :ilosc, :produkt_id, :wartosc, :wlasciciel
  validates :ilosc, :numericality => {:only_integer => true}, :format => { :with => /[0-9]/, :message => 'nie poprawny format ulicy.' }, allow_blank: false
end
