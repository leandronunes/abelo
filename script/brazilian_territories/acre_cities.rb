#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil') 
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Acre')
state ||= State.create!( :name => 'Acre', :code => 'AC', :country => country); 

c = City.new(:name => 'Mancio Lima', :zip_code => '69.990-000', :state => state); c.save
c = City.new(:name => 'Manoel Urbano', :zip_code => '69.950-000', :state => state); c.save 
c = City.new(:name => 'Marechal Thaumaturgo', :zip_code => '69.983-000', :state => state); c.save 
c = City.new(:name => 'Placido De Castro', :zip_code => '69.928-000', :state => state); c.save 
c = City.new(:name => 'Porto Acre', :zip_code => '69.921-000', :state => state); c.save 
c = City.new(:name => 'Porto Walter', :zip_code => '69.982-000', :state => state); c.save 
c = City.new(:name => 'Rio Branco', :zip_code => '69.900-000', :state => state); c.save 
c = City.new(:name => 'Sena Madureira', :zip_code => '69.940-000', :state => state); c.save 
c = City.new(:name => 'Senador Guiomard', :zip_code => '69.925-000', :state => state); c.save 
c = City.new(:name => 'Tarauaca', :zip_code => '69.970-000', :state => state); c.save 
c = City.new(:name => 'Xapuri', :zip_code => '69.930-000', :state => state); c.save 
c = City.new(:name => 'Rodrigues Alves', :zip_code => '69.985-000', :state => state); c.save 
c = City.new(:name => 'Bujari', :zip_code => '69.923-000', :state => state); c.save 
c = City.new(:name => 'Capixaba', :zip_code => '69.922-000', :state => state); c.save 
c = City.new(:name => 'Acrelandia', :zip_code => '69.945-000', :state => state); c.save 
c = City.new(:name => 'Epitaciolandia', :zip_code => '69.934-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa', :zip_code => '69.955-000', :state => state); c.save 

