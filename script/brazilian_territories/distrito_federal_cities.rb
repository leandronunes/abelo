#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Distrito Federal')
state ||= State.create!( :name => 'Distrito Federal', :code => 'DF', :country => country);

c = City.new(:name => 'Brasilia', :zip_code => '70.000-000', :state => state); c.save 
c = City.new(:name => 'Gama', :zip_code => '72.400-000', :state => state); c.save 
c = City.new(:name => 'Taguatinga', :zip_code => '72.000-000', :state => state); c.save 
c = City.new(:name => 'Ceilandia', :zip_code => '72.200-000', :state => state); c.save 
c = City.new(:name => 'Brazlandia', :zip_code => '72.700-000', :state => state); c.save 
c = City.new(:name => 'Guara', :zip_code => '71.000-000', :state => state); c.save 
c = City.new(:name => 'Nucleo Bandeirante', :zip_code => '71.700-000', :state => state); c.save 
c = City.new(:name => 'Sobradinho', :zip_code => '73.000-000', :state => state); c.save 
c = City.new(:name => 'Planaltina', :zip_code => '73.300-000', :state => state); c.save 
c = City.new(:name => 'Samambaia', :zip_code => '72.300-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '72.500-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro', :zip_code => '70.640-000', :state => state); c.save 
c = City.new(:name => 'Paranoa', :zip_code => '71.570-000', :state => state); c.save 
c = City.new(:name => 'Recanto Das Emas', :zip_code => '72.600-000', :state => state); c.save 
c = City.new(:name => 'Lago Sul', :zip_code => '71.600-000', :state => state); c.save 
c = City.new(:name => 'Lago Norte', :zip_code => '71.500-000', :state => state); c.save 
c = City.new(:name => 'Candangolandia', :zip_code => '71.725-000', :state => state); c.save 
c = City.new(:name => 'Riacho Fundo', :zip_code => '71.800-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '71.690-000', :state => state); c.save 

