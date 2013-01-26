class Produkt < ActiveRecord::Base
  attr_accessible :cena, :obrazek_url, :opis, :tytul
  validates :tytul, length: { in: 3..25 }, allow_blank: false
  validates :cena, :format => { :with => /^\d+??(?:\.\d{0,2})?$/, :message => 'ma niepoprawny format. Maksymalnie 2 miejsca po przecinku!' }, allow_blank: false
  validates :obrazek_url, :format =>{ :with => URI::regexp(%w(http https)), :message => 'ma niepoprawny adres URL.' }, allow_blank: false
end
