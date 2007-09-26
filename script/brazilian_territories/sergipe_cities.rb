#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Sergipe')
state ||= State.create!( :name => 'Sergipe', :code => 'SE', :country => country);

c = City.new(:name => 'Altos Verdes', :zip_code => '49.555-000', :state => state); c.save 
c = City.new(:name => 'Amparo De Sao Francisco', :zip_code => '49.920-000', :state => state); c.save 
c = City.new(:name => 'Aquidaba', :zip_code => '49.790-000', :state => state); c.save 
c = City.new(:name => 'Aracaju', :zip_code => '49.000-000', :state => state); c.save 
c = City.new(:name => 'Araua', :zip_code => '49.220-000', :state => state); c.save 
c = City.new(:name => 'Areia Branca', :zip_code => '49.580-000', :state => state); c.save 
c = City.new(:name => 'Barra Dos Coqueiros', :zip_code => '49.140-000', :state => state); c.save 
c = City.new(:name => 'Barracas', :zip_code => '49.710-000', :state => state); c.save 
c = City.new(:name => 'Boquim', :zip_code => '49.360-000', :state => state); c.save 
c = City.new(:name => 'Brejo Grande', :zip_code => '49.995-000', :state => state); c.save 
c = City.new(:name => 'Campo Do Brito', :zip_code => '49.520-000', :state => state); c.save 
c = City.new(:name => 'Canhoba', :zip_code => '49.880-000', :state => state); c.save 
c = City.new(:name => 'Caninde De Sao Francisco', :zip_code => '49.820-000', :state => state); c.save 
c = City.new(:name => 'Capela', :zip_code => '49.700-000', :state => state); c.save 
c = City.new(:name => 'Carira', :zip_code => '49.550-000', :state => state); c.save 
c = City.new(:name => 'Carmopolis', :zip_code => '49.740-000', :state => state); c.save 
c = City.new(:name => 'Cedro De Sao Joao', :zip_code => '49.930-000', :state => state); c.save 
c = City.new(:name => 'Cristinapolis', :zip_code => '49.270-000', :state => state); c.save 
c = City.new(:name => 'Cumbe', :zip_code => '49.660-000', :state => state); c.save 
c = City.new(:name => 'Divina Pastora', :zip_code => '49.650-000', :state => state); c.save 
c = City.new(:name => 'Estancia', :zip_code => '49.200-000', :state => state); c.save 
c = City.new(:name => 'Feira Nova', :zip_code => '49.670-000', :state => state); c.save 
c = City.new(:name => 'Frei Paulo', :zip_code => '49.514-000', :state => state); c.save 
c = City.new(:name => 'Gararu', :zip_code => '49.830-000', :state => state); c.save 
c = City.new(:name => 'General Maynard', :zip_code => '49.750-000', :state => state); c.save 
c = City.new(:name => 'Graccho Cardoso', :zip_code => '49.860-000', :state => state); c.save 
c = City.new(:name => 'Ilha Das Flores', :zip_code => '49.990-000', :state => state); c.save 
c = City.new(:name => 'Indiaroba', :zip_code => '49.250-000', :state => state); c.save 
c = City.new(:name => 'Itabaiana', :zip_code => '49.500-000', :state => state); c.save 
c = City.new(:name => 'Itabaianinha', :zip_code => '49.290-000', :state => state); c.save 
c = City.new(:name => 'Itabi', :zip_code => '49.870-000', :state => state); c.save 
c = City.new(:name => 'Itaporanga Dajuda', :zip_code => '49.120-000', :state => state); c.save 
c = City.new(:name => 'Japaratuba', :zip_code => '49.960-000', :state => state); c.save 
c = City.new(:name => 'Japoata', :zip_code => '49.950-000', :state => state); c.save 
c = City.new(:name => 'Lagarto', :zip_code => '49.400-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Funda', :zip_code => '49.835-000', :state => state); c.save 
c = City.new(:name => 'Laranjeiras', :zip_code => '49.170-000', :state => state); c.save 
c = City.new(:name => 'Macambira', :zip_code => '49.565-000', :state => state); c.save 
c = City.new(:name => 'Malhada Dos Bois', :zip_code => '49.940-000', :state => state); c.save 
c = City.new(:name => 'Malhador', :zip_code => '49.570-000', :state => state); c.save 
c = City.new(:name => 'Maruim', :zip_code => '49.770-000', :state => state); c.save 
c = City.new(:name => 'Miranda', :zip_code => '49.702-000', :state => state); c.save 
c = City.new(:name => 'Moita Bonita', :zip_code => '49.560-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre De Sergipe', :zip_code => '49.690-000', :state => state); c.save 
c = City.new(:name => 'Muribeca', :zip_code => '49.780-000', :state => state); c.save 
c = City.new(:name => 'Neopolis', :zip_code => '49.980-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Aparecida', :zip_code => '49.540-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Gloria', :zip_code => '49.680-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Das Dores', :zip_code => '49.600-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora De Lourdes', :zip_code => '49.890-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Socorro', :zip_code => '49.160-000', :state => state); c.save 
c = City.new(:name => 'Pacatuba', :zip_code => '49.970-000', :state => state); c.save 
c = City.new(:name => 'Palmares', :zip_code => '49.325-000', :state => state); c.save 
c = City.new(:name => 'Pedra Mole', :zip_code => '49.512-000', :state => state); c.save 
c = City.new(:name => 'Pedras', :zip_code => '49.704-000', :state => state); c.save 
c = City.new(:name => 'Pedrinhas', :zip_code => '49.350-000', :state => state); c.save 
c = City.new(:name => 'Pinhao', :zip_code => '49.517-000', :state => state); c.save 
c = City.new(:name => 'Pirambu', :zip_code => '49.190-000', :state => state); c.save 
c = City.new(:name => 'Poco Redondo', :zip_code => '49.810-000', :state => state); c.save 
c = City.new(:name => 'Poco Verde', :zip_code => '49.490-000', :state => state); c.save 
c = City.new(:name => 'Porto Da Folha', :zip_code => '49.800-000', :state => state); c.save 
c = City.new(:name => 'Propria', :zip_code => '49.900-000', :state => state); c.save 
c = City.new(:name => 'Riachao Do Dantas', :zip_code => '49.320-000', :state => state); c.save 
c = City.new(:name => 'Riachuelo', :zip_code => '49.130-000', :state => state); c.save 
c = City.new(:name => 'Ribeiropolis', :zip_code => '49.530-000', :state => state); c.save 
c = City.new(:name => 'Rosario Do Catete', :zip_code => '49.760-000', :state => state); c.save 
c = City.new(:name => 'Salgado', :zip_code => '49.390-000', :state => state); c.save 
c = City.new(:name => 'Samambaia', :zip_code => '49.310-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Itanhy', :zip_code => '49.230-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa De Lima', :zip_code => '49.640-000', :state => state); c.save 
c = City.new(:name => 'Santo Amaro Das Brotas', :zip_code => '49.180-000', :state => state); c.save 
c = City.new(:name => 'Sao Cristovao', :zip_code => '49.100-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '49.525-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '49.945-000', :state => state); c.save 
c = City.new(:name => 'Sao Mateus Da Palestina', :zip_code => '49.840-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Aleixo', :zip_code => '49.535-000', :state => state); c.save 
c = City.new(:name => 'Simao Dias', :zip_code => '49.480-000', :state => state); c.save 
c = City.new(:name => 'Siriri', :zip_code => '49.630-000', :state => state); c.save 
c = City.new(:name => 'Telha', :zip_code => '49.910-000', :state => state); c.save 
c = City.new(:name => 'Tobias Barreto', :zip_code => '49.300-000', :state => state); c.save 
c = City.new(:name => 'Tomar Do Geru', :zip_code => '49.280-000', :state => state); c.save 
c = City.new(:name => 'Umbauba', :zip_code => '49.260-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Sao Francisco', :zip_code => '49.985-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '49.099-000', :state => state); c.save 
c = City.new(:name => 'Areia Branca', :zip_code => '49.099-400', :state => state); c.save 
c = City.new(:name => 'Mosqueiro', :zip_code => '49.099-700', :state => state); c.save 

