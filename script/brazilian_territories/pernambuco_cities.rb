#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Pernambuco')
state ||= State.create!( :name => 'Pernambuco', :code => 'PE', :country => country);

c = City.new(:name => 'Abreu E Lima', :zip_code => '53.500-000', :state => state); c.save 
c = City.new(:name => 'Afogados Da Ingazeira', :zip_code => '56.800-000', :state => state); c.save 
c = City.new(:name => 'Afranio', :zip_code => '56.360-000', :state => state); c.save 
c = City.new(:name => 'Agrestina', :zip_code => '55.495-000', :state => state); c.save 
c = City.new(:name => 'Agua Fria', :zip_code => '55.155-000', :state => state); c.save 
c = City.new(:name => 'Agua Preta', :zip_code => '55.550-000', :state => state); c.save 
c = City.new(:name => 'Aguas Belas', :zip_code => '55.340-000', :state => state); c.save 
c = City.new(:name => 'Airi', :zip_code => '56.410-000', :state => state); c.save 
c = City.new(:name => 'Alagoinha', :zip_code => '55.260-000', :state => state); c.save 
c = City.new(:name => 'Albuquerque Ne', :zip_code => '56.610-000', :state => state); c.save 
c = City.new(:name => 'Algodoes', :zip_code => '56.625-000', :state => state); c.save 
c = City.new(:name => 'Alianca', :zip_code => '55.890-000', :state => state); c.save 
c = City.new(:name => 'Altinho', :zip_code => '55.490-000', :state => state); c.save 
c = City.new(:name => 'Amaraji', :zip_code => '55.515-000', :state => state); c.save 
c = City.new(:name => 'Ameixas', :zip_code => '55.658-000', :state => state); c.save 
c = City.new(:name => 'Angelim', :zip_code => '55.430-000', :state => state); c.save 
c = City.new(:name => 'Apoti', :zip_code => '55.625-000', :state => state); c.save 
c = City.new(:name => 'Aracoiaba', :zip_code => '53.690-000', :state => state); c.save 
c = City.new(:name => 'Araripina', :zip_code => '56.280-000', :state => state); c.save 
c = City.new(:name => 'Arcoverde', :zip_code => '56.500-000', :state => state); c.save 
c = City.new(:name => 'Aripibu', :zip_code => '55.524-000', :state => state); c.save 
c = City.new(:name => 'Arizona', :zip_code => '56.365-000', :state => state); c.save 
c = City.new(:name => 'Barra De Guabiraba', :zip_code => '55.690-000', :state => state); c.save 
c = City.new(:name => 'Barra De Sao Pedro', :zip_code => '56.205-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Brejo', :zip_code => '55.332-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Chata', :zip_code => '55.498-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Jardim', :zip_code => '55.496-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Riachao', :zip_code => '55.672-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Sirinhaem', :zip_code => '55.585-000', :state => state); c.save 
c = City.new(:name => 'Barreiros', :zip_code => '55.560-000', :state => state); c.save 
c = City.new(:name => 'Batateira', :zip_code => '55.445-000', :state => state); c.save 
c = City.new(:name => 'Belem De Maria', :zip_code => '55.440-000', :state => state); c.save 
c = City.new(:name => 'Belem De Sao Francisco', :zip_code => '56.440-000', :state => state); c.save 
c = City.new(:name => 'Belo Jardim', :zip_code => '55.150-000', :state => state); c.save 
c = City.new(:name => 'Bengalas', :zip_code => '55.652-000', :state => state); c.save 
c = City.new(:name => 'Bentivi', :zip_code => '55.685-000', :state => state); c.save 
c = City.new(:name => 'Bernardo Vieira', :zip_code => '56.922-000', :state => state); c.save 
c = City.new(:name => 'Betania', :zip_code => '56.670-000', :state => state); c.save 
c = City.new(:name => 'Bezerros', :zip_code => '55.660-000', :state => state); c.save 
c = City.new(:name => 'Bizarra', :zip_code => '55.735-000', :state => state); c.save 
c = City.new(:name => 'Boas Novas', :zip_code => '55.662-000', :state => state); c.save 
c = City.new(:name => 'Bodoco', :zip_code => '56.220-000', :state => state); c.save 
c = City.new(:name => 'Bom Conselho', :zip_code => '55.330-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim', :zip_code => '55.730-000', :state => state); c.save 
c = City.new(:name => 'Bom Nome', :zip_code => '56.970-000', :state => state); c.save 
c = City.new(:name => 'Bonfim', :zip_code => '56.710-000', :state => state); c.save 
c = City.new(:name => 'Bonito', :zip_code => '55.680-000', :state => state); c.save 
c = City.new(:name => 'Brejao', :zip_code => '55.325-000', :state => state); c.save 
c = City.new(:name => 'Brejinho', :zip_code => '56.740-000', :state => state); c.save 
c = City.new(:name => 'Brejo Da Madre De Deus', :zip_code => '55.170-000', :state => state); c.save 
c = City.new(:name => 'Buenos Aires', :zip_code => '55.845-000', :state => state); c.save 
c = City.new(:name => 'Buique', :zip_code => '56.520-000', :state => state); c.save 
c = City.new(:name => 'Cabanas', :zip_code => '55.383-000', :state => state); c.save 
c = City.new(:name => 'Cabo', :zip_code => '54.500-000', :state => state); c.save 
c = City.new(:name => 'Cabrobo', :zip_code => '56.180-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Roberto', :zip_code => '56.370-000', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha', :zip_code => '55.380-000', :state => state); c.save 
c = City.new(:name => 'Caetes', :zip_code => '55.360-000', :state => state); c.save 
c = City.new(:name => 'Caicarinha Da Penha', :zip_code => '56.916-000', :state => state); c.save 
c = City.new(:name => 'Calcado', :zip_code => '55.375-000', :state => state); c.save 
c = City.new(:name => 'Caldeiroes', :zip_code => '55.338-000', :state => state); c.save 
c = City.new(:name => 'Calumbi', :zip_code => '56.930-000', :state => state); c.save 
c = City.new(:name => 'Camaragibe', :zip_code => '54.750-000', :state => state); c.save 
c = City.new(:name => 'Camela', :zip_code => '55.595-000', :state => state); c.save 
c = City.new(:name => 'Camocim De Sao Felix', :zip_code => '55.665-000', :state => state); c.save 
c = City.new(:name => 'Camutanga', :zip_code => '55.930-000', :state => state); c.save 
c = City.new(:name => 'Canaa', :zip_code => '56.880-000', :state => state); c.save 
c = City.new(:name => 'Canhotinho', :zip_code => '55.420-000', :state => state); c.save 
c = City.new(:name => 'Capoeiras', :zip_code => '55.365-000', :state => state); c.save 
c = City.new(:name => 'Caraibeiras', :zip_code => '56.485-000', :state => state); c.save 
c = City.new(:name => 'Carapotos', :zip_code => '55.110-000', :state => state); c.save 
c = City.new(:name => 'Carice', :zip_code => '55.928-000', :state => state); c.save 
c = City.new(:name => 'Carima', :zip_code => '55.564-000', :state => state); c.save 
c = City.new(:name => 'Caririmirim', :zip_code => '56.155-000', :state => state); c.save 
c = City.new(:name => 'Carnaiba', :zip_code => '56.820-000', :state => state); c.save 
c = City.new(:name => 'Carnaubeira Da Penha', :zip_code => '56.420-000', :state => state); c.save 
c = City.new(:name => 'Carneiro', :zip_code => '56.533-000', :state => state); c.save 
c = City.new(:name => 'Carpina', :zip_code => '55.810-000', :state => state); c.save 
c = City.new(:name => 'Carqueja', :zip_code => '56.415-000', :state => state); c.save 
c = City.new(:name => 'Caruaru', :zip_code => '55.000-000', :state => state); c.save 
c = City.new(:name => 'Casinhas', :zip_code => '55.755-000', :state => state); c.save 
c = City.new(:name => 'Catende', :zip_code => '55.400-000', :state => state); c.save 
c = City.new(:name => 'Catimbau', :zip_code => '56.537-000', :state => state); c.save 
c = City.new(:name => 'Cavaleiro', :zip_code => '54.000-000', :state => state); c.save 
c = City.new(:name => 'Cedro', :zip_code => '56.130-000', :state => state); c.save 
c = City.new(:name => 'Cha De Alegria', :zip_code => '55.835-000', :state => state); c.save 
c = City.new(:name => 'Cha Do Rocha', :zip_code => '55.748-000', :state => state); c.save 
c = City.new(:name => 'Cha Grande', :zip_code => '55.636-000', :state => state); c.save 
c = City.new(:name => 'Cimbres', :zip_code => '55.205-000', :state => state); c.save 
c = City.new(:name => 'Cocau', :zip_code => '56.223-000', :state => state); c.save 
c = City.new(:name => 'Cocau', :zip_code => '55.575-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Das Crioulas', :zip_code => '56.115-000', :state => state); c.save 
c = City.new(:name => 'Condado', :zip_code => '55.940-000', :state => state); c.save 
c = City.new(:name => 'Correntes', :zip_code => '55.315-000', :state => state); c.save 
c = City.new(:name => 'Cortes', :zip_code => '55.525-000', :state => state); c.save 
c = City.new(:name => 'Couro Dantas', :zip_code => '55.121-000', :state => state); c.save 
c = City.new(:name => 'Cristalia', :zip_code => '56.340-000', :state => state); c.save 
c = City.new(:name => 'Cruanji', :zip_code => '55.875-000', :state => state); c.save 
c = City.new(:name => 'Cruzes', :zip_code => '55.473-000', :state => state); c.save 
c = City.new(:name => 'Cuiambuca', :zip_code => '55.533-000', :state => state); c.save 
c = City.new(:name => 'Cumaru', :zip_code => '55.655-000', :state => state); c.save 
c = City.new(:name => 'Cupira', :zip_code => '55.460-000', :state => state); c.save 
c = City.new(:name => 'Curral Queimado', :zip_code => '56.335-000', :state => state); c.save 
c = City.new(:name => 'Custodia', :zip_code => '56.640-000', :state => state); c.save 
c = City.new(:name => 'Dois Leoes', :zip_code => '55.633-000', :state => state); c.save 
c = City.new(:name => 'Dormentes', :zip_code => '56.355-000', :state => state); c.save 
c = City.new(:name => 'Entroncamento', :zip_code => '55.453-000', :state => state); c.save 
c = City.new(:name => 'Escada', :zip_code => '55.500-000', :state => state); c.save 
c = City.new(:name => 'Espirito Santo', :zip_code => '55.374-000', :state => state); c.save 
c = City.new(:name => 'Exu', :zip_code => '56.230-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Nova', :zip_code => '55.175-000', :state => state); c.save 
c = City.new(:name => 'Feira Nova', :zip_code => '55.715-000', :state => state); c.save 
c = City.new(:name => 'Feitoria', :zip_code => '56.228-000', :state => state); c.save 
c = City.new(:name => 'Ferreiros', :zip_code => '55.880-000', :state => state); c.save 
c = City.new(:name => 'Flores', :zip_code => '56.850-000', :state => state); c.save 
c = City.new(:name => 'Floresta', :zip_code => '56.400-000', :state => state); c.save 
c = City.new(:name => 'Frei Miguelinho', :zip_code => '55.780-000', :state => state); c.save 
c = City.new(:name => 'Gameleira', :zip_code => '55.530-000', :state => state); c.save 
c = City.new(:name => 'Garanhuns', :zip_code => '55.290-000', :state => state); c.save 
c = City.new(:name => 'Gloria Do Goita', :zip_code => '55.620-000', :state => state); c.save 
c = City.new(:name => 'Goiana', :zip_code => '55.900-000', :state => state); c.save 
c = City.new(:name => 'Goncalves Ferreira', :zip_code => '55.105-000', :state => state); c.save 
c = City.new(:name => 'Granito', :zip_code => '56.160-000', :state => state); c.save 
c = City.new(:name => 'Gravata', :zip_code => '55.640-000', :state => state); c.save 
c = City.new(:name => 'Gravata Do Ibiapina', :zip_code => '55.795-000', :state => state); c.save 
c = City.new(:name => 'Grotao', :zip_code => '55.275-000', :state => state); c.save 
c = City.new(:name => 'Guanumbi', :zip_code => '56.535-000', :state => state); c.save 
c = City.new(:name => 'Henrique Dias', :zip_code => '56.620-000', :state => state); c.save 
c = City.new(:name => 'Iateca', :zip_code => '55.353-000', :state => state); c.save 
c = City.new(:name => 'Iati', :zip_code => '55.345-000', :state => state); c.save 
c = City.new(:name => 'Ibimirim', :zip_code => '56.580-000', :state => state); c.save 
c = City.new(:name => 'Ibirajuba', :zip_code => '55.390-000', :state => state); c.save 
c = City.new(:name => 'Ibiranga', :zip_code => '55.929-000', :state => state); c.save 
c = City.new(:name => 'Ibiratinga', :zip_code => '55.588-000', :state => state); c.save 
c = City.new(:name => 'Ibitiranga', :zip_code => '56.825-000', :state => state); c.save 
c = City.new(:name => 'Ibo', :zip_code => '56.450-000', :state => state); c.save 
c = City.new(:name => 'Icaicara', :zip_code => '56.165-000', :state => state); c.save 
c = City.new(:name => 'Igapo', :zip_code => '55.322-000', :state => state); c.save 
c = City.new(:name => 'Igarapeassu', :zip_code => '55.455-000', :state => state); c.save 
c = City.new(:name => 'Igarapeba', :zip_code => '55.412-000', :state => state); c.save 
c = City.new(:name => 'Igarassu', :zip_code => '53.600-000', :state => state); c.save 
c = City.new(:name => 'Iguaraci', :zip_code => '56.840-000', :state => state); c.save 
c = City.new(:name => 'Inaja', :zip_code => '56.560-000', :state => state); c.save 
c = City.new(:name => 'Ingazeira', :zip_code => '56.830-000', :state => state); c.save 
c = City.new(:name => 'Ipojuca', :zip_code => '55.590-000', :state => state); c.save 
c = City.new(:name => 'Ipubi', :zip_code => '56.260-000', :state => state); c.save 
c = City.new(:name => 'Ipuera', :zip_code => '56.145-000', :state => state); c.save 
c = City.new(:name => 'Iraguacu', :zip_code => '56.890-000', :state => state); c.save 
c = City.new(:name => 'Irajai', :zip_code => '56.845-000', :state => state); c.save 
c = City.new(:name => 'Iratama', :zip_code => '55.304-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '55.302-000', :state => state); c.save 
c = City.new(:name => 'Itacuruba', :zip_code => '56.430-000', :state => state); c.save 
c = City.new(:name => 'Itaiba', :zip_code => '56.550-000', :state => state); c.save 
c = City.new(:name => 'Itamaraca', :zip_code => '53.900-000', :state => state); c.save 
c = City.new(:name => 'Itambe', :zip_code => '55.920-000', :state => state); c.save 
c = City.new(:name => 'Itapetim', :zip_code => '56.720-000', :state => state); c.save 
c = City.new(:name => 'Itapissuma', :zip_code => '53.700-000', :state => state); c.save 
c = City.new(:name => 'Itaquitinga', :zip_code => '55.950-000', :state => state); c.save 
c = City.new(:name => 'Ituguacu', :zip_code => '55.493-000', :state => state); c.save 
c = City.new(:name => 'Iuitepora', :zip_code => '55.682-000', :state => state); c.save 
c = City.new(:name => 'Jabitaca', :zip_code => '56.848-000', :state => state); c.save 
c = City.new(:name => 'Jaboatao Dos Guararapes', :zip_code => '54.000-000', :state => state); c.save 
c = City.new(:name => 'Japecanga', :zip_code => '55.287-000', :state => state); c.save 
c = City.new(:name => 'Jaqueira', :zip_code => '55.409-000', :state => state); c.save 
c = City.new(:name => 'Jatauba', :zip_code => '55.180-000', :state => state); c.save 
c = City.new(:name => 'Jatiuca', :zip_code => '56.885-000', :state => state); c.save 
c = City.new(:name => 'Jenipapo', :zip_code => '55.258-000', :state => state); c.save 
c = City.new(:name => 'Joao Alfredo', :zip_code => '55.720-000', :state => state); c.save 
c = City.new(:name => 'Joaquim Nabuco', :zip_code => '55.535-000', :state => state); c.save 
c = City.new(:name => 'Jose Da Costa', :zip_code => '55.534-000', :state => state); c.save 
c = City.new(:name => 'Jose Mariano', :zip_code => '55.522-000', :state => state); c.save 
c = City.new(:name => 'Jucaral', :zip_code => '54.570-000', :state => state); c.save 
c = City.new(:name => 'Jucati', :zip_code => '55.398-000', :state => state); c.save 
c = City.new(:name => 'Jupi', :zip_code => '55.395-000', :state => state); c.save 
c = City.new(:name => 'Jurema', :zip_code => '55.480-000', :state => state); c.save 
c = City.new(:name => 'Lagoa', :zip_code => '56.350-000', :state => state); c.save 
c = City.new(:name => 'Lagoa De Sao Jose', :zip_code => '55.336-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Barro', :zip_code => '56.284-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Carro', :zip_code => '55.820-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Itaenga', :zip_code => '55.840-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Ouro', :zip_code => '55.320-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Souza', :zip_code => '55.458-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Dos Gatos', :zip_code => '55.450-000', :state => state); c.save 
c = City.new(:name => 'Laje De Sao Jose', :zip_code => '55.465-000', :state => state); c.save 
c = City.new(:name => 'Laje Grande', :zip_code => '55.402-000', :state => state); c.save 
c = City.new(:name => 'Lajedo', :zip_code => '55.385-000', :state => state); c.save 
c = City.new(:name => 'Lajedo Do Cedro', :zip_code => '55.108-000', :state => state); c.save 
c = City.new(:name => 'Limoeiro', :zip_code => '55.700-000', :state => state); c.save 
c = City.new(:name => 'Livramento Do Tiuma', :zip_code => '55.878-000', :state => state); c.save 
c = City.new(:name => 'Luanda', :zip_code => '56.918-000', :state => state); c.save 
c = City.new(:name => 'Macaparana', :zip_code => '55.865-000', :state => state); c.save 
c = City.new(:name => 'Machados', :zip_code => '55.740-000', :state => state); c.save 
c = City.new(:name => 'Macuje', :zip_code => '55.898-000', :state => state); c.save 
c = City.new(:name => 'Manari', :zip_code => '56.565-000', :state => state); c.save 
c = City.new(:name => 'Mandacaru', :zip_code => '55.646-000', :state => state); c.save 
c = City.new(:name => 'Manicoba', :zip_code => '55.135-000', :state => state); c.save 
c = City.new(:name => 'Maraial', :zip_code => '55.405-000', :state => state); c.save 
c = City.new(:name => 'Maravilha', :zip_code => '56.650-000', :state => state); c.save 
c = City.new(:name => 'Mimoso', :zip_code => '55.225-000', :state => state); c.save 
c = City.new(:name => 'Miracica', :zip_code => '55.303-000', :state => state); c.save 
c = City.new(:name => 'Mirandiba', :zip_code => '56.980-000', :state => state); c.save 
c = City.new(:name => 'Morais', :zip_code => '56.287-000', :state => state); c.save 
c = City.new(:name => 'Moreno', :zip_code => '54.800-000', :state => state); c.save 
c = City.new(:name => 'Moxoto', :zip_code => '56.585-000', :state => state); c.save 
c = City.new(:name => 'Mulungu', :zip_code => '55.255-000', :state => state); c.save 
c = City.new(:name => 'Jaboatao', :zip_code => '54.000-000', :state => state); c.save 
c = City.new(:name => 'Murupe', :zip_code => '55.855-000', :state => state); c.save 
c = City.new(:name => 'Mutuca', :zip_code => '55.210-000', :state => state); c.save 
c = City.new(:name => 'Nascente', :zip_code => '56.285-000', :state => state); c.save 
c = City.new(:name => 'Navarro', :zip_code => '53.400-000', :state => state); c.save 
c = City.new(:name => 'Nazare Da Mata', :zip_code => '55.800-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Luz', :zip_code => '54.749-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Carmo', :zip_code => '55.634-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do O', :zip_code => '55.592-000', :state => state); c.save 
c = City.new(:name => 'Nova Cruz', :zip_code => '53.660-000', :state => state); c.save 
c = City.new(:name => 'Olho Dagua De Dentro', :zip_code => '55.423-000', :state => state); c.save 
c = City.new(:name => 'Olinda', :zip_code => '53.000-000', :state => state); c.save 
c = City.new(:name => 'Ori', :zip_code => '56.148-000', :state => state); c.save 
c = City.new(:name => 'Orobo', :zip_code => '55.745-000', :state => state); c.save 
c = City.new(:name => 'Oroco', :zip_code => '56.170-000', :state => state); c.save 
c = City.new(:name => 'Ouricuri', :zip_code => '56.200-000', :state => state); c.save 
c = City.new(:name => 'Pajeu', :zip_code => '56.920-000', :state => state); c.save 
c = City.new(:name => 'Palmares', :zip_code => '55.540-000', :state => state); c.save 
c = City.new(:name => 'Palmeirina', :zip_code => '55.310-000', :state => state); c.save 
c = City.new(:name => 'Panelas', :zip_code => '55.470-000', :state => state); c.save 
c = City.new(:name => 'Pao De Acucar', :zip_code => '55.798-000', :state => state); c.save 
c = City.new(:name => 'Pao De Acucar Do Pocao', :zip_code => '55.245-000', :state => state); c.save 
c = City.new(:name => 'Papagaio', :zip_code => '55.215-000', :state => state); c.save 
c = City.new(:name => 'Paquevira', :zip_code => '55.425-000', :state => state); c.save 
c = City.new(:name => 'Para', :zip_code => '55.198-000', :state => state); c.save 
c = City.new(:name => 'Paranatama', :zip_code => '55.355-000', :state => state); c.save 
c = City.new(:name => 'Paratibe', :zip_code => '53.400-000', :state => state); c.save 
c = City.new(:name => 'Parnamirim', :zip_code => '56.163-000', :state => state); c.save 
c = City.new(:name => 'Passagem Do To', :zip_code => '55.185-000', :state => state); c.save 
c = City.new(:name => 'Passira', :zip_code => '55.650-000', :state => state); c.save 
c = City.new(:name => 'Pau Ferro', :zip_code => '55.418-000', :state => state); c.save 
c = City.new(:name => 'Paudalho', :zip_code => '55.825-000', :state => state); c.save 
c = City.new(:name => 'Paulista', :zip_code => '53.400-000', :state => state); c.save 
c = City.new(:name => 'Pedra', :zip_code => '55.280-000', :state => state); c.save 
c = City.new(:name => 'Perpetuo Socorro', :zip_code => '55.265-000', :state => state); c.save 
c = City.new(:name => 'Pesqueira', :zip_code => '55.200-000', :state => state); c.save 
c = City.new(:name => 'Petrolandia', :zip_code => '56.460-000', :state => state); c.save 
c = City.new(:name => 'Petrolina', :zip_code => '56.300-000', :state => state); c.save 
c = City.new(:name => 'Pirituba', :zip_code => '55.618-000', :state => state); c.save 
c = City.new(:name => 'Pocao', :zip_code => '55.240-000', :state => state); c.save 
c = City.new(:name => 'Pocao De Afranio', :zip_code => '56.375-000', :state => state); c.save 
c = City.new(:name => 'Poco Comprido', :zip_code => '55.317-000', :state => state); c.save 
c = City.new(:name => 'Poco Fundo', :zip_code => '55.195-000', :state => state); c.save 
c = City.new(:name => 'Pombos', :zip_code => '55.630-000', :state => state); c.save 
c = City.new(:name => 'Pontas De Pedra', :zip_code => '55.908-000', :state => state); c.save 
c = City.new(:name => 'Ponte Dos Carvalhos', :zip_code => '54.580-000', :state => state); c.save 
c = City.new(:name => 'Praia Da Conceicao', :zip_code => '53.400-000', :state => state); c.save 
c = City.new(:name => 'Primavera', :zip_code => '55.510-000', :state => state); c.save 
c = City.new(:name => 'Quipapa', :zip_code => '55.415-000', :state => state); c.save 
c = City.new(:name => 'Quixaba', :zip_code => '56.828-000', :state => state); c.save 
c = City.new(:name => 'Rainha Isabel', :zip_code => '55.334-000', :state => state); c.save 
c = City.new(:name => 'Rajada', :zip_code => '56.345-000', :state => state); c.save 
c = City.new(:name => 'Rancharia', :zip_code => '56.282-000', :state => state); c.save 
c = City.new(:name => 'Recife', :zip_code => '50.000-000', :state => state); c.save 
c = City.new(:name => 'Riacho Das Almas', :zip_code => '55.120-000', :state => state); c.save 
c = City.new(:name => 'Riacho Do Meio', :zip_code => '56.705-000', :state => state); c.save 
c = City.new(:name => 'Riacho Fechado', :zip_code => '55.145-000', :state => state); c.save 
c = City.new(:name => 'Riacho Pequeno', :zip_code => '56.445-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao', :zip_code => '55.520-000', :state => state); c.save 
c = City.new(:name => 'Rio Da Barra', :zip_code => '56.615-000', :state => state); c.save 
c = City.new(:name => 'Rio Formoso', :zip_code => '55.570-000', :state => state); c.save 
c = City.new(:name => 'Saire', :zip_code => '55.695-000', :state => state); c.save 
c = City.new(:name => 'Salgadinho', :zip_code => '55.675-000', :state => state); c.save 
c = City.new(:name => 'Salgueiro', :zip_code => '56.000-000', :state => state); c.save 
c = City.new(:name => 'Saloa', :zip_code => '55.350-000', :state => state); c.save 
c = City.new(:name => 'Salobro', :zip_code => '55.220-000', :state => state); c.save 
c = City.new(:name => 'Sanharo', :zip_code => '55.250-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz', :zip_code => '56.215-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Da Baixa Verde', :zip_code => '56.895-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Capibaribe', :zip_code => '55.190-000', :state => state); c.save 
c = City.new(:name => 'Santa Filomena', :zip_code => '56.210-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Da Boa Vista', :zip_code => '56.380-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Cambuca', :zip_code => '55.765-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '56.770-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '56.750-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '55.552-000', :state => state); c.save 
c = City.new(:name => 'Santana De Sao Joaquim', :zip_code => '55.674-000', :state => state); c.save 
c = City.new(:name => 'Santo Agostinho', :zip_code => '54.590-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Das Queimadas', :zip_code => '55.485-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Dos Palmares', :zip_code => '55.548-000', :state => state); c.save 
c = City.new(:name => 'Sao Benedito Do Sul', :zip_code => '55.410-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento Do Una', :zip_code => '55.370-000', :state => state); c.save 
c = City.new(:name => 'Sao Caetano Do Navio', :zip_code => '56.680-000', :state => state); c.save 
c = City.new(:name => 'Sao Caitano', :zip_code => '55.130-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao', :zip_code => '55.435-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim Do Monte', :zip_code => '55.670-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '55.475-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Coroa Grande', :zip_code => '55.565-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Belmonte', :zip_code => '56.950-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Egito', :zip_code => '56.700-000', :state => state); c.save 
c = City.new(:name => 'Sao Lazaro', :zip_code => '55.478-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco Da Mata', :zip_code => '54.700-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '56.730-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente Ferrer', :zip_code => '55.860-000', :state => state); c.save 
c = City.new(:name => 'Sapucarana', :zip_code => '55.661-000', :state => state); c.save 
c = City.new(:name => 'Saue', :zip_code => '55.572-000', :state => state); c.save 
c = City.new(:name => 'Serra Branca', :zip_code => '56.265-000', :state => state); c.save 
c = City.new(:name => 'Serra Do Vento', :zip_code => '55.160-000', :state => state); c.save 
c = City.new(:name => 'Serra Talhada', :zip_code => '56.900-000', :state => state); c.save 
c = City.new(:name => 'Serrita', :zip_code => '56.140-000', :state => state); c.save 
c = City.new(:name => 'Serrolandia', :zip_code => '56.270-000', :state => state); c.save 
c = City.new(:name => 'Sertania', :zip_code => '56.600-000', :state => state); c.save 
c = City.new(:name => 'Sertaozinho De Baixo', :zip_code => '55.408-000', :state => state); c.save 
c = City.new(:name => 'Siriji', :zip_code => '55.863-000', :state => state); c.save 
c = City.new(:name => 'Sirinhaem', :zip_code => '55.580-000', :state => state); c.save 
c = City.new(:name => 'Moreilandia', :zip_code => '56.150-000', :state => state); c.save 
c = City.new(:name => 'Sitio Dos Nunes', :zip_code => '56.860-000', :state => state); c.save 
c = City.new(:name => 'Solidao', :zip_code => '56.795-000', :state => state); c.save 
c = City.new(:name => 'Surubim', :zip_code => '55.750-000', :state => state); c.save 
c = City.new(:name => 'Tabira', :zip_code => '56.780-000', :state => state); c.save 
c = City.new(:name => 'Tabocas', :zip_code => '56.240-000', :state => state); c.save 
c = City.new(:name => 'Tacaimbo', :zip_code => '55.140-000', :state => state); c.save 
c = City.new(:name => 'Tacaratu', :zip_code => '56.480-000', :state => state); c.save 
c = City.new(:name => 'Tamandare', :zip_code => '55.578-000', :state => state); c.save 
c = City.new(:name => 'Tamboata', :zip_code => '55.733-000', :state => state); c.save 
c = City.new(:name => 'Tapiraim', :zip_code => '55.138-000', :state => state); c.save 
c = City.new(:name => 'Taquaritinga Do Norte', :zip_code => '55.790-000', :state => state); c.save 
c = City.new(:name => 'Tara', :zip_code => '55.285-000', :state => state); c.save 
c = City.new(:name => 'Tauapiranga', :zip_code => '56.925-000', :state => state); c.save 
c = City.new(:name => 'Tejucupapo', :zip_code => '55.905-000', :state => state); c.save 
c = City.new(:name => 'Terezinha', :zip_code => '55.305-000', :state => state); c.save 
c = City.new(:name => 'Terra Nova', :zip_code => '56.190-000', :state => state); c.save 
c = City.new(:name => 'Timbauba', :zip_code => '55.870-000', :state => state); c.save 
c = City.new(:name => 'Timorante', :zip_code => '56.234-000', :state => state); c.save 
c = City.new(:name => 'Toritama', :zip_code => '55.125-000', :state => state); c.save 
c = City.new(:name => 'Tracunhaem', :zip_code => '55.805-000', :state => state); c.save 
c = City.new(:name => 'Trapia', :zip_code => '55.122-000', :state => state); c.save 
c = City.new(:name => 'Tres Ladeiras', :zip_code => '53.670-000', :state => state); c.save 
c = City.new(:name => 'Trindade', :zip_code => '56.250-000', :state => state); c.save 
c = City.new(:name => 'Triunfo', :zip_code => '56.870-000', :state => state); c.save 
c = City.new(:name => 'Tupanaci', :zip_code => '56.990-000', :state => state); c.save 
c = City.new(:name => 'Tupanatinga', :zip_code => '56.540-000', :state => state); c.save 
c = City.new(:name => 'Tupaoca', :zip_code => '55.895-000', :state => state); c.save 
c = City.new(:name => 'Tuparetama', :zip_code => '56.760-000', :state => state); c.save 
c = City.new(:name => 'Umas', :zip_code => '56.105-000', :state => state); c.save 
c = City.new(:name => 'Umburetama', :zip_code => '55.746-000', :state => state); c.save 
c = City.new(:name => 'Upatininga', :zip_code => '55.896-000', :state => state); c.save 
c = City.new(:name => 'Urucu-mirim', :zip_code => '55.648-000', :state => state); c.save 
c = City.new(:name => 'Urucuba', :zip_code => '55.705-000', :state => state); c.save 
c = City.new(:name => 'Vasques', :zip_code => '56.110-000', :state => state); c.save 
c = City.new(:name => 'Veneza', :zip_code => '56.168-000', :state => state); c.save 
c = City.new(:name => 'Venturosa', :zip_code => '55.270-000', :state => state); c.save 
c = City.new(:name => 'Verdejante', :zip_code => '56.120-000', :state => state); c.save 
c = City.new(:name => 'Vertente Do Lerio', :zip_code => '55.760-000', :state => state); c.save 
c = City.new(:name => 'Vertentes', :zip_code => '55.770-000', :state => state); c.save 
c = City.new(:name => 'Vicencia', :zip_code => '55.850-000', :state => state); c.save 
c = City.new(:name => 'Viracao', :zip_code => '56.236-000', :state => state); c.save 
c = City.new(:name => 'Vitoria De Santo Antao', :zip_code => '55.600-000', :state => state); c.save 
c = City.new(:name => 'Volta Do Moxoto', :zip_code => '56.475-000', :state => state); c.save 
c = City.new(:name => 'Xexeu', :zip_code => '55.555-000', :state => state); c.save 
c = City.new(:name => 'Xucuru', :zip_code => '55.165-000', :state => state); c.save 
c = City.new(:name => 'Ze Gomes', :zip_code => '56.245-000', :state => state); c.save 
c = City.new(:name => 'Jutai', :zip_code => '56.390-000', :state => state); c.save 
c = City.new(:name => 'Quitimbu', :zip_code => '56.660-000', :state => state); c.save 
c = City.new(:name => 'Frexeiras', :zip_code => '55.505-000', :state => state); c.save 
c = City.new(:name => 'Mandacaia', :zip_code => '55.174-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '55.178-000', :state => state); c.save 
c = City.new(:name => 'Barra De Farias', :zip_code => '55.172-000', :state => state); c.save 
c = City.new(:name => 'Fernando De Noronha', :zip_code => '53.990-000', :state => state); c.save 
c = City.new(:name => 'Clarana', :zip_code => '56.227-000', :state => state); c.save 
c = City.new(:name => 'Urimama', :zip_code => '56.386-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Grande', :zip_code => '56.395-000', :state => state); c.save 
c = City.new(:name => 'Caraiba', :zip_code => '56.393-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova', :zip_code => '55.757-000', :state => state); c.save 
c = City.new(:name => 'Oratorio', :zip_code => '55.758-000', :state => state); c.save 
c = City.new(:name => 'Catole', :zip_code => '55.759-000', :state => state); c.save 
c = City.new(:name => 'Jatoba', :zip_code => '56.470-000', :state => state); c.save 
c = City.new(:name => 'Negras', :zip_code => '56.555-000', :state => state); c.save 
