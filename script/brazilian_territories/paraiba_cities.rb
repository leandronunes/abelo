#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Paraíba')
state ||= State.create!( :name => 'Paraíba', :code => 'PB', :country => country);

c = City.new(:name => 'Agua Branca', :zip_code => '58.748-000', :state => state); c.save 
c = City.new(:name => 'Aguiar', :zip_code => '58.778-000', :state => state); c.save 
c = City.new(:name => 'Alagoa Grande', :zip_code => '58.388-000', :state => state); c.save 
c = City.new(:name => 'Alagoa Nova', :zip_code => '58.125-000', :state => state); c.save 
c = City.new(:name => 'Alagoinha', :zip_code => '58.390-000', :state => state); c.save 
c = City.new(:name => 'Alcantil', :zip_code => '58.460-000', :state => state); c.save 
c = City.new(:name => 'Algodao De Jandaira', :zip_code => '58.399-000', :state => state); c.save 
c = City.new(:name => 'Alhandra', :zip_code => '58.320-000', :state => state); c.save 
c = City.new(:name => 'Amparo', :zip_code => '58.548-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Rio Do Peixe', :zip_code => '58.910-000', :state => state); c.save 
c = City.new(:name => 'Aparecida', :zip_code => '58.823-000', :state => state); c.save 
c = City.new(:name => 'Aracagi', :zip_code => '58.270-000', :state => state); c.save 
c = City.new(:name => 'Arara', :zip_code => '58.396-000', :state => state); c.save 
c = City.new(:name => 'Araruna', :zip_code => '58.233-000', :state => state); c.save 
c = City.new(:name => 'Areia', :zip_code => '58.397-000', :state => state); c.save 
c = City.new(:name => 'Areia De Baraunas', :zip_code => '58.732-000', :state => state); c.save 
c = City.new(:name => 'Areial', :zip_code => '58.140-000', :state => state); c.save 
c = City.new(:name => 'Aroeiras', :zip_code => '58.400-000', :state => state); c.save 
c = City.new(:name => 'Assuncao', :zip_code => '58.685-000', :state => state); c.save 
c = City.new(:name => 'Baia Da Traicao', :zip_code => '58.295-000', :state => state); c.save 
c = City.new(:name => 'Balancos', :zip_code => '58.937-000', :state => state); c.save 
c = City.new(:name => 'Bananeiras', :zip_code => '58.220-000', :state => state); c.save 
c = City.new(:name => 'Barauna', :zip_code => '58.188-000', :state => state); c.save 
c = City.new(:name => 'Barra De Santa Rosa', :zip_code => '58.170-000', :state => state); c.save 
c = City.new(:name => 'Barra De Sao Miguel', :zip_code => '58.470-000', :state => state); c.save 
c = City.new(:name => 'Bayeux', :zip_code => '58.305-000', :state => state); c.save 
c = City.new(:name => 'Belem', :zip_code => '58.255-000', :state => state); c.save 
c = City.new(:name => 'Belem Do Brejo Do Cruz', :zip_code => '58.895-000', :state => state); c.save 
c = City.new(:name => 'Boa Ventura', :zip_code => '58.993-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '58.123-000', :state => state); c.save 
c = City.new(:name => 'Barra De Santana', :zip_code => '58.458-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus', :zip_code => '58.930-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso', :zip_code => '58.887-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso', :zip_code => '58.156-000', :state => state); c.save 
c = City.new(:name => 'Bonito De Santa Fe', :zip_code => '58.960-000', :state => state); c.save 
c = City.new(:name => 'Boqueirao', :zip_code => '58.450-000', :state => state); c.save 
c = City.new(:name => 'Igaracy', :zip_code => '58.775-000', :state => state); c.save 
c = City.new(:name => 'Borborema', :zip_code => '58.394-000', :state => state); c.save 
c = City.new(:name => 'Brejo Do Cruz', :zip_code => '58.890-000', :state => state); c.save 
c = City.new(:name => 'Brejo Dos Santos', :zip_code => '58.880-000', :state => state); c.save 
c = City.new(:name => 'Caapora', :zip_code => '58.326-000', :state => state); c.save 
c = City.new(:name => 'Cabaceiras', :zip_code => '58.480-000', :state => state); c.save 
c = City.new(:name => 'Cabedelo', :zip_code => '58.310-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira', :zip_code => '58.205-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Dos Indios', :zip_code => '58.935-000', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha', :zip_code => '58.983-000', :state => state); c.save 
c = City.new(:name => 'Cacimba De Areia', :zip_code => '58.730-000', :state => state); c.save 
c = City.new(:name => 'Cacimba De Dentro', :zip_code => '58.230-000', :state => state); c.save 
c = City.new(:name => 'Caicara', :zip_code => '58.253-000', :state => state); c.save 
c = City.new(:name => 'Cajazeiras', :zip_code => '58.900-000', :state => state); c.save 
c = City.new(:name => 'Cajazeirinhas', :zip_code => '58.855-000', :state => state); c.save 
c = City.new(:name => 'Caldas Brandao', :zip_code => '58.350-000', :state => state); c.save 
c = City.new(:name => 'Camalau', :zip_code => '58.530-000', :state => state); c.save 
c = City.new(:name => 'Campina Grande', :zip_code => '58.100-000', :state => state); c.save 
c = City.new(:name => 'Campo Grande', :zip_code => '58.362-000', :state => state); c.save 
c = City.new(:name => 'Camurupim', :zip_code => '58.299-000', :state => state); c.save 
c = City.new(:name => 'Capim', :zip_code => '58.287-000', :state => state); c.save 
c = City.new(:name => 'Caraubas', :zip_code => '58.595-000', :state => state); c.save 
c = City.new(:name => 'Cardoso', :zip_code => '58.973-000', :state => state); c.save 
c = City.new(:name => 'Carrapateira', :zip_code => '58.945-000', :state => state); c.save 
c = City.new(:name => 'Catingueira', :zip_code => '58.715-000', :state => state); c.save 
c = City.new(:name => 'Catole', :zip_code => '58.114-000', :state => state); c.save 
c = City.new(:name => 'Catole Do Rocha', :zip_code => '58.884-000', :state => state); c.save 
c = City.new(:name => 'Caturite', :zip_code => '58.455-000', :state => state); c.save 
c = City.new(:name => 'Cepilho', :zip_code => '58.372-000', :state => state); c.save 
c = City.new(:name => 'Conceicao', :zip_code => '58.970-000', :state => state); c.save 
c = City.new(:name => 'Condado', :zip_code => '58.714-000', :state => state); c.save 
c = City.new(:name => 'Conde', :zip_code => '58.322-000', :state => state); c.save 
c = City.new(:name => 'Congo', :zip_code => '58.535-000', :state => state); c.save 
c = City.new(:name => 'Coremas', :zip_code => '58.770-000', :state => state); c.save 
c = City.new(:name => 'Coronel Maia', :zip_code => '58.885-000', :state => state); c.save 
c = City.new(:name => 'Coxixola', :zip_code => '58.588-000', :state => state); c.save 
c = City.new(:name => 'Cruz Do Espirito Santo', :zip_code => '58.337-000', :state => state); c.save 
c = City.new(:name => 'Cubati', :zip_code => '58.167-000', :state => state); c.save 
c = City.new(:name => 'Cuite', :zip_code => '58.175-000', :state => state); c.save 
c = City.new(:name => 'Cuite De Mamanguape', :zip_code => '58.289-000', :state => state); c.save 
c = City.new(:name => 'Cuitegi', :zip_code => '58.208-000', :state => state); c.save 
c = City.new(:name => 'Curral De Cima', :zip_code => '58.291-000', :state => state); c.save 
c = City.new(:name => 'Curral Velho', :zip_code => '58.990-000', :state => state); c.save 
c = City.new(:name => 'Desterro', :zip_code => '58.695-000', :state => state); c.save 
c = City.new(:name => 'Vista Serrana', :zip_code => '58.710-000', :state => state); c.save 
c = City.new(:name => 'Diamante', :zip_code => '58.994-000', :state => state); c.save 
c = City.new(:name => 'Dona Ines', :zip_code => '58.228-000', :state => state); c.save 
c = City.new(:name => 'Duas Estradas', :zip_code => '58.265-000', :state => state); c.save 
c = City.new(:name => 'Emas', :zip_code => '58.763-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Avidos', :zip_code => '58.905-000', :state => state); c.save 
c = City.new(:name => 'Esperanca', :zip_code => '58.135-000', :state => state); c.save 
c = City.new(:name => 'Fagundes', :zip_code => '58.430-000', :state => state); c.save 
c = City.new(:name => 'Fatima', :zip_code => '58.936-000', :state => state); c.save 
c = City.new(:name => 'Frei Martinho', :zip_code => '58.195-000', :state => state); c.save 
c = City.new(:name => 'Gado Bravo', :zip_code => '58.405-000', :state => state); c.save 
c = City.new(:name => 'Galante', :zip_code => '58.110-000', :state => state); c.save 
c = City.new(:name => 'Guarabira', :zip_code => '58.200-000', :state => state); c.save 
c = City.new(:name => 'Guarita', :zip_code => '58.364-000', :state => state); c.save 
c = City.new(:name => 'Gurinhem', :zip_code => '58.356-000', :state => state); c.save 
c = City.new(:name => 'Gurjao', :zip_code => '58.670-000', :state => state); c.save 
c = City.new(:name => 'Ibiara', :zip_code => '58.980-000', :state => state); c.save 
c = City.new(:name => 'Imaculada', :zip_code => '58.745-000', :state => state); c.save 
c = City.new(:name => 'Inga', :zip_code => '58.380-000', :state => state); c.save 
c = City.new(:name => 'Itabaiana', :zip_code => '58.360-000', :state => state); c.save 
c = City.new(:name => 'Itajubatiba', :zip_code => '58.718-000', :state => state); c.save 
c = City.new(:name => 'Itaporanga', :zip_code => '58.780-000', :state => state); c.save 
c = City.new(:name => 'Itapororoca', :zip_code => '58.275-000', :state => state); c.save 
c = City.new(:name => 'Itatuba', :zip_code => '58.378-000', :state => state); c.save 
c = City.new(:name => 'Jacarau', :zip_code => '58.278-000', :state => state); c.save 
c = City.new(:name => 'Jerico', :zip_code => '58.830-000', :state => state); c.save 
c = City.new(:name => 'Joao Pessoa', :zip_code => '58.000-000', :state => state); c.save 
c = City.new(:name => 'Juarez Tavora', :zip_code => '58.387-000', :state => state); c.save 
c = City.new(:name => 'Juazeirinho', :zip_code => '58.660-000', :state => state); c.save 
c = City.new(:name => 'Junco Do Serido', :zip_code => '58.640-000', :state => state); c.save 
c = City.new(:name => 'Juripiranga', :zip_code => '58.330-000', :state => state); c.save 
c = City.new(:name => 'Juru', :zip_code => '58.750-000', :state => state); c.save 
c = City.new(:name => 'Lagoa', :zip_code => '58.835-000', :state => state); c.save 
c = City.new(:name => 'Lagoa De Dentro', :zip_code => '58.250-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Seca', :zip_code => '58.117-000', :state => state); c.save 
c = City.new(:name => 'Lastro', :zip_code => '58.820-000', :state => state); c.save 
c = City.new(:name => 'Livramento', :zip_code => '58.690-000', :state => state); c.save 
c = City.new(:name => 'Logradouro', :zip_code => '58.254-000', :state => state); c.save 
c = City.new(:name => 'Lucena', :zip_code => '58.315-000', :state => state); c.save 
c = City.new(:name => 'Mae Dagua', :zip_code => '58.740-000', :state => state); c.save 
c = City.new(:name => 'Maia', :zip_code => '58.222-000', :state => state); c.save 
c = City.new(:name => 'Malta', :zip_code => '58.713-000', :state => state); c.save 
c = City.new(:name => 'Mamanguape', :zip_code => '58.280-000', :state => state); c.save 
c = City.new(:name => 'Manaira', :zip_code => '58.995-000', :state => state); c.save 
c = City.new(:name => 'Marcacao', :zip_code => '58.294-000', :state => state); c.save 
c = City.new(:name => 'Mari', :zip_code => '58.345-000', :state => state); c.save 
c = City.new(:name => 'Marizopolis', :zip_code => '58.819-000', :state => state); c.save 
c = City.new(:name => 'Massaranduba', :zip_code => '58.120-000', :state => state); c.save 
c = City.new(:name => 'Mata Limpa', :zip_code => '58.373-000', :state => state); c.save 
c = City.new(:name => 'Mata Virgem', :zip_code => '58.425-000', :state => state); c.save 
c = City.new(:name => 'Mataraca', :zip_code => '58.292-000', :state => state); c.save 
c = City.new(:name => 'Matinhas', :zip_code => '58.128-000', :state => state); c.save 
c = City.new(:name => 'Matureia', :zip_code => '58.737-000', :state => state); c.save 
c = City.new(:name => 'Melo', :zip_code => '58.176-000', :state => state); c.save 
c = City.new(:name => 'Mogeiro', :zip_code => '58.375-000', :state => state); c.save 
c = City.new(:name => 'Montadas', :zip_code => '58.145-000', :state => state); c.save 
c = City.new(:name => 'Monte Horebe', :zip_code => '58.950-000', :state => state); c.save 
c = City.new(:name => 'Monteiro', :zip_code => '58.500-000', :state => state); c.save 
c = City.new(:name => 'Montevideo', :zip_code => '58.975-000', :state => state); c.save 
c = City.new(:name => 'Mulungu', :zip_code => '58.354-000', :state => state); c.save 
c = City.new(:name => 'Muquem', :zip_code => '58.374-000', :state => state); c.save 
c = City.new(:name => 'Natuba', :zip_code => '58.410-000', :state => state); c.save 
c = City.new(:name => 'Nazare', :zip_code => '58.152-000', :state => state); c.save 
c = City.new(:name => 'Nazarezinho', :zip_code => '58.817-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Livramento', :zip_code => '58.304-000', :state => state); c.save 
c = City.new(:name => 'Nova Floresta', :zip_code => '58.178-000', :state => state); c.save 
c = City.new(:name => 'Nova Olinda', :zip_code => '58.798-000', :state => state); c.save 
c = City.new(:name => 'Nova Palmeira', :zip_code => '58.184-000', :state => state); c.save 
c = City.new(:name => 'Olho Dagua', :zip_code => '58.760-000', :state => state); c.save 
c = City.new(:name => 'Olivedos', :zip_code => '58.160-000', :state => state); c.save 
c = City.new(:name => 'Ouro Velho', :zip_code => '58.560-000', :state => state); c.save 
c = City.new(:name => 'Parari', :zip_code => '58.575-000', :state => state); c.save 
c = City.new(:name => 'Passagem', :zip_code => '58.734-000', :state => state); c.save 
c = City.new(:name => 'Patos', :zip_code => '58.700-000', :state => state); c.save 
c = City.new(:name => 'Paulista', :zip_code => '58.860-000', :state => state); c.save 
c = City.new(:name => 'Pedra Branca', :zip_code => '58.790-000', :state => state); c.save 
c = City.new(:name => 'Pedra Lavrada', :zip_code => '58.180-000', :state => state); c.save 
c = City.new(:name => 'Pedras De Fogo', :zip_code => '58.328-000', :state => state); c.save 
c = City.new(:name => 'Pelo Sinal', :zip_code => '58.996-000', :state => state); c.save 
c = City.new(:name => 'Pianco', :zip_code => '58.765-000', :state => state); c.save 
c = City.new(:name => 'Picui', :zip_code => '58.187-000', :state => state); c.save 
c = City.new(:name => 'Pilar', :zip_code => '58.338-000', :state => state); c.save 
c = City.new(:name => 'Piloes', :zip_code => '58.393-000', :state => state); c.save 
c = City.new(:name => 'Piloezinhos', :zip_code => '58.210-000', :state => state); c.save 
c = City.new(:name => 'Pindurao', :zip_code => '58.533-000', :state => state); c.save 
c = City.new(:name => 'Pio X', :zip_code => '58.545-000', :state => state); c.save 
c = City.new(:name => 'Piraua', :zip_code => '58.415-000', :state => state); c.save 
c = City.new(:name => 'Pirpirituba', :zip_code => '58.213-000', :state => state); c.save 
c = City.new(:name => 'Pitanga De Estrada', :zip_code => '58.286-000', :state => state); c.save 
c = City.new(:name => 'Pitimbu', :zip_code => '58.324-000', :state => state); c.save 
c = City.new(:name => 'Pocinhos', :zip_code => '58.150-000', :state => state); c.save 
c = City.new(:name => 'Poco De Jose De Moura', :zip_code => '58.908-000', :state => state); c.save 
c = City.new(:name => 'Poco Dantas', :zip_code => '58.933-000', :state => state); c.save 
c = City.new(:name => 'Pombal', :zip_code => '58.840-000', :state => state); c.save 
c = City.new(:name => 'Prata', :zip_code => '58.550-000', :state => state); c.save 
c = City.new(:name => 'Princesa Isabel', :zip_code => '58.755-000', :state => state); c.save 
c = City.new(:name => 'Puxinana', :zip_code => '58.115-000', :state => state); c.save 
c = City.new(:name => 'Queimadas', :zip_code => '58.440-000', :state => state); c.save 
c = City.new(:name => 'Quixaba', :zip_code => '58.733-000', :state => state); c.save 
c = City.new(:name => 'Remigio', :zip_code => '58.398-000', :state => state); c.save 
c = City.new(:name => 'Assis Chateaubriand', :zip_code => '58.382-000', :state => state); c.save 
c = City.new(:name => 'Riacho De Santo Antonio', :zip_code => '58.465-000', :state => state); c.save 
c = City.new(:name => 'Riacho Dos Cavalos', :zip_code => '58.870-000', :state => state); c.save 
c = City.new(:name => 'Rio Tinto', :zip_code => '58.297-000', :state => state); c.save 
c = City.new(:name => 'Rua Nova', :zip_code => '58.257-000', :state => state); c.save 
c = City.new(:name => 'Salema', :zip_code => '58.298-000', :state => state); c.save 
c = City.new(:name => 'Salgadinho', :zip_code => '58.650-000', :state => state); c.save 
c = City.new(:name => 'Salgado De Sao Felix', :zip_code => '58.370-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz', :zip_code => '58.824-000', :state => state); c.save 
c = City.new(:name => 'Santa Gertrudes', :zip_code => '58.709-000', :state => state); c.save 
c = City.new(:name => 'Santa Helena', :zip_code => '58.925-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia', :zip_code => '58.600-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Cariri', :zip_code => '58.582-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '58.525-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '58.300-000', :state => state); c.save 
c = City.new(:name => 'Santa Teresinha', :zip_code => '58.720-000', :state => state); c.save 
c = City.new(:name => 'Santana De Mangueira', :zip_code => '58.985-000', :state => state); c.save 
c = City.new(:name => 'Santana Dos Garrotes', :zip_code => '58.795-000', :state => state); c.save 
c = City.new(:name => 'Santo Andre', :zip_code => '58.675-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento', :zip_code => '58.865-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Cariri', :zip_code => '58.485-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '58.818-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Cariri', :zip_code => '58.590-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Tigre', :zip_code => '58.520-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Brejo Do Cruz', :zip_code => '58.893-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Princesa', :zip_code => '58.758-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Lagoa Tapada', :zip_code => '58.815-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Mata', :zip_code => '58.113-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Caiana', :zip_code => '58.784-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Espinharas', :zip_code => '58.723-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Marimbas', :zip_code => '58.938-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Piranhas', :zip_code => '58.940-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Bonfim', :zip_code => '58.725-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Sabugi', :zip_code => '58.610-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Cordeiros', :zip_code => '58.570-000', :state => state); c.save 
c = City.new(:name => 'Sao Mamede', :zip_code => '58.625-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel De Taipu', :zip_code => '58.334-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao De Lagoa De Roca', :zip_code => '58.119-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Umbuzeiro', :zip_code => '58.510-000', :state => state); c.save 
c = City.new(:name => 'Serido/sao Vicente Do Serido', :zip_code => '58.158-000', :state => state); c.save 
c = City.new(:name => 'Sape', :zip_code => '58.340-000', :state => state); c.save 
c = City.new(:name => 'Serido', :zip_code => '58.159-000', :state => state); c.save 
c = City.new(:name => 'Serra Branca', :zip_code => '58.580-000', :state => state); c.save 
c = City.new(:name => 'Serra Da Raiz', :zip_code => '58.260-000', :state => state); c.save 
c = City.new(:name => 'Serra Grande', :zip_code => '58.955-000', :state => state); c.save 
c = City.new(:name => 'Serra Redonda', :zip_code => '58.385-000', :state => state); c.save 
c = City.new(:name => 'Serraria', :zip_code => '58.395-000', :state => state); c.save 
c = City.new(:name => 'Sertaozinho', :zip_code => '58.268-000', :state => state); c.save 
c = City.new(:name => 'Sobrado', :zip_code => '58.342-000', :state => state); c.save 
c = City.new(:name => 'Solanea', :zip_code => '58.225-000', :state => state); c.save 
c = City.new(:name => 'Soledade', :zip_code => '58.155-000', :state => state); c.save 
c = City.new(:name => 'Sossego', :zip_code => '58.177-000', :state => state); c.save 
c = City.new(:name => 'Sousa', :zip_code => '58.800-000', :state => state); c.save 
c = City.new(:name => 'Sucuru', :zip_code => '58.586-000', :state => state); c.save 
c = City.new(:name => 'Sume', :zip_code => '58.540-000', :state => state); c.save 
c = City.new(:name => 'Tacima', :zip_code => '58.240-000', :state => state); c.save 
c = City.new(:name => 'Tambau', :zip_code => '58.000-000', :state => state); c.save 
c = City.new(:name => 'Taperoa', :zip_code => '58.680-000', :state => state); c.save 
c = City.new(:name => 'Tavares', :zip_code => '58.753-000', :state => state); c.save 
c = City.new(:name => 'Teixeira', :zip_code => '58.735-000', :state => state); c.save 
c = City.new(:name => 'Tenorio', :zip_code => '58.665-000', :state => state); c.save 
c = City.new(:name => 'Triunfo', :zip_code => '58.920-000', :state => state); c.save 
c = City.new(:name => 'Uirauna', :zip_code => '58.915-000', :state => state); c.save 
c = City.new(:name => 'Umari', :zip_code => '58.913-000', :state => state); c.save 
c = City.new(:name => 'Umbuzeiro', :zip_code => '58.420-000', :state => state); c.save 
c = City.new(:name => 'Varzea', :zip_code => '58.620-000', :state => state); c.save 
c = City.new(:name => 'Varzea Comprida', :zip_code => '58.850-000', :state => state); c.save 
c = City.new(:name => 'Vazante', :zip_code => '58.997-000', :state => state); c.save 
c = City.new(:name => 'Vieiropolis', :zip_code => '58.822-000', :state => state); c.save 
c = City.new(:name => 'Zabele', :zip_code => '58.515-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '58.919-000', :state => state); c.save 
c = City.new(:name => 'Bernardino Batista', :zip_code => '58.922-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Bosco', :zip_code => '58.916-500', :state => state); c.save 
c = City.new(:name => 'Quixaba', :zip_code => '58.917-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Nova', :zip_code => '58.911-000', :state => state); c.save 
c = City.new(:name => 'Areias', :zip_code => '58.916-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo', :zip_code => '58.814-000', :state => state); c.save 
c = City.new(:name => 'Varzea Nova', :zip_code => '58.304-500', :state => state); c.save 
c = City.new(:name => 'Riachao', :zip_code => '58.235-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Camaratuba', :zip_code => '58.293-000', :state => state); c.save 
c = City.new(:name => 'Cupissura', :zip_code => '58.327-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Ramos', :zip_code => '58.339-000', :state => state); c.save 
c = City.new(:name => 'Santa Cecilia De Umbuzeiro', :zip_code => '58.428-000', :state => state); c.save 
c = City.new(:name => 'Casinha Do Homem', :zip_code => '58.826-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '58.828-000', :state => state); c.save 
c = City.new(:name => 'Lagoa De Dentro', :zip_code => '58.114-200', :state => state); c.save 
c = City.new(:name => 'Porteirinha De Pedra', :zip_code => '58.114-400', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '58.114-600', :state => state); c.save 
c = City.new(:name => 'Forte Velho', :zip_code => '58.304-300', :state => state); c.save 
c = City.new(:name => 'Lerolandia', :zip_code => '58.304-400', :state => state); c.save 
c = City.new(:name => 'Odilandia', :zip_code => '58.304-600', :state => state); c.save 
c = City.new(:name => 'Ribeira', :zip_code => '58.304-700', :state => state); c.save 
c = City.new(:name => 'Tambauzinho', :zip_code => '58.304-800', :state => state); c.save 
c = City.new(:name => 'Campo Alegre', :zip_code => '58.813-000', :state => state); c.save 
c = City.new(:name => 'Pereiros', :zip_code => '58.814-700', :state => state); c.save 
c = City.new(:name => 'Nucleo N 2', :zip_code => '58.814-500', :state => state); c.save 
c = City.new(:name => 'Nucleo N 3', :zip_code => '58.814-600', :state => state); c.save 
c = City.new(:name => 'Damiao', :zip_code => '58.173-000', :state => state); c.save 
c = City.new(:name => 'Casserengue', :zip_code => '58.238-000', :state => state); c.save 
c = City.new(:name => 'Pedro Regis', :zip_code => '58.273-000', :state => state); c.save 
c = City.new(:name => 'Riachao Do Poco', :zip_code => '58.348-000', :state => state); c.save 
c = City.new(:name => 'Cacimbas', :zip_code => '58.698-000', :state => state); c.save 
c = City.new(:name => 'Mato Grosso', :zip_code => '58.832-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento De Pombal', :zip_code => '58.857-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos De Pombal', :zip_code => '58.853-000', :state => state); c.save 
c = City.new(:name => 'Santarem', :zip_code => '58.928-000', :state => state); c.save 
c = City.new(:name => 'Santa Ines', :zip_code => '58.978-000', :state => state); c.save 

