#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Maranhão')
state ||= State.create!( :name => 'Maranhão', :code => 'MA', :country => country);

c = City.new(:name => 'Acailandia', :zip_code => '65.930-000', :state => state); c.save 
c = City.new(:name => 'Afonso Cunha', :zip_code => '65.505-000', :state => state); c.save 
c = City.new(:name => 'Alcantara', :zip_code => '65.250-000', :state => state); c.save 
c = City.new(:name => 'Aldeias Altas', :zip_code => '65.610-000', :state => state); c.save 
c = City.new(:name => 'Altamira Do Maranhao', :zip_code => '65.310-000', :state => state); c.save 
c = City.new(:name => 'Alto Parnaiba', :zip_code => '65.810-000', :state => state); c.save 
c = City.new(:name => 'Amarante Do Maranhao', :zip_code => '65.923-000', :state => state); c.save 
c = City.new(:name => 'Anajatuba', :zip_code => '65.490-000', :state => state); c.save 
c = City.new(:name => 'Anapurus', :zip_code => '65.525-000', :state => state); c.save 
c = City.new(:name => 'Anil', :zip_code => '65.000-000', :state => state); c.save 
c = City.new(:name => 'Araioses', :zip_code => '65.570-000', :state => state); c.save 
c = City.new(:name => 'Arame', :zip_code => '65.945-000', :state => state); c.save 
c = City.new(:name => 'Arari', :zip_code => '65.480-000', :state => state); c.save 
c = City.new(:name => 'Aurizona', :zip_code => '65.287-000', :state => state); c.save 
c = City.new(:name => 'Axixa', :zip_code => '65.108-000', :state => state); c.save 
c = City.new(:name => 'Bacabal', :zip_code => '65.700-000', :state => state); c.save 
c = City.new(:name => 'Bacatuba', :zip_code => '65.688-000', :state => state); c.save 
c = City.new(:name => 'Bacuri', :zip_code => '65.270-000', :state => state); c.save 
c = City.new(:name => 'Bacurituba', :zip_code => '65.233-000', :state => state); c.save 
c = City.new(:name => 'Balsas', :zip_code => '65.800-000', :state => state); c.save 
c = City.new(:name => 'Barao De Grajau', :zip_code => '65.660-000', :state => state); c.save 
c = City.new(:name => 'Barao De Tromai', :zip_code => '65.281-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Corda', :zip_code => '65.950-000', :state => state); c.save 
c = City.new(:name => 'Barreirinhas', :zip_code => '65.590-000', :state => state); c.save 
c = City.new(:name => 'Barro Duro', :zip_code => '65.582-000', :state => state); c.save 
c = City.new(:name => 'Benedito Leite', :zip_code => '65.885-000', :state => state); c.save 
c = City.new(:name => 'Bequimao', :zip_code => '65.248-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Pindare', :zip_code => '65.211-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim', :zip_code => '65.380-000', :state => state); c.save 
c = City.new(:name => 'Bonfim Do Arari', :zip_code => '65.483-000', :state => state); c.save 
c = City.new(:name => 'Brejo', :zip_code => '65.520-000', :state => state); c.save 
c = City.new(:name => 'Brejo De Sao Felix', :zip_code => '65.643-000', :state => state); c.save 
c = City.new(:name => 'Buriti', :zip_code => '65.515-000', :state => state); c.save 
c = City.new(:name => 'Buriti Bravo', :zip_code => '65.685-000', :state => state); c.save 
c = City.new(:name => 'Buriti Cortado', :zip_code => '65.639-000', :state => state); c.save 
c = City.new(:name => 'Cajapio', :zip_code => '65.230-000', :state => state); c.save 
c = City.new(:name => 'Cajari', :zip_code => '65.210-000', :state => state); c.save 
c = City.new(:name => 'Candido Mendes', :zip_code => '65.280-000', :state => state); c.save 
c = City.new(:name => 'Cantanhede', :zip_code => '65.465-000', :state => state); c.save 
c = City.new(:name => 'Caraiba Do Norte', :zip_code => '65.655-000', :state => state); c.save 
c = City.new(:name => 'Carolina', :zip_code => '65.980-000', :state => state); c.save 
c = City.new(:name => 'Carutapera', :zip_code => '65.295-000', :state => state); c.save 
c = City.new(:name => 'Caxias', :zip_code => '65.600-000', :state => state); c.save 
c = City.new(:name => 'Cedral', :zip_code => '65.260-000', :state => state); c.save 
c = City.new(:name => 'Chapadinha', :zip_code => '65.500-000', :state => state); c.save 
c = City.new(:name => 'Codo', :zip_code => '65.400-000', :state => state); c.save 
c = City.new(:name => 'Codozinho', :zip_code => '65.405-000', :state => state); c.save 
c = City.new(:name => 'Coelho Neto', :zip_code => '65.620-000', :state => state); c.save 
c = City.new(:name => 'Colinas', :zip_code => '65.690-000', :state => state); c.save 
c = City.new(:name => 'Coroata', :zip_code => '65.415-000', :state => state); c.save 
c = City.new(:name => 'Curupa', :zip_code => '65.815-000', :state => state); c.save 
c = City.new(:name => 'Cururupu', :zip_code => '65.268-000', :state => state); c.save 
c = City.new(:name => 'Curva Grande', :zip_code => '65.209-000', :state => state); c.save 
c = City.new(:name => 'Custodio Lima', :zip_code => '65.565-000', :state => state); c.save 
c = City.new(:name => 'Dom Pedro', :zip_code => '65.765-000', :state => state); c.save 
c = City.new(:name => 'Duque Bacelar', :zip_code => '65.625-000', :state => state); c.save 
c = City.new(:name => 'Esperantinopolis', :zip_code => '65.750-000', :state => state); c.save 
c = City.new(:name => 'Estandarte', :zip_code => '65.282-000', :state => state); c.save 
c = City.new(:name => 'Estreito', :zip_code => '65.975-000', :state => state); c.save 
c = City.new(:name => 'Fortaleza Dos Nogueiras', :zip_code => '65.805-000', :state => state); c.save 
c = City.new(:name => 'Fortuna', :zip_code => '65.695-000', :state => state); c.save 
c = City.new(:name => 'Frecheiras', :zip_code => '65.575-000', :state => state); c.save 
c = City.new(:name => 'Godofredo Viana', :zip_code => '65.285-000', :state => state); c.save 
c = City.new(:name => 'Goncalves Dias', :zip_code => '65.775-000', :state => state); c.save 
c = City.new(:name => 'Governador Archer', :zip_code => '65.770-000', :state => state); c.save 
c = City.new(:name => 'Governador Eugenio Barros', :zip_code => '65.780-000', :state => state); c.save 
c = City.new(:name => 'Graca Aranha', :zip_code => '65.785-000', :state => state); c.save 
c = City.new(:name => 'Grajau', :zip_code => '65.940-000', :state => state); c.save 
c = City.new(:name => 'Guimaraes', :zip_code => '65.255-000', :state => state); c.save 
c = City.new(:name => 'Humberto De Campos', :zip_code => '65.180-000', :state => state); c.save 
c = City.new(:name => 'Ibipira', :zip_code => '65.855-000', :state => state); c.save 
c = City.new(:name => 'Icatu', :zip_code => '65.170-000', :state => state); c.save 
c = City.new(:name => 'Igarape Grande', :zip_code => '65.720-000', :state => state); c.save 
c = City.new(:name => 'Imperatriz', :zip_code => '65.900-000', :state => state); c.save 
c = City.new(:name => 'Itamatare', :zip_code => '65.298-000', :state => state); c.save 
c = City.new(:name => 'Itapecuru Mirim', :zip_code => '65.485-000', :state => state); c.save 
c = City.new(:name => 'Itapera', :zip_code => '65.175-000', :state => state); c.save 
c = City.new(:name => 'Joao Lisboa', :zip_code => '65.922-000', :state => state); c.save 
c = City.new(:name => 'Joselandia', :zip_code => '65.755-000', :state => state); c.save 
c = City.new(:name => 'Lago Da Pedra', :zip_code => '65.715-000', :state => state); c.save 
c = City.new(:name => 'Lago Do Junco', :zip_code => '65.710-000', :state => state); c.save 
c = City.new(:name => 'Lago Verde', :zip_code => '65.705-000', :state => state); c.save 
c = City.new(:name => 'Lapela', :zip_code => '65.355-000', :state => state); c.save 
c = City.new(:name => 'Leandro', :zip_code => '65.957-000', :state => state); c.save 
c = City.new(:name => 'Lima Campos', :zip_code => '65.728-000', :state => state); c.save 
c = City.new(:name => 'Loreto', :zip_code => '65.895-000', :state => state); c.save 
c = City.new(:name => 'Luis Domingues', :zip_code => '65.290-000', :state => state); c.save 
c = City.new(:name => 'Magalhaes De Almeida', :zip_code => '65.560-000', :state => state); c.save 
c = City.new(:name => 'Maioba', :zip_code => '65.137-000', :state => state); c.save 
c = City.new(:name => 'Marianopolis', :zip_code => '65.726-000', :state => state); c.save 
c = City.new(:name => 'Mata', :zip_code => '65.115-000', :state => state); c.save 
c = City.new(:name => 'Mata Roma', :zip_code => '65.510-000', :state => state); c.save 
c = City.new(:name => 'Matinha', :zip_code => '65.218-000', :state => state); c.save 
c = City.new(:name => 'Matoes', :zip_code => '65.645-000', :state => state); c.save 
c = City.new(:name => 'Mirador', :zip_code => '65.850-000', :state => state); c.save 
c = City.new(:name => 'Mirinzal', :zip_code => '65.265-000', :state => state); c.save 
c = City.new(:name => 'Moncao', :zip_code => '65.360-000', :state => state); c.save 
c = City.new(:name => 'Montes Altos', :zip_code => '65.936-000', :state => state); c.save 
c = City.new(:name => 'Morros', :zip_code => '65.160-000', :state => state); c.save 
c = City.new(:name => 'Nina Rodrigues', :zip_code => '65.450-000', :state => state); c.save 
c = City.new(:name => 'Nova Iorque', :zip_code => '65.880-000', :state => state); c.save 
c = City.new(:name => 'Olho Dagua Das Cunhas', :zip_code => '65.706-000', :state => state); c.save 
c = City.new(:name => 'Paco Do Lumiar', :zip_code => '65.130-000', :state => state); c.save 
c = City.new(:name => 'Palmeirandia', :zip_code => '65.238-000', :state => state); c.save 
c = City.new(:name => 'Papagaio', :zip_code => '65.955-000', :state => state); c.save 
c = City.new(:name => 'Paraibano', :zip_code => '65.670-000', :state => state); c.save 
c = City.new(:name => 'Parnarama', :zip_code => '65.640-000', :state => state); c.save 
c = City.new(:name => 'Passagem Franca', :zip_code => '65.680-000', :state => state); c.save 
c = City.new(:name => 'Pastos Bons', :zip_code => '65.870-000', :state => state); c.save 
c = City.new(:name => 'Paulino Neves', :zip_code => '65.585-000', :state => state); c.save 
c = City.new(:name => 'Paulo Ramos', :zip_code => '65.716-000', :state => state); c.save 
c = City.new(:name => 'Pedreiras', :zip_code => '65.725-000', :state => state); c.save 
c = City.new(:name => 'Penalva', :zip_code => '65.213-000', :state => state); c.save 
c = City.new(:name => 'Peri Mirim', :zip_code => '65.245-000', :state => state); c.save 
c = City.new(:name => 'Peritoro', :zip_code => '65.418-000', :state => state); c.save 
c = City.new(:name => 'Pimentel', :zip_code => '65.375-000', :state => state); c.save 
c = City.new(:name => 'Pindare Mirim', :zip_code => '65.370-000', :state => state); c.save 
c = City.new(:name => 'Pinheiro', :zip_code => '65.200-000', :state => state); c.save 
c = City.new(:name => 'Pio Xii', :zip_code => '65.707-000', :state => state); c.save 
c = City.new(:name => 'Pirapemas', :zip_code => '65.460-000', :state => state); c.save 
c = City.new(:name => 'Pocao De Pedras', :zip_code => '65.740-000', :state => state); c.save 
c = City.new(:name => 'Porto Das Gabarras', :zip_code => '65.493-000', :state => state); c.save 
c = City.new(:name => 'Porto Franco', :zip_code => '65.970-000', :state => state); c.save 
c = City.new(:name => 'Presidente Dutra', :zip_code => '65.760-000', :state => state); c.save 
c = City.new(:name => 'Presidente Juscelino', :zip_code => '65.140-000', :state => state); c.save 
c = City.new(:name => 'Presidente Vargas', :zip_code => '65.455-000', :state => state); c.save 
c = City.new(:name => 'Primeira Cruz', :zip_code => '65.190-000', :state => state); c.save 
c = City.new(:name => 'Resplandes', :zip_code => '65.959-000', :state => state); c.save 
c = City.new(:name => 'Riachao', :zip_code => '65.990-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Azul', :zip_code => '65.658-000', :state => state); c.save 
c = City.new(:name => 'Rocado', :zip_code => '65.875-000', :state => state); c.save 
c = City.new(:name => 'Roque', :zip_code => '65.202-000', :state => state); c.save 
c = City.new(:name => 'Rosario', :zip_code => '65.100-000', :state => state); c.save 
c = City.new(:name => 'Sambaiba', :zip_code => '65.830-000', :state => state); c.save 
c = City.new(:name => 'Santa Helena', :zip_code => '65.208-000', :state => state); c.save 
c = City.new(:name => 'Santa Ines', :zip_code => '65.300-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia', :zip_code => '65.390-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Parua', :zip_code => '65.272-000', :state => state); c.save 
c = City.new(:name => 'Santa Quiteria Do Maranhao', :zip_code => '65.540-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '65.105-000', :state => state); c.save 
c = City.new(:name => 'Santo Amaro', :zip_code => '65.195-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Dos Lopes', :zip_code => '65.730-000', :state => state); c.save 
c = City.new(:name => 'Sao Benedito Do Rio Preto', :zip_code => '65.440-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento', :zip_code => '65.235-000', :state => state); c.save 
c = City.new(:name => 'Sao Bernardo', :zip_code => '65.550-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Maranhao', :zip_code => '65.790-000', :state => state); c.save 
c = City.new(:name => 'Sao Felix De Balsas', :zip_code => '65.890-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Maranhao', :zip_code => '65.650-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Batista', :zip_code => '65.225-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Cortes', :zip_code => '65.253-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Dos Patos', :zip_code => '65.665-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim Dos Melos', :zip_code => '65.764-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Ribamar', :zip_code => '65.110-000', :state => state); c.save 
c = City.new(:name => 'Sao Luis', :zip_code => '65.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Luis Gonzaga Do Maranhao', :zip_code => '65.708-000', :state => state); c.save 
c = City.new(:name => 'Sao Mateus Do Maranhao', :zip_code => '65.470-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Da Agua Branca', :zip_code => '65.920-000', :state => state); c.save 
c = City.new(:name => 'Sao Raimundo Das Mangabeiras', :zip_code => '65.840-000', :state => state); c.save 
c = City.new(:name => 'Sao Raimundo De Codo', :zip_code => '65.410-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente Ferrer', :zip_code => '65.220-000', :state => state); c.save 
c = City.new(:name => 'Sitio Novo', :zip_code => '65.925-000', :state => state); c.save 
c = City.new(:name => 'Sucupira Do Norte', :zip_code => '65.860-000', :state => state); c.save 
c = City.new(:name => 'Tasso Fragoso', :zip_code => '65.820-000', :state => state); c.save 
c = City.new(:name => 'Timbiras', :zip_code => '65.420-000', :state => state); c.save 
c = City.new(:name => 'Timon', :zip_code => '65.630-000', :state => state); c.save 
c = City.new(:name => 'Tuntum', :zip_code => '65.763-000', :state => state); c.save 
c = City.new(:name => 'Turiacu', :zip_code => '65.278-000', :state => state); c.save 
c = City.new(:name => 'Tutoia', :zip_code => '65.580-000', :state => state); c.save 
c = City.new(:name => 'Urbano Santos', :zip_code => '65.530-000', :state => state); c.save 
c = City.new(:name => 'Vargem Grande', :zip_code => '65.430-000', :state => state); c.save 
c = City.new(:name => 'Viana', :zip_code => '65.215-000', :state => state); c.save 
c = City.new(:name => 'Vitoria Do Mearim', :zip_code => '65.350-000', :state => state); c.save 
c = City.new(:name => 'Vitorino Freire', :zip_code => '65.320-000', :state => state); c.save 
c = City.new(:name => 'Ze Doca', :zip_code => '65.365-000', :state => state); c.save 
c = City.new(:name => 'Miranda Do Norte', :zip_code => '65.495-000', :state => state); c.save 
c = City.new(:name => 'Bacabeira', :zip_code => '65.103-000', :state => state); c.save 
c = City.new(:name => 'Raposa', :zip_code => '65.138-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Grande', :zip_code => '65.165-000', :state => state); c.save 
c = City.new(:name => 'Presidente Sarney', :zip_code => '65.204-000', :state => state); c.save 
c = City.new(:name => 'Pedro Do Rosario', :zip_code => '65.206-000', :state => state); c.save 
c = City.new(:name => 'Olinda Nova Do Maranhao', :zip_code => '65.223-000', :state => state); c.save 
c = City.new(:name => 'Porto Rico Do Maranhao', :zip_code => '65.263-000', :state => state); c.save 
c = City.new(:name => 'Central Do Maranhao', :zip_code => '65.267-000', :state => state); c.save 
c = City.new(:name => 'Serrano Do Maranhao', :zip_code => '65.269-000', :state => state); c.save 
c = City.new(:name => 'Nova Olinda Do Maranhao', :zip_code => '65.274-000', :state => state); c.save 
c = City.new(:name => 'Apicum-acu', :zip_code => '65.275-000', :state => state); c.save 
c = City.new(:name => 'Turilandia', :zip_code => '65.276-000', :state => state); c.save 
c = City.new(:name => 'Presidente Medici', :zip_code => '65.279-000', :state => state); c.save 
c = City.new(:name => 'Maranhaozinho', :zip_code => '65.283-000', :state => state); c.save 
c = City.new(:name => 'Governador Nunes Freire', :zip_code => '65.284-000', :state => state); c.save 
c = City.new(:name => 'Centro Do Guilherme', :zip_code => '65.288-000', :state => state); c.save 
c = City.new(:name => 'Maracacume', :zip_code => '65.289-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Gurupi', :zip_code => '65.292-000', :state => state); c.save 
c = City.new(:name => 'Amapa Do Maranhao', :zip_code => '65.293-000', :state => state); c.save 
c = City.new(:name => 'Junco Do Maranhao', :zip_code => '65.294-000', :state => state); c.save 
c = City.new(:name => 'Centro Novo Do Maranhao', :zip_code => '65.299-000', :state => state); c.save 
c = City.new(:name => 'Brejo De Areia', :zip_code => '65.315-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Maranhao', :zip_code => '65.335-000', :state => state); c.save 
c = City.new(:name => 'Igarape Do Meio', :zip_code => '65.345-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Lago-acu', :zip_code => '65.340-000', :state => state); c.save 
c = City.new(:name => 'Governador Newton Bello', :zip_code => '65.363-000', :state => state); c.save 
c = City.new(:name => 'Araguana', :zip_code => '65.368-000', :state => state); c.save 
c = City.new(:name => 'Tufilandia', :zip_code => '65.378-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Caru', :zip_code => '65.385-000', :state => state); c.save 
c = City.new(:name => 'Buriticupu', :zip_code => '65.393-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Das Selvas', :zip_code => '65.395-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre Do Pindare', :zip_code => '65.398-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre Do Maranhao', :zip_code => '65.413-000', :state => state); c.save 
c = City.new(:name => 'Matoes Do Norte', :zip_code => '65.468-000', :state => state); c.save 
c = City.new(:name => 'Belagua', :zip_code => '65.535-000', :state => state); c.save 
c = City.new(:name => 'Milagres Do Maranhao', :zip_code => '65.545-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Maranhao', :zip_code => '65.555-000', :state => state); c.save 
c = City.new(:name => 'Agua Doce Do Maranhao', :zip_code => '65.578-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Soter', :zip_code => '65.615-000', :state => state); c.save 
c = City.new(:name => 'Sucupira Do Riachao', :zip_code => '65.668-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Mato', :zip_code => '65.683-000', :state => state); c.save 
c = City.new(:name => 'Jatoba', :zip_code => '65.693-000', :state => state); c.save 
c = City.new(:name => 'Bom Lugar', :zip_code => '65.704-000', :state => state); c.save 
c = City.new(:name => 'Satubinha', :zip_code => '65.709-000', :state => state); c.save 
c = City.new(:name => 'Lago Dos Rodrigues', :zip_code => '65.712-000', :state => state); c.save 
c = City.new(:name => 'Maraja Do Sena', :zip_code => '65.714-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Grande Do Maranhao', :zip_code => '65.718-000', :state => state); c.save 
c = City.new(:name => 'Bernardo Do Mearim', :zip_code => '65.723-000', :state => state); c.save 
c = City.new(:name => 'Trizidela Do Vale', :zip_code => '65.727-000', :state => state); c.save 
c = City.new(:name => 'Capinzal Do Norte', :zip_code => '65.735-000', :state => state); c.save 
c = City.new(:name => 'Sao Raimundo Do Doca Bezerra', :zip_code => '65.753-000', :state => state); c.save 
c = City.new(:name => 'Sao Roberto', :zip_code => '65.758-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Basilios', :zip_code => '65.762-000', :state => state); c.save 
c = City.new(:name => 'Santa Filomena Do Maranhao', :zip_code => '65.768-000', :state => state); c.save 
c = City.new(:name => 'Senador Alexandre Costa', :zip_code => '65.783-000', :state => state); c.save 
c = City.new(:name => 'Governador Luiz Rocha', :zip_code => '65.795-000', :state => state); c.save 
c = City.new(:name => 'Nova Colinas', :zip_code => '65.808-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Azeitao', :zip_code => '65.888-000', :state => state); c.save 
c = City.new(:name => 'Cidelandia', :zip_code => '65.921-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova Dos Martirios', :zip_code => '65.924-000', :state => state); c.save 
c = City.new(:name => 'Davinopolis', :zip_code => '65.927-000', :state => state); c.save 
c = City.new(:name => 'Governador Edison Lobao', :zip_code => '65.928-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Brejao', :zip_code => '65.929-000', :state => state); c.save 
c = City.new(:name => 'Senador La Rocque', :zip_code => '65.935-000', :state => state); c.save 
c = City.new(:name => 'Buritirama', :zip_code => '65.935-500', :state => state); c.save 
c = City.new(:name => 'Ribamar Fiquene', :zip_code => '65.938-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Novo', :zip_code => '65.937-000', :state => state); c.save 
c = City.new(:name => 'Itinga Do Maranhao', :zip_code => '65.939-000', :state => state); c.save 
c = City.new(:name => 'Formosa Da Serra Negra', :zip_code => '65.943-000', :state => state); c.save 
c = City.new(:name => 'Itaipava Do Grajau', :zip_code => '65.948-000', :state => state); c.save 
c = City.new(:name => 'Jenipapo Dos Vieiras', :zip_code => '65.962-000', :state => state); c.save 
c = City.new(:name => 'Fernando Falcao', :zip_code => '65.964-000', :state => state); c.save 
c = City.new(:name => 'Campestre Do Maranhao', :zip_code => '65.968-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Paraiso', :zip_code => '65.973-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Dos Crentes', :zip_code => '65.978-000', :state => state); c.save 
c = City.new(:name => 'Feira Nova Do Maranhao', :zip_code => '65.995-000', :state => state); c.save 

