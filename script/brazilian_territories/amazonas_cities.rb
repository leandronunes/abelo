#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil') 
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Amazonas')
state ||= State.create!( :name => 'Amazonas', :code => 'AM', :country => country); 

c = City.new(:name => 'Alvaraes', :zip_code => '69.475-000', :state => state); c.save 
c = City.new(:name => 'Amatari', :zip_code => '69.105-000', :state => state); c.save 
c = City.new(:name => 'Amatura', :zip_code => '69.620-000', :state => state); c.save 
c = City.new(:name => 'Anama', :zip_code => '69.445-000', :state => state); c.save 
c = City.new(:name => 'Anori', :zip_code => '69.440-000', :state => state); c.save 
c = City.new(:name => 'Ariau', :zip_code => '69.165-000', :state => state); c.save 
c = City.new(:name => 'Atalaia Do Norte', :zip_code => '69.650-000', :state => state); c.save 
c = City.new(:name => 'Augusto Montenegro', :zip_code => '69.182-000', :state => state); c.save 
c = City.new(:name => 'Autazes', :zip_code => '69.240-000', :state => state); c.save 
c = City.new(:name => 'Badajos', :zip_code => '69.452-000', :state => state); c.save 
c = City.new(:name => 'Balbina', :zip_code => '69.736-000', :state => state); c.save 
c = City.new(:name => 'Barcelos', :zip_code => '69.700-000', :state => state); c.save 
c = City.new(:name => 'Barreirinha', :zip_code => '69.160-000', :state => state); c.save 
c = City.new(:name => 'Benjamin Constant', :zip_code => '69.630-000', :state => state); c.save 
c = City.new(:name => 'Beruri', :zip_code => '69.430-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Ramos', :zip_code => '69.195-000', :state => state); c.save 
c = City.new(:name => 'Boca Do Acre', :zip_code => '69.850-000', :state => state); c.save 
c = City.new(:name => 'Borba', :zip_code => '69.200-000', :state => state); c.save 
c = City.new(:name => 'Caapiranga', :zip_code => '69.410-000', :state => state); c.save 
c = City.new(:name => 'Cameta', :zip_code => '69.162-000', :state => state); c.save 
c = City.new(:name => 'Canutama', :zip_code => '69.820-000', :state => state); c.save 
c = City.new(:name => 'Carauari', :zip_code => '69.500-000', :state => state); c.save 
c = City.new(:name => 'Careiro', :zip_code => '69.250-000', :state => state); c.save 
c = City.new(:name => 'Coari', :zip_code => '69.460-000', :state => state); c.save 
c = City.new(:name => 'Codajas', :zip_code => '69.450-000', :state => state); c.save 
c = City.new(:name => 'Cucui', :zip_code => '69.765-000', :state => state); c.save 
c = City.new(:name => 'Eirunepe', :zip_code => '69.880-000', :state => state); c.save 
c = City.new(:name => 'Envira', :zip_code => '69.870-000', :state => state); c.save 
c = City.new(:name => 'Floriano Peixoto', :zip_code => '69.855-000', :state => state); c.save 
c = City.new(:name => 'Fonte Boa', :zip_code => '69.670-000', :state => state); c.save 
c = City.new(:name => 'Freguesia Do Andira', :zip_code => '69.170-000', :state => state); c.save 
c = City.new(:name => 'Humaita', :zip_code => '69.800-000', :state => state); c.save 
c = City.new(:name => 'Iauarete', :zip_code => '69.790-000', :state => state); c.save 
c = City.new(:name => 'Icana', :zip_code => '69.760-000', :state => state); c.save 
c = City.new(:name => 'Ipixuna', :zip_code => '69.890-000', :state => state); c.save 
c = City.new(:name => 'Iranduba', :zip_code => '69.405-000', :state => state); c.save 
c = City.new(:name => 'Itacoatiara', :zip_code => '69.100-000', :state => state); c.save 
c = City.new(:name => 'Itamarati', :zip_code => '69.510-000', :state => state); c.save 
c = City.new(:name => 'Itapiranga', :zip_code => '69.120-000', :state => state); c.save 
c = City.new(:name => 'Japura', :zip_code => '69.495-000', :state => state); c.save 
c = City.new(:name => 'Jurua', :zip_code => '69.520-000', :state => state); c.save 
c = City.new(:name => 'Jutai', :zip_code => '69.660-000', :state => state); c.save 
c = City.new(:name => 'Labrea', :zip_code => '69.830-000', :state => state); c.save 
c = City.new(:name => 'Lago Preto', :zip_code => '69.196-000', :state => state); c.save 
c = City.new(:name => 'Manacapuru', :zip_code => '69.400-000', :state => state); c.save 
c = City.new(:name => 'Manaquiri', :zip_code => '69.435-000', :state => state); c.save 
c = City.new(:name => 'Manaus', :zip_code => '69.000-000', :state => state); c.save 
c = City.new(:name => 'Manicore', :zip_code => '69.280-000', :state => state); c.save 
c = City.new(:name => 'Maraa', :zip_code => '69.490-000', :state => state); c.save 
c = City.new(:name => 'Massauari', :zip_code => '69.197-000', :state => state); c.save 
c = City.new(:name => 'Maues', :zip_code => '69.190-000', :state => state); c.save 
c = City.new(:name => 'Mocambo', :zip_code => '69.158-000', :state => state); c.save 
c = City.new(:name => 'Murutinga', :zip_code => '69.245-000', :state => state); c.save 
c = City.new(:name => 'Nhamunda', :zip_code => '69.140-000', :state => state); c.save 
c = City.new(:name => 'Nova Olinda Do Norte', :zip_code => '69.230-000', :state => state); c.save 
c = City.new(:name => 'Novo Airao', :zip_code => '69.730-000', :state => state); c.save 
c = City.new(:name => 'Novo Aripuana', :zip_code => '69.260-000', :state => state); c.save 
c = City.new(:name => 'Osorio Da Fonseca', :zip_code => '69.192-000', :state => state); c.save 
c = City.new(:name => 'Parintins', :zip_code => '69.150-000', :state => state); c.save 
c = City.new(:name => 'Pauini', :zip_code => '69.860-000', :state => state); c.save 
c = City.new(:name => 'Pedras', :zip_code => '69.175-000', :state => state); c.save 
c = City.new(:name => 'Presidente Figueiredo', :zip_code => '69.735-000', :state => state); c.save 
c = City.new(:name => 'Repartimento', :zip_code => '69.193-000', :state => state); c.save 
c = City.new(:name => 'Rio Preto Da Eva', :zip_code => '69.115-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel Do Rio Negro', :zip_code => '69.740-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '69.610-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Ica', :zip_code => '69.680-000', :state => state); c.save 
c = City.new(:name => 'Sao Felipe', :zip_code => '69.752-000', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel Da Cachoeira', :zip_code => '69.750-000', :state => state); c.save 
c = City.new(:name => 'Sao Paulo De Olivenca', :zip_code => '69.600-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Uatuma', :zip_code => '69.135-000', :state => state); c.save 
c = City.new(:name => 'Silves', :zip_code => '69.110-000', :state => state); c.save 
c = City.new(:name => 'Tabatinga', :zip_code => '69.640-000', :state => state); c.save 
c = City.new(:name => 'Tapaua', :zip_code => '69.480-000', :state => state); c.save 
c = City.new(:name => 'Tefe', :zip_code => '69.470-000', :state => state); c.save 
c = City.new(:name => 'Tonantins', :zip_code => '69.685-000', :state => state); c.save 
c = City.new(:name => 'Uarini', :zip_code => '69.485-000', :state => state); c.save 
c = City.new(:name => 'Urucara', :zip_code => '69.130-000', :state => state); c.save 
c = City.new(:name => 'Urucurituba', :zip_code => '69.180-000', :state => state); c.save 
c = City.new(:name => 'Vila Pitinga', :zip_code => '69.737-000', :state => state); c.save 
c = City.new(:name => 'Canuma', :zip_code => '69.212-000', :state => state); c.save 
c = City.new(:name => 'Axinim', :zip_code => '69.210-000', :state => state); c.save 
c = City.new(:name => 'Moura', :zip_code => '69.720-000', :state => state); c.save 
c = City.new(:name => 'Carvoeiro', :zip_code => '69.725-000', :state => state); c.save 
c = City.new(:name => 'Apui', :zip_code => '69.265-000', :state => state); c.save 
c = City.new(:name => 'Careiro Da Varzea', :zip_code => '69.255-000', :state => state); c.save 
c = City.new(:name => 'Guajara', :zip_code => '69.895-000', :state => state); c.save 

