class User < ActiveRecord::Base
  acts_as_authentic
  validates :imie, length: { in: 3..15 }, allow_blank: false
  validates :nazwisko, length: { in: 3..15 }, allow_blank: false
  validates :adres_ulica, :format => { :with => /[A-Za-z]+ [0-9]+/, :message => 'niepoprawny format ulicy.' }, allow_blank: false
  validates :adres_kod, :format => { :with => /\A\d{2}-\d{3}\z/, :message => 'niepoprawny format kodu pocztowego.' }, allow_blank: false
  validates :adres_miasto, length: { in: 3..25 }, allow_blank: false
end
