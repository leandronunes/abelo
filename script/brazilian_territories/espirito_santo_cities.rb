#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Espírito Santo')
state ||= State.create!( :name => 'Espírito Santo', :code => 'ES', :country => country);

c = City.new(:name => 'Acioli', :zip_code => '29.687-000', :state => state); c.save 
c = City.new(:name => 'Afonso Claudio', :zip_code => '29.600-000', :state => state); c.save 
c = City.new(:name => 'Agha', :zip_code => '29.287-000', :state => state); c.save 
c = City.new(:name => 'Agua Doce Do Norte', :zip_code => '29.820-000', :state => state); c.save 
c = City.new(:name => 'Aguia Branca', :zip_code => '29.795-000', :state => state); c.save 
c = City.new(:name => 'Airituba', :zip_code => '29.477-000', :state => state); c.save 
c = City.new(:name => 'Alegre', :zip_code => '29.500-000', :state => state); c.save 
c = City.new(:name => 'Alfredo Chaves', :zip_code => '29.240-000', :state => state); c.save 
c = City.new(:name => 'Alto Calcado', :zip_code => '29.475-000', :state => state); c.save 
c = City.new(:name => 'Alto Mutum Preto', :zip_code => '29.737-000', :state => state); c.save 
c = City.new(:name => 'Alto Rio Novo', :zip_code => '29.760-000', :state => state); c.save 
c = City.new(:name => 'Alto Santa Maria', :zip_code => '29.662-000', :state => state); c.save 
c = City.new(:name => 'Anchieta', :zip_code => '29.230-000', :state => state); c.save 
c = City.new(:name => 'Angelo Frechiani', :zip_code => '29.722-000', :state => state); c.save 
c = City.new(:name => 'Anutiba', :zip_code => '29.530-000', :state => state); c.save 
c = City.new(:name => 'Apiaca', :zip_code => '29.450-000', :state => state); c.save 
c = City.new(:name => 'Aracatiba', :zip_code => '29.138-000', :state => state); c.save 
c = City.new(:name => 'Arace', :zip_code => '29.278-000', :state => state); c.save 
c = City.new(:name => 'Aracruz', :zip_code => '29.190-000', :state => state); c.save 
c = City.new(:name => 'Aracui', :zip_code => '29.365-000', :state => state); c.save 
c = City.new(:name => 'Araguaia', :zip_code => '29.258-000', :state => state); c.save 
c = City.new(:name => 'Ararai', :zip_code => '29.535-000', :state => state); c.save 
c = City.new(:name => 'Argolas', :zip_code => '29.100-000', :state => state); c.save 
c = City.new(:name => 'Atilio Vivacqua', :zip_code => '29.490-000', :state => state); c.save 
c = City.new(:name => 'Baixo Guandu', :zip_code => '29.730-000', :state => state); c.save 
c = City.new(:name => 'Barra De Sao Francisco', :zip_code => '29.800-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Itapemirim', :zip_code => '29.334-000', :state => state); c.save 
c = City.new(:name => 'Barra Nova', :zip_code => '29.932-000', :state => state); c.save 
c = City.new(:name => 'Baunilha', :zip_code => '29.712-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '29.845-000', :state => state); c.save 
c = City.new(:name => 'Boapaba', :zip_code => '29.710-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Norte', :zip_code => '29.460-000', :state => state); c.save 
c = City.new(:name => 'Brejetuba', :zip_code => '29.630-000', :state => state); c.save 
c = City.new(:name => 'Burarama', :zip_code => '29.327-000', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha De Itauna', :zip_code => '29.805-000', :state => state); c.save 
c = City.new(:name => 'Cachoeiro De Itapemirim', :zip_code => '29.300-000', :state => state); c.save 
c = City.new(:name => 'Cafe', :zip_code => '29.515-000', :state => state); c.save 
c = City.new(:name => 'Calogi', :zip_code => '29.184-000', :state => state); c.save 
c = City.new(:name => 'Camara', :zip_code => '29.485-000', :state => state); c.save 
c = City.new(:name => 'Carapina', :zip_code => '29.160-000', :state => state); c.save 
c = City.new(:name => 'Cariacica', :zip_code => '29.140-000', :state => state); c.save 
c = City.new(:name => 'Castelo', :zip_code => '29.360-000', :state => state); c.save 
c = City.new(:name => 'Celina', :zip_code => '29.510-000', :state => state); c.save 
c = City.new(:name => 'Colatina', :zip_code => '29.700-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Da Barra', :zip_code => '29.960-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Castelo', :zip_code => '29.370-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Muqui', :zip_code => '29.410-000', :state => state); c.save 
c = City.new(:name => 'Conduru', :zip_code => '29.329-000', :state => state); c.save 
c = City.new(:name => 'Coqueiral', :zip_code => '29.195-000', :state => state); c.save 
c = City.new(:name => 'Vila Pavao', :zip_code => '29.843-000', :state => state); c.save 
c = City.new(:name => 'Cotaxe', :zip_code => '29.855-000', :state => state); c.save 
c = City.new(:name => 'Crubixa', :zip_code => '29.242-000', :state => state); c.save 
c = City.new(:name => 'Desengano', :zip_code => '29.916-000', :state => state); c.save 
c = City.new(:name => 'Divino De Sao Lourenco', :zip_code => '29.590-000', :state => state); c.save 
c = City.new(:name => 'Djalma Coutinho', :zip_code => '29.642-000', :state => state); c.save 
c = City.new(:name => 'Domingos Martins', :zip_code => '29.260-000', :state => state); c.save 
c = City.new(:name => 'Dona America', :zip_code => '29.445-000', :state => state); c.save 
c = City.new(:name => 'Dores Do Rio Preto', :zip_code => '29.580-000', :state => state); c.save 
c = City.new(:name => 'Duas Barras', :zip_code => '29.283-000', :state => state); c.save 
c = City.new(:name => 'Ecoporanga', :zip_code => '29.850-000', :state => state); c.save 
c = City.new(:name => 'Fartura', :zip_code => '29.783-000', :state => state); c.save 
c = City.new(:name => 'Fundao', :zip_code => '29.185-000', :state => state); c.save 
c = City.new(:name => 'Garrafao', :zip_code => '29.649-000', :state => state); c.save 
c = City.new(:name => 'Goiabeiras', :zip_code => '29.000-000', :state => state); c.save 
c = City.new(:name => 'Governador Lacerda De Aguiar', :zip_code => '29.826-000', :state => state); c.save 
c = City.new(:name => 'Governador Lindenberg', :zip_code => '29.718-000', :state => state); c.save 
c = City.new(:name => 'Graca Aranha', :zip_code => '29.716-000', :state => state); c.save 
c = City.new(:name => 'Guacui', :zip_code => '29.560-000', :state => state); c.save 
c = City.new(:name => 'Guarana', :zip_code => '29.199-000', :state => state); c.save 
c = City.new(:name => 'Guarapari', :zip_code => '29.200-000', :state => state); c.save 
c = City.new(:name => 'Guararema', :zip_code => '29.842-000', :state => state); c.save 
c = City.new(:name => 'Ibatiba', :zip_code => '29.395-000', :state => state); c.save 
c = City.new(:name => 'Ibes', :zip_code => '29.100-000', :state => state); c.save 
c = City.new(:name => 'Ibicaba', :zip_code => '29.612-000', :state => state); c.save 
c = City.new(:name => 'Ibiracu', :zip_code => '29.670-000', :state => state); c.save 
c = City.new(:name => 'Ibitirama', :zip_code => '29.540-000', :state => state); c.save 
c = City.new(:name => 'Ibitirui', :zip_code => '29.244-000', :state => state); c.save 
c = City.new(:name => 'Ibituba', :zip_code => '29.740-000', :state => state); c.save 
c = City.new(:name => 'Iconha', :zip_code => '29.280-000', :state => state); c.save 
c = City.new(:name => 'Imburana', :zip_code => '29.853-000', :state => state); c.save 
c = City.new(:name => 'Iriritiba', :zip_code => '29.238-000', :state => state); c.save 
c = City.new(:name => 'Irundi', :zip_code => '29.189-000', :state => state); c.save 
c = City.new(:name => 'Irupi', :zip_code => '29.398-000', :state => state); c.save 
c = City.new(:name => 'Isabel', :zip_code => '29.263-000', :state => state); c.save 
c = City.new(:name => 'Itacu', :zip_code => '29.697-000', :state => state); c.save 
c = City.new(:name => 'Itaguacu', :zip_code => '29.690-000', :state => state); c.save 
c = City.new(:name => 'Itaici', :zip_code => '29.388-000', :state => state); c.save 
c = City.new(:name => 'Itaimbe', :zip_code => '29.695-000', :state => state); c.save 
c = City.new(:name => 'Itaoca', :zip_code => '29.325-000', :state => state); c.save 
c = City.new(:name => 'Itapecoa', :zip_code => '29.335-000', :state => state); c.save 
c = City.new(:name => 'Itapemirim', :zip_code => '29.330-000', :state => state); c.save 
c = City.new(:name => 'Itaperuna', :zip_code => '29.812-000', :state => state); c.save 
c = City.new(:name => 'Itapina', :zip_code => '29.714-000', :state => state); c.save 
c = City.new(:name => 'Itaquari', :zip_code => '29.140-000', :state => state); c.save 
c = City.new(:name => 'Itarana', :zip_code => '29.620-000', :state => state); c.save 
c = City.new(:name => 'Itaunas', :zip_code => '29.965-000', :state => state); c.save 
c = City.new(:name => 'Itauninhas', :zip_code => '29.944-000', :state => state); c.save 
c = City.new(:name => 'Iuna', :zip_code => '29.390-000', :state => state); c.save 
c = City.new(:name => 'Jabaquara', :zip_code => '29.236-000', :state => state); c.save 
c = City.new(:name => 'Jacaraipe', :zip_code => '29.160-000', :state => state); c.save 
c = City.new(:name => 'Jacigua', :zip_code => '29.297-000', :state => state); c.save 
c = City.new(:name => 'Jaguare', :zip_code => '29.950-000', :state => state); c.save 
c = City.new(:name => 'Jeronimo Monteiro', :zip_code => '29.550-000', :state => state); c.save 
c = City.new(:name => 'Joacuba', :zip_code => '29.860-000', :state => state); c.save 
c = City.new(:name => 'Joao Neiva', :zip_code => '29.680-000', :state => state); c.save 
c = City.new(:name => 'Joatuba', :zip_code => '29.617-000', :state => state); c.save 
c = City.new(:name => 'Jose Carlos', :zip_code => '29.455-000', :state => state); c.save 
c = City.new(:name => 'Jucu', :zip_code => '29.100-000', :state => state); c.save 
c = City.new(:name => 'Lajinha', :zip_code => '29.755-000', :state => state); c.save 
c = City.new(:name => 'Laranja Da Terra', :zip_code => '29.615-000', :state => state); c.save 
c = City.new(:name => 'Linhares', :zip_code => '29.900-000', :state => state); c.save 
c = City.new(:name => 'Mangarai', :zip_code => '29.644-000', :state => state); c.save 
c = City.new(:name => 'Mantenopolis', :zip_code => '29.770-000', :state => state); c.save 
c = City.new(:name => 'Marataizes', :zip_code => '29.345-000', :state => state); c.save 
c = City.new(:name => 'Marechal Floriano', :zip_code => '29.255-000', :state => state); c.save 
c = City.new(:name => 'Marilandia', :zip_code => '29.725-000', :state => state); c.save 
c = City.new(:name => 'Matilde', :zip_code => '29.248-000', :state => state); c.save 
c = City.new(:name => 'Melgaco', :zip_code => '29.276-000', :state => state); c.save 
c = City.new(:name => 'Menino Jesus', :zip_code => '29.384-000', :state => state); c.save 
c = City.new(:name => 'Mimoso Do Sul', :zip_code => '29.400-000', :state => state); c.save 
c = City.new(:name => 'Montanha', :zip_code => '29.890-000', :state => state); c.save 
c = City.new(:name => 'Monte Sinai', :zip_code => '29.807-000', :state => state); c.save 
c = City.new(:name => 'Mucurici', :zip_code => '29.880-000', :state => state); c.save 
c = City.new(:name => 'Muniz Freire', :zip_code => '29.380-000', :state => state); c.save 
c = City.new(:name => 'Muqui', :zip_code => '29.480-000', :state => state); c.save 
c = City.new(:name => 'Nestor Gomes', :zip_code => '29.942-000', :state => state); c.save 
c = City.new(:name => 'Nova Almeida', :zip_code => '29.160-000', :state => state); c.save 
c = City.new(:name => 'Nova Venecia', :zip_code => '29.830-000', :state => state); c.save 
c = City.new(:name => 'Nova Verona', :zip_code => '29.940-000', :state => state); c.save 
c = City.new(:name => 'Novo Brasil', :zip_code => '29.720-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '29.852-000', :state => state); c.save 
c = City.new(:name => 'Pacotuba', :zip_code => '29.323-000', :state => state); c.save 
c = City.new(:name => 'Paineiras', :zip_code => '29.342-000', :state => state); c.save 
c = City.new(:name => 'Palmerino', :zip_code => '29.764-000', :state => state); c.save 
c = City.new(:name => 'Pancas', :zip_code => '29.750-000', :state => state); c.save 
c = City.new(:name => 'Paraju', :zip_code => '29.273-000', :state => state); c.save 
c = City.new(:name => 'Paulista', :zip_code => '29.815-000', :state => state); c.save 
c = City.new(:name => 'Pedro Canario', :zip_code => '29.970-000', :state => state); c.save 
c = City.new(:name => 'Pendanga', :zip_code => '29.675-000', :state => state); c.save 
c = City.new(:name => 'Pequia', :zip_code => '29.392-000', :state => state); c.save 
c = City.new(:name => 'Piacu', :zip_code => '29.386-000', :state => state); c.save 
c = City.new(:name => 'Pinheiros', :zip_code => '29.980-000', :state => state); c.save 
c = City.new(:name => 'Piracema', :zip_code => '29.607-000', :state => state); c.save 
c = City.new(:name => 'Piuma', :zip_code => '29.285-000', :state => state); c.save 
c = City.new(:name => 'Ponte De Itabapoana', :zip_code => '29.440-000', :state => state); c.save 
c = City.new(:name => 'Pontoes', :zip_code => '29.604-000', :state => state); c.save 
c = City.new(:name => 'Poranga', :zip_code => '29.817-000', :state => state); c.save 
c = City.new(:name => 'Presidente Kennedy', :zip_code => '29.350-000', :state => state); c.save 
c = City.new(:name => 'Princesa', :zip_code => '29.293-000', :state => state); c.save 
c = City.new(:name => 'Queimado', :zip_code => '29.183-000', :state => state); c.save 
c = City.new(:name => 'Quilometro 14 Do Mutum', :zip_code => '29.735-000', :state => state); c.save 
c = City.new(:name => 'Regencia', :zip_code => '29.914-000', :state => state); c.save 
c = City.new(:name => 'Riacho', :zip_code => '29.198-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Do Cristo', :zip_code => '29.250-000', :state => state); c.save 
c = City.new(:name => 'Rio Bananal', :zip_code => '29.920-000', :state => state); c.save 
c = City.new(:name => 'Rio Calcado', :zip_code => '29.226-000', :state => state); c.save 
c = City.new(:name => 'Rio Muqui', :zip_code => '29.340-000', :state => state); c.save 
c = City.new(:name => 'Rio Novo Do Sul', :zip_code => '29.290-000', :state => state); c.save 
c = City.new(:name => 'Rio Preto', :zip_code => '29.841-000', :state => state); c.save 
c = City.new(:name => 'Rive', :zip_code => '29.520-000', :state => state); c.save 
c = City.new(:name => 'Sagrada Familia', :zip_code => '29.253-000', :state => state); c.save 
c = City.new(:name => 'Santa Angelica', :zip_code => '29.525-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz', :zip_code => '29.196-000', :state => state); c.save 
c = City.new(:name => 'Santa Julia', :zip_code => '29.669-000', :state => state); c.save 
c = City.new(:name => 'Santa Leopoldina', :zip_code => '29.640-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia De Mantenopolis', :zip_code => '29.772-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Norte', :zip_code => '29.856-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria De Jetiba', :zip_code => '29.645-000', :state => state); c.save 
c = City.new(:name => 'Santa Marta', :zip_code => '29.545-000', :state => state); c.save 
c = City.new(:name => 'Santa Teresa', :zip_code => '29.650-000', :state => state); c.save 
c = City.new(:name => 'Santissima Trindade', :zip_code => '29.393-000', :state => state); c.save 
c = City.new(:name => 'Santo Agostinho', :zip_code => '29.824-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '29.810-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Muqui', :zip_code => '29.407-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Norte', :zip_code => '29.745-000', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel Da Palha', :zip_code => '29.780-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo', :zip_code => '29.776-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Petropolis', :zip_code => '29.660-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Sobrado', :zip_code => '29.985-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Das Torres', :zip_code => '29.420-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Calcado', :zip_code => '29.470-000', :state => state); c.save 
c = City.new(:name => 'Sao Mateus', :zip_code => '29.930-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro De Itabapoana', :zip_code => '29.405-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro De Rates', :zip_code => '29.564-000', :state => state); c.save 
c = City.new(:name => 'Sao Rafael', :zip_code => '29.918-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque Do Cannaa', :zip_code => '29.665-000', :state => state); c.save 
c = City.new(:name => 'Sao Tiago', :zip_code => '29.562-000', :state => state); c.save 
c = City.new(:name => 'Sao Torquato', :zip_code => '29.100-000', :state => state); c.save 
c = City.new(:name => 'Sapucaia', :zip_code => '29.728-000', :state => state); c.save 
c = City.new(:name => 'Serra', :zip_code => '29.160-000', :state => state); c.save 
c = City.new(:name => 'Serra Pelada', :zip_code => '29.603-000', :state => state); c.save 
c = City.new(:name => 'Sobreiro', :zip_code => '29.619-000', :state => state); c.save 
c = City.new(:name => 'Timbui', :zip_code => '29.188-000', :state => state); c.save 
c = City.new(:name => 'Todos Os Santos', :zip_code => '29.228-000', :state => state); c.save 
c = City.new(:name => 'Urania', :zip_code => '29.246-000', :state => state); c.save 
c = City.new(:name => 'Vila Valerio', :zip_code => '29.785-000', :state => state); c.save 
c = City.new(:name => 'Vargem Alta', :zip_code => '29.295-000', :state => state); c.save 
c = City.new(:name => 'Vargem Grande Do Soturno', :zip_code => '29.321-000', :state => state); c.save 
c = City.new(:name => 'Venda Nova Do Imigrante', :zip_code => '29.375-000', :state => state); c.save 
c = City.new(:name => 'Viana', :zip_code => '29.135-000', :state => state); c.save 
c = City.new(:name => 'Vieira Machado', :zip_code => '29.383-000', :state => state); c.save 
c = City.new(:name => 'Vila Nelita', :zip_code => '29.822-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova De Bananal', :zip_code => '29.742-000', :state => state); c.save 
c = City.new(:name => 'Vila Velha', :zip_code => '29.100-000', :state => state); c.save 
c = City.new(:name => 'Vila Verde', :zip_code => '29.752-000', :state => state); c.save 
c = City.new(:name => 'Vinhatico', :zip_code => '29.894-000', :state => state); c.save 
c = City.new(:name => 'Vinte E Cinco De Julho', :zip_code => '29.652-000', :state => state); c.save 
c = City.new(:name => 'Vitoria', :zip_code => '29.000-000', :state => state); c.save 
c = City.new(:name => 'Porto Barra Do Riacho', :zip_code => '29.197-000', :state => state); c.save 
c = City.new(:name => 'Praia Grande', :zip_code => '29.187-000', :state => state); c.save 
c = City.new(:name => 'Barra Seca', :zip_code => '29.954-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Guandu', :zip_code => '29.609-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Azul', :zip_code => '29.823-000', :state => state); c.save 
c = City.new(:name => 'Monte Carmelo Do Rio Novo', :zip_code => '29.767-000', :state => state); c.save 
c = City.new(:name => 'Jacupemba', :zip_code => '29.193-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Pousalegre', :zip_code => '29.848-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Sobradinho', :zip_code => '29.847-000', :state => state); c.save 
c = City.new(:name => 'Gironda', :zip_code => '29.326-000', :state => state); c.save 
c = City.new(:name => 'Estrela Do Norte', :zip_code => '29.367-000', :state => state); c.save 
c = City.new(:name => 'Braco Do Rio', :zip_code => '29.967-000', :state => state); c.save 
c = City.new(:name => 'Mundo Novo', :zip_code => '29.585-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '29.875-000', :state => state); c.save 
c = City.new(:name => 'Itaipava', :zip_code => '29.338-000', :state => state); c.save 
c = City.new(:name => 'Nova Canaa', :zip_code => '29.333-000', :state => state); c.save 
c = City.new(:name => 'Perdicao', :zip_code => '29.394-000', :state => state); c.save 
c = City.new(:name => 'Bebedouro', :zip_code => '29.915-000', :state => state); c.save 
c = City.new(:name => 'Sooretama', :zip_code => '29.927-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge Da Barra Seca', :zip_code => '29.919-000', :state => state); c.save 
c = City.new(:name => 'Itabaiana', :zip_code => '29.884-000', :state => state); c.save 
c = City.new(:name => 'Itamira', :zip_code => '29.889-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Quinze', :zip_code => '29.839-000', :state => state); c.save 
c = City.new(:name => 'Cristal Do Norte', :zip_code => '29.978-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge Do Tiradentes', :zip_code => '29.925-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Canaa', :zip_code => '29.654-000', :state => state); c.save 
c = City.new(:name => 'Sao Jacinto', :zip_code => '29.667-000', :state => state); c.save 
c = City.new(:name => 'Alto Caldeirao', :zip_code => '29.656-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Vicosa', :zip_code => '29.378-000', :state => state); c.save 
c = City.new(:name => 'Barra De Novo Brasil', :zip_code => '29.723-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Novo Brasil', :zip_code => '29.721-000', :state => state); c.save 
c = City.new(:name => 'Baia Nova', :zip_code => '29.227-000', :state => state); c.save 
c = City.new(:name => 'Limoeiro', :zip_code => '29.369-000', :state => state); c.save 
c = City.new(:name => 'Monte Pio', :zip_code => '29.368-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Mantenopolis', :zip_code => '29.778-000', :state => state); c.save 
c = City.new(:name => 'Ponto Belo', :zip_code => '29.885-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '29.389-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Xavier Do Guandu', :zip_code => '29.613-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge Do Oliveira', :zip_code => '29.635-000', :state => state); c.save 
c = City.new(:name => 'Bonsucesso', :zip_code => '29.458-000', :state => state); c.save 
c = City.new(:name => 'Corrego Dos Monos', :zip_code => '29.328-000', :state => state); c.save 
c = City.new(:name => 'Gruta', :zip_code => '29.324-000', :state => state); c.save 
c = City.new(:name => 'Divino Espirito Santo', :zip_code => '29.479-000', :state => state); c.save 

