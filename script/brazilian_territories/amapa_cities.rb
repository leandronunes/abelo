#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil') 
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Amapá')
state ||= State.create!( :name => 'Amapá', :code => 'AP', :country => country); 

c = City.new(:name => 'Amapa', :zip_code => '68.950-000', :state => state); c.save 
c = City.new(:name => 'Aporema', :zip_code => '68.994-000', :state => state); c.save 
c = City.new(:name => 'Bailique', :zip_code => '68.913-000', :state => state); c.save 
c = City.new(:name => 'Boca Do Jari', :zip_code => '68.923-000', :state => state); c.save 
c = City.new(:name => 'Calcoene', :zip_code => '68.960-000', :state => state); c.save 
c = City.new(:name => 'Clevelandia Do Norte', :zip_code => '68.985-000', :state => state); c.save 
c = City.new(:name => 'Cunani', :zip_code => '68.965-000', :state => state); c.save 
c = City.new(:name => 'Ferreira Gomes', :zip_code => '68.915-000', :state => state); c.save 
c = City.new(:name => 'Lourenco', :zip_code => '68.970-000', :state => state); c.save 
c = City.new(:name => 'Macapa', :zip_code => '68.900-000', :state => state); c.save 
c = City.new(:name => 'Mazagao', :zip_code => '68.940-000', :state => state); c.save 
c = City.new(:name => 'Mazagao Velho', :zip_code => '68.943-000', :state => state); c.save 
c = City.new(:name => 'Oiapoque', :zip_code => '68.980-000', :state => state); c.save 
c = City.new(:name => 'Porto Grande', :zip_code => '68.997-000', :state => state); c.save 
c = City.new(:name => 'Serra Do Navio', :zip_code => '68.914-000', :state => state); c.save 
c = City.new(:name => 'Sucuriju', :zip_code => '68.958-000', :state => state); c.save 
c = City.new(:name => 'Santana', :zip_code => '68.925-000', :state => state); c.save 
c = City.new(:name => 'Vila Velha', :zip_code => '68.988-000', :state => state); c.save 
c = City.new(:name => 'Laranjal Do Jari', :zip_code => '68.920-000', :state => state); c.save 
c = City.new(:name => 'Tartarugalzinho', :zip_code => '68.990-000', :state => state); c.save 
c = City.new(:name => 'Pracuuba', :zip_code => '68.918-000', :state => state); c.save 
c = City.new(:name => 'Itaubal', :zip_code => '68.976-000', :state => state); c.save 
c = City.new(:name => 'Cutias', :zip_code => '68.973-000', :state => state); c.save 
c = City.new(:name => 'Agua Branca Do Amapari', :zip_code => '68.948-000', :state => state); c.save 
c = City.new(:name => 'Amapari', :zip_code => '68.945-000', :state => state); c.save 
c = City.new(:name => 'Igarape Do Lago', :zip_code => '68.935-000', :state => state); c.save 
c = City.new(:name => 'Ilha De Santana', :zip_code => '68.937-000', :state => state); c.save 
c = City.new(:name => 'Fortaleza', :zip_code => '68.939-000', :state => state); c.save 
c = City.new(:name => 'Ambe', :zip_code => '68.912-000', :state => state); c.save 
c = City.new(:name => 'Ariri', :zip_code => '68.912-050', :state => state); c.save 
c = City.new(:name => 'Carmo', :zip_code => '68.912-100', :state => state); c.save 
c = City.new(:name => 'Gaivota', :zip_code => '68.912-150', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '68.912-200', :state => state); c.save 
c = City.new(:name => 'Fazendinha', :zip_code => '68.912-250', :state => state); c.save 
c = City.new(:name => 'Curiau', :zip_code => '68.912-300', :state => state); c.save 
c = City.new(:name => 'Abacate Da Pedreira', :zip_code => '68.912-350', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim Do Pacui', :zip_code => '68.912-500', :state => state); c.save 
c = City.new(:name => 'Livramento Do Pacui', :zip_code => '68.912-450', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Pacui', :zip_code => '68.912-500', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Livramento', :zip_code => '68.912-550', :state => state); c.save 
c = City.new(:name => 'Corre Agua', :zip_code => '68.912-600', :state => state); c.save 
c = City.new(:name => 'Gurupora', :zip_code => '68.912-650', :state => state); c.save 
c = City.new(:name => 'Sao Tome', :zip_code => '68.912-700', :state => state); c.save 
c = City.new(:name => 'Inaja', :zip_code => '68.912-750', :state => state); c.save 
c = City.new(:name => 'Cantanzal', :zip_code => '68.912-800', :state => state); c.save 
c = City.new(:name => 'Paredao', :zip_code => '68.917-000', :state => state); c.save 
c = City.new(:name => 'Vitoria Do Jari', :zip_code => '68.924-000', :state => state); c.save 

