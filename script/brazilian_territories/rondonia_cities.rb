#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Rondônia')
state ||= State.create!( :name => 'Rondônia', :code => 'RO', :country => country);

c = City.new(:name => 'Abuna', :zip_code => '78.929-000', :state => state); c.save 
c = City.new(:name => 'Alta Floresta Do Oeste', :zip_code => '78.994-000', :state => state); c.save 
c = City.new(:name => 'Alvorada Do Oeste', :zip_code => '78.969-000', :state => state); c.save 
c = City.new(:name => 'Ariquemes', :zip_code => '78.930-000', :state => state); c.save 
c = City.new(:name => 'Cabixi', :zip_code => '78.999-000', :state => state); c.save 
c = City.new(:name => 'Cacoal', :zip_code => '78.975-000', :state => state); c.save 
c = City.new(:name => 'Calama', :zip_code => '78.925-000', :state => state); c.save 
c = City.new(:name => 'Cerejeiras', :zip_code => '78.997-000', :state => state); c.save 
c = City.new(:name => 'Colorado Do Oeste', :zip_code => '78.996-000', :state => state); c.save 
c = City.new(:name => 'Costa Marques', :zip_code => '78.971-000', :state => state); c.save 
c = City.new(:name => 'Espigao Doeste', :zip_code => '78.983-000', :state => state); c.save 
c = City.new(:name => 'Guajara-mirim', :zip_code => '78.957-000', :state => state); c.save 
c = City.new(:name => 'Jamari', :zip_code => '78.937-000', :state => state); c.save 
c = City.new(:name => 'Jaci Parana', :zip_code => '78.927-000', :state => state); c.save 
c = City.new(:name => 'Jaru', :zip_code => '78.940-000', :state => state); c.save 
c = City.new(:name => 'Ji-parana', :zip_code => '78.960-000', :state => state); c.save 
c = City.new(:name => 'Marco Rondon', :zip_code => '78.985-000', :state => state); c.save 
c = City.new(:name => 'Nova Brasilandia Doeste', :zip_code => '78.974-000', :state => state); c.save 
c = City.new(:name => 'Nova Vida', :zip_code => '78.935-000', :state => state); c.save 
c = City.new(:name => 'Ouro Preto Do Oeste', :zip_code => '78.950-000', :state => state); c.save 
c = City.new(:name => 'Pedras Negras', :zip_code => '78.972-500', :state => state); c.save 
c = City.new(:name => 'Pimenta Bueno', :zip_code => '78.984-000', :state => state); c.save 
c = City.new(:name => 'Porto Velho', :zip_code => '78.900-000', :state => state); c.save 
c = City.new(:name => 'Presidente Medici', :zip_code => '78.968-000', :state => state); c.save 
c = City.new(:name => 'Principe Da Beira', :zip_code => '78.972-000', :state => state); c.save 
c = City.new(:name => 'Riozinho', :zip_code => '78.980-000', :state => state); c.save 
c = City.new(:name => 'Rolim De Moura', :zip_code => '78.987-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Oeste', :zip_code => '78.993-000', :state => state); c.save 
c = City.new(:name => 'Tabajara', :zip_code => '78.936-000', :state => state); c.save 
c = City.new(:name => 'Nova Mamore', :zip_code => '78.939-000', :state => state); c.save 
c = City.new(:name => 'Vilhena', :zip_code => '78.995-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre Do Abuna', :zip_code => '78.926-000', :state => state); c.save 
c = City.new(:name => 'Machadinho Doeste', :zip_code => '78.948-000', :state => state); c.save 
c = City.new(:name => 'Sao Felipe Doeste', :zip_code => '78.986-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Guapore', :zip_code => '78.970-000', :state => state); c.save 
c = City.new(:name => 'Candeias Do Jamari', :zip_code => '78.938-000', :state => state); c.save 
c = City.new(:name => 'Pimenteiras Do Oeste', :zip_code => '78.998-000', :state => state); c.save 
c = City.new(:name => 'Vila Extrema', :zip_code => '78.928-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte Do Oeste', :zip_code => '78.991-000', :state => state); c.save 
c = City.new(:name => 'Castanheiras', :zip_code => '78.992-000', :state => state); c.save 
c = City.new(:name => 'Vale Do Paraiso', :zip_code => '78.959-000', :state => state); c.save 
c = City.new(:name => 'Urupa', :zip_code => '78.955-000', :state => state); c.save 
c = City.new(:name => 'Mirante Da Serra', :zip_code => '78.949-000', :state => state); c.save 
c = City.new(:name => 'Seringueiras', :zip_code => '78.990-000', :state => state); c.save 
c = City.new(:name => 'Theobroma', :zip_code => '78.947-000', :state => state); c.save 
c = City.new(:name => 'Ministro Andreazza', :zip_code => '78.981-000', :state => state); c.save 
c = City.new(:name => 'Governador Jorge Teixeira', :zip_code => '78.946-000', :state => state); c.save 
c = City.new(:name => 'Cacaulandia', :zip_code => '78.944-000', :state => state); c.save 
c = City.new(:name => 'Alto Paraiso', :zip_code => '78.956-000', :state => state); c.save 
c = City.new(:name => 'Rio Crespo', :zip_code => '78.945-000', :state => state); c.save 
c = City.new(:name => 'Corumbiara', :zip_code => '78.966-000', :state => state); c.save 
c = City.new(:name => 'Monte Negro', :zip_code => '78.965-000', :state => state); c.save 
c = City.new(:name => 'Campo Novo De Rondonia', :zip_code => '78.967-000', :state => state); c.save 
c = City.new(:name => 'Cujubim', :zip_code => '78.945-800', :state => state); c.save 
c = City.new(:name => 'Vale Do Anari', :zip_code => '78.948-800', :state => state); c.save 
c = City.new(:name => 'Teixeiropolis', :zip_code => '78.954-000', :state => state); c.save 
c = City.new(:name => 'Nova Uniao', :zip_code => '78.953-000', :state => state); c.save 
c = City.new(:name => 'Buritis', :zip_code => '78.967-800', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Guapore', :zip_code => '78.973-000', :state => state); c.save 
c = City.new(:name => 'Primavera De Rondonia', :zip_code => '78.988-000', :state => state); c.save 
c = City.new(:name => 'Parecis', :zip_code => '78.989-000', :state => state); c.save 
c = City.new(:name => 'Alta Alegre Dos Parecis', :zip_code => '78.994-800', :state => state); c.save 
c = City.new(:name => 'Chupinguaia', :zip_code => '78.995-800', :state => state); c.save 

