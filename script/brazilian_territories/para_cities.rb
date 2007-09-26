#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Pará')
state ||= State.create!( :name => 'Pará', :code => 'PA', :country => country);

c = City.new(:name => 'Abaetetuba', :zip_code => '68.440-000', :state => state); c.save 
c = City.new(:name => 'Abel Figueiredo', :zip_code => '68.527-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Acangata', :zip_code => '68.482-000', :state => state); c.save 
c = City.new(:name => 'Acara', :zip_code => '68.690-000', :state => state); c.save 
c = City.new(:name => 'Afua', :zip_code => '68.890-000', :state => state); c.save 
c = City.new(:name => 'Uruara', :zip_code => '68.140-000', :state => state); c.save 
c = City.new(:name => 'Alenquer', :zip_code => '68.200-000', :state => state); c.save 
c = City.new(:name => 'Algodoal', :zip_code => '68.712-000', :state => state); c.save 
c = City.new(:name => 'Almeirim', :zip_code => '68.230-000', :state => state); c.save 
c = City.new(:name => 'Almoco', :zip_code => '68.608-000', :state => state); c.save 
c = City.new(:name => 'Altamira', :zip_code => '68.370-000', :state => state); c.save 
c = City.new(:name => 'Alter Do Chao', :zip_code => '68.109-000', :state => state); c.save 
c = City.new(:name => 'Americano', :zip_code => '68.792-000', :state => state); c.save 
c = City.new(:name => 'Anajas', :zip_code => '68.810-000', :state => state); c.save 
c = City.new(:name => 'Ananindeua', :zip_code => '67.000-000', :state => state); c.save 
c = City.new(:name => 'Antonio Lemos', :zip_code => '68.803-000', :state => state); c.save 
c = City.new(:name => 'Apeu', :zip_code => '68.747-000', :state => state); c.save 
c = City.new(:name => 'Apinages', :zip_code => '68.519-000', :state => state); c.save 
c = City.new(:name => 'Arapixuna', :zip_code => '68.128-000', :state => state); c.save 
c = City.new(:name => 'Araquaim', :zip_code => '68.752-000', :state => state); c.save 
c = City.new(:name => 'Areias', :zip_code => '68.495-000', :state => state); c.save 
c = City.new(:name => 'Arumanduba', :zip_code => '68.235-000', :state => state); c.save 
c = City.new(:name => 'Aturiai', :zip_code => '68.612-000', :state => state); c.save 
c = City.new(:name => 'Augusto Correa', :zip_code => '68.610-000', :state => state); c.save 
c = City.new(:name => 'Aveiro', :zip_code => '68.150-000', :state => state); c.save 
c = City.new(:name => 'Bagre', :zip_code => '68.475-000', :state => state); c.save 
c = City.new(:name => 'Baiao', :zip_code => '68.465-000', :state => state); c.save 
c = City.new(:name => 'Barcarena', :zip_code => '68.445-000', :state => state); c.save 
c = City.new(:name => 'Barreira Branca', :zip_code => '68.568-000', :state => state); c.save 
c = City.new(:name => 'Barreira Dos Campos', :zip_code => '68.562-000', :state => state); c.save 
c = City.new(:name => 'Beja', :zip_code => '68.444-000', :state => state); c.save 
c = City.new(:name => 'Belem', :zip_code => '66.000-000', :state => state); c.save 
c = City.new(:name => 'Belterra', :zip_code => '68.143-000', :state => state); c.save 
c = City.new(:name => 'Benevides', :zip_code => '68.795-000', :state => state); c.save 
c = City.new(:name => 'Benfica', :zip_code => '68.797-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '68.718-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Iririteua', :zip_code => '68.751-000', :state => state); c.save 
c = City.new(:name => 'Boim', :zip_code => '68.115-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim', :zip_code => '68.713-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Tocantins', :zip_code => '68.525-000', :state => state); c.save 
c = City.new(:name => 'Bonito', :zip_code => '68.645-000', :state => state); c.save 
c = City.new(:name => 'Braganca', :zip_code => '68.600-000', :state => state); c.save 
c = City.new(:name => 'Brasil Novo', :zip_code => '68.148-000', :state => state); c.save 
c = City.new(:name => 'Brasilia Legal', :zip_code => '68.160-000', :state => state); c.save 
c = City.new(:name => 'Brejo Grande Do Araguaia', :zip_code => '68.521-000', :state => state); c.save 
c = City.new(:name => 'Breves', :zip_code => '68.800-000', :state => state); c.save 
c = City.new(:name => 'Bujaru', :zip_code => '68.670-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Arari', :zip_code => '68.840-000', :state => state); c.save 
c = City.new(:name => 'Cafezal', :zip_code => '68.723-000', :state => state); c.save 
c = City.new(:name => 'Cairari', :zip_code => '68.453-000', :state => state); c.save 
c = City.new(:name => 'Caju', :zip_code => '68.661-000', :state => state); c.save 
c = City.new(:name => 'Camara Do Marajo', :zip_code => '68.845-000', :state => state); c.save 
c = City.new(:name => 'Cameta', :zip_code => '68.400-000', :state => state); c.save 
c = City.new(:name => 'Camiranga', :zip_code => '68.624-000', :state => state); c.save 
c = City.new(:name => 'Capanema', :zip_code => '68.700-000', :state => state); c.save 
c = City.new(:name => 'Capitao Poco', :zip_code => '68.650-000', :state => state); c.save 
c = City.new(:name => 'Caracara Do Arari', :zip_code => '68.848-000', :state => state); c.save 
c = City.new(:name => 'Carajas', :zip_code => '68.516-000', :state => state); c.save 
c = City.new(:name => 'Carapajo', :zip_code => '68.404-000', :state => state); c.save 
c = City.new(:name => 'Caraparu', :zip_code => '68.791-000', :state => state); c.save 
c = City.new(:name => 'Caratateua', :zip_code => '68.609-000', :state => state); c.save 
c = City.new(:name => 'Caripi', :zip_code => '68.726-000', :state => state); c.save 
c = City.new(:name => 'Carrazedo', :zip_code => '68.310-000', :state => state); c.save 
c = City.new(:name => 'Castanhal', :zip_code => '68.740-000', :state => state); c.save 
c = City.new(:name => 'Chaves', :zip_code => '68.880-000', :state => state); c.save 
c = City.new(:name => 'Colares', :zip_code => '68.785-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Araguaia', :zip_code => '68.540-000', :state => state); c.save 
c = City.new(:name => 'Concordia Do Para', :zip_code => '68.685-000', :state => state); c.save 
c = City.new(:name => 'Condeixa', :zip_code => '68.862-000', :state => state); c.save 
c = City.new(:name => 'Coqueiro', :zip_code => '67.000-000', :state => state); c.save 
c = City.new(:name => 'Cumaru Do Norte', :zip_code => '68.398-000', :state => state); c.save 
c = City.new(:name => 'Curionopolis', :zip_code => '68.523-000', :state => state); c.save 
c = City.new(:name => 'Curralinho', :zip_code => '68.815-000', :state => state); c.save 
c = City.new(:name => 'Curua', :zip_code => '68.210-000', :state => state); c.save 
c = City.new(:name => 'Curuai', :zip_code => '68.125-000', :state => state); c.save 
c = City.new(:name => 'Curuca', :zip_code => '68.750-000', :state => state); c.save 
c = City.new(:name => 'Curucambaba', :zip_code => '68.406-000', :state => state); c.save 
c = City.new(:name => 'Curumu', :zip_code => '68.805-000', :state => state); c.save 
c = City.new(:name => 'Eldorado Dos Carajas', :zip_code => '68.524-000', :state => state); c.save 
c = City.new(:name => 'Emborai', :zip_code => '68.614-000', :state => state); c.save 
c = City.new(:name => 'Espirito Santo Do Taua', :zip_code => '68.787-000', :state => state); c.save 
c = City.new(:name => 'Faro', :zip_code => '68.280-000', :state => state); c.save 
c = City.new(:name => 'Fernandes Belo', :zip_code => '68.622-000', :state => state); c.save 
c = City.new(:name => 'Flexal', :zip_code => '68.260-000', :state => state); c.save 
c = City.new(:name => 'Garrafao Do Norte', :zip_code => '68.665-000', :state => state); c.save 
c = City.new(:name => 'Goianesia Do Para', :zip_code => '68.639-000', :state => state); c.save 
c = City.new(:name => 'Gradaus', :zip_code => '68.394-000', :state => state); c.save 
c = City.new(:name => 'Guajara-acu', :zip_code => '68.672-000', :state => state); c.save 
c = City.new(:name => 'Guajara-miri', :zip_code => '68.692-000', :state => state); c.save 
c = City.new(:name => 'Gurupa', :zip_code => '68.300-000', :state => state); c.save 
c = City.new(:name => 'Hidreletrica Tucurui', :zip_code => '68.464-000', :state => state); c.save 
c = City.new(:name => 'Icoraci', :zip_code => '66.000-000', :state => state); c.save 
c = City.new(:name => 'Igarape-acu', :zip_code => '68.725-000', :state => state); c.save 
c = City.new(:name => 'Igarape-miri', :zip_code => '68.430-000', :state => state); c.save 
c = City.new(:name => 'Inhangapi', :zip_code => '68.770-000', :state => state); c.save 
c = City.new(:name => 'Ipixuna Do Para', :zip_code => '68.637-000', :state => state); c.save 
c = City.new(:name => 'Irituia', :zip_code => '68.655-000', :state => state); c.save 
c = City.new(:name => 'Itaituba', :zip_code => '68.180-000', :state => state); c.save 
c = City.new(:name => 'Itapixuna', :zip_code => '68.615-000', :state => state); c.save 
c = City.new(:name => 'Itatupa', :zip_code => '68.320-000', :state => state); c.save 
c = City.new(:name => 'Itupiranga', :zip_code => '68.580-000', :state => state); c.save 
c = City.new(:name => 'Jacareacanga', :zip_code => '68.195-000', :state => state); c.save 
c = City.new(:name => 'Jacunda', :zip_code => '68.590-000', :state => state); c.save 
c = City.new(:name => 'Jaguarari', :zip_code => '68.693-000', :state => state); c.save 
c = City.new(:name => 'Jambuacu', :zip_code => '68.749-000', :state => state); c.save 
c = City.new(:name => 'Jandiai', :zip_code => '68.772-000', :state => state); c.save 
c = City.new(:name => 'Japerica', :zip_code => '68.708-000', :state => state); c.save 
c = City.new(:name => 'Joana Coeli', :zip_code => '68.412-000', :state => state); c.save 
c = City.new(:name => 'Joana Peres', :zip_code => '68.468-000', :state => state); c.save 
c = City.new(:name => 'Joanes', :zip_code => '68.864-000', :state => state); c.save 
c = City.new(:name => 'Juaba', :zip_code => '68.402-000', :state => state); c.save 
c = City.new(:name => 'Jubim', :zip_code => '68.866-000', :state => state); c.save 
c = City.new(:name => 'Juruti', :zip_code => '68.170-000', :state => state); c.save 
c = City.new(:name => 'Km 19', :zip_code => '68.714-000', :state => state); c.save 
c = City.new(:name => 'Km 26', :zip_code => '68.715-000', :state => state); c.save 
c = City.new(:name => 'Lauro Sodre', :zip_code => '68.753-000', :state => state); c.save 
c = City.new(:name => 'Limoeiro Do Ajuru', :zip_code => '68.415-000', :state => state); c.save 
c = City.new(:name => 'Magalhaes Barata', :zip_code => '68.722-000', :state => state); c.save 
c = City.new(:name => 'Maiauata', :zip_code => '68.435-000', :state => state); c.save 
c = City.new(:name => 'Manjeiro', :zip_code => '68.425-000', :state => state); c.save 
c = City.new(:name => 'Maraba', :zip_code => '68.500-000', :state => state); c.save 
c = City.new(:name => 'Maracana', :zip_code => '68.710-000', :state => state); c.save 
c = City.new(:name => 'Marapanim', :zip_code => '68.760-000', :state => state); c.save 
c = City.new(:name => 'Marituba', :zip_code => '67.200-000', :state => state); c.save 
c = City.new(:name => 'Maruda', :zip_code => '68.768-000', :state => state); c.save 
c = City.new(:name => 'Matapiquara', :zip_code => '68.762-000', :state => state); c.save 
c = City.new(:name => 'Melgaco', :zip_code => '68.490-000', :state => state); c.save 
c = City.new(:name => 'Menino Deus Do Anapu', :zip_code => '68.433-000', :state => state); c.save 
c = City.new(:name => 'Meruu', :zip_code => '68.438-000', :state => state); c.save 
c = City.new(:name => 'Mirasselvas', :zip_code => '68.706-000', :state => state); c.save 
c = City.new(:name => 'Mocajuba', :zip_code => '68.420-000', :state => state); c.save 
c = City.new(:name => 'Moiraba', :zip_code => '68.408-000', :state => state); c.save 
c = City.new(:name => 'Moju', :zip_code => '68.450-000', :state => state); c.save 
c = City.new(:name => 'Monsaras', :zip_code => '68.868-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre', :zip_code => '68.220-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre Do Mau', :zip_code => '68.764-000', :state => state); c.save 
c = City.new(:name => 'Monte Dourado', :zip_code => '68.240-000', :state => state); c.save 
c = City.new(:name => 'Mosqueiro', :zip_code => '66.000-000', :state => state); c.save 
c = City.new(:name => 'Muana', :zip_code => '68.825-000', :state => state); c.save 
c = City.new(:name => 'Mujui Dos Campos', :zip_code => '68.120-000', :state => state); c.save 
c = City.new(:name => 'Muraja', :zip_code => '68.754-000', :state => state); c.save 
c = City.new(:name => 'Murucupi', :zip_code => '68.448-000', :state => state); c.save 
c = City.new(:name => 'Muta', :zip_code => '68.835-000', :state => state); c.save 
c = City.new(:name => 'Mutucal', :zip_code => '68.755-000', :state => state); c.save 
c = City.new(:name => 'Nazare De Mocajuba', :zip_code => '68.756-000', :state => state); c.save 
c = City.new(:name => 'Nova Mocajuba', :zip_code => '68.604-000', :state => state); c.save 
c = City.new(:name => 'Nova Timboteua', :zip_code => '68.730-000', :state => state); c.save 
c = City.new(:name => 'Obidos', :zip_code => '68.250-000', :state => state); c.save 
c = City.new(:name => 'Oeiras Do Para', :zip_code => '68.470-000', :state => state); c.save 
c = City.new(:name => 'Oriximina', :zip_code => '68.270-000', :state => state); c.save 
c = City.new(:name => 'Ourem', :zip_code => '68.640-000', :state => state); c.save 
c = City.new(:name => 'Ourilandia Do Norte', :zip_code => '68.390-000', :state => state); c.save 
c = City.new(:name => 'Pacaja', :zip_code => '68.485-000', :state => state); c.save 
c = City.new(:name => 'Pacoval', :zip_code => '68.135-000', :state => state); c.save 
c = City.new(:name => 'Paragominas', :zip_code => '68.625-000', :state => state); c.save 
c = City.new(:name => 'Pedreira', :zip_code => '68.478-000', :state => state); c.save 
c = City.new(:name => 'Peixe-boi', :zip_code => '68.734-000', :state => state); c.save 
c = City.new(:name => 'Penhalonga', :zip_code => '68.781-000', :state => state); c.save 
c = City.new(:name => 'Perseveranca', :zip_code => '68.776-000', :state => state); c.save 
c = City.new(:name => 'Pesqueiro', :zip_code => '68.875-000', :state => state); c.save 
c = City.new(:name => 'Piabas', :zip_code => '68.607-000', :state => state); c.save 
c = City.new(:name => 'Pinhal', :zip_code => '68.155-000', :state => state); c.save 
c = City.new(:name => 'Piria', :zip_code => '68.818-000', :state => state); c.save 
c = City.new(:name => 'Ponta De Pedras', :zip_code => '68.830-000', :state => state); c.save 
c = City.new(:name => 'Ponta De Ramos', :zip_code => '68.758-000', :state => state); c.save 
c = City.new(:name => 'Portel', :zip_code => '68.480-000', :state => state); c.save 
c = City.new(:name => 'Porto De Moz', :zip_code => '68.330-000', :state => state); c.save 
c = City.new(:name => 'Porto Salvo', :zip_code => '68.782-000', :state => state); c.save 
c = City.new(:name => 'Porto Trombetas', :zip_code => '68.275-000', :state => state); c.save 
c = City.new(:name => 'Prainha', :zip_code => '68.130-000', :state => state); c.save 
c = City.new(:name => 'Primavera', :zip_code => '68.707-000', :state => state); c.save 
c = City.new(:name => 'Quatipuru', :zip_code => '68.709-000', :state => state); c.save 
c = City.new(:name => 'Quatro Bocas', :zip_code => '68.682-000', :state => state); c.save 
c = City.new(:name => 'Redencao', :zip_code => '68.550-000', :state => state); c.save 
c = City.new(:name => 'Remansao', :zip_code => '68.461-000', :state => state); c.save 
c = City.new(:name => 'Rio Maria', :zip_code => '68.530-000', :state => state); c.save 
c = City.new(:name => 'Rondon Do Para', :zip_code => '68.638-000', :state => state); c.save 
c = City.new(:name => 'Ruropolis', :zip_code => '68.165-000', :state => state); c.save 
c = City.new(:name => 'Salinopolis', :zip_code => '68.721-000', :state => state); c.save 
c = City.new(:name => 'Salvaterra', :zip_code => '68.860-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara Do Para', :zip_code => '68.798-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Arari', :zip_code => '68.850-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel Do Para', :zip_code => '68.790-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '68.716-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Das Barreiras', :zip_code => '68.565-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Para', :zip_code => '68.738-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa Da Vigia', :zip_code => '68.783-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Araguaia', :zip_code => '68.560-000', :state => state); c.save 
c = City.new(:name => 'Santarem', :zip_code => '68.000-000', :state => state); c.save 
c = City.new(:name => 'Santarem Novo', :zip_code => '68.720-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Taua', :zip_code => '68.786-000', :state => state); c.save 
c = City.new(:name => 'Sao Caetano De Odivelas', :zip_code => '68.775-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Araguaia', :zip_code => '68.520-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Capim', :zip_code => '68.635-000', :state => state); c.save 
c = City.new(:name => 'Sao Felix Do Xingu', :zip_code => '68.380-000', :state => state); c.save 
c = City.new(:name => 'Vila Dos Cabanos', :zip_code => '68.447-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Da Jararaca', :zip_code => '68.828-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Para', :zip_code => '68.748-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo Do Araguaia', :zip_code => '68.570-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Ponta', :zip_code => '68.774-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Pirabas', :zip_code => '68.719-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Araguaia', :zip_code => '68.518-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Dos Ramos', :zip_code => '68.778-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Gurupi', :zip_code => '68.623-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Piria', :zip_code => '68.621-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz Do Tapajos', :zip_code => '68.190-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Guama', :zip_code => '68.660-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Dos Macacos', :zip_code => '68.808-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro De Viseu', :zip_code => '68.428-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Capim', :zip_code => '68.636-000', :state => state); c.save 
c = City.new(:name => 'Sao Raimundo De Borralhos', :zip_code => '68.788-000', :state => state); c.save 
c = City.new(:name => 'Sao Raimundo Do Araguaia', :zip_code => '68.522-000', :state => state); c.save 
c = City.new(:name => 'Sao Raimundo Dos Furtados', :zip_code => '68.410-000', :state => state); c.save 
c = City.new(:name => 'Sao Roberto', :zip_code => '68.711-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Boa Vista', :zip_code => '68.820-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao De Vicosa', :zip_code => '68.885-000', :state => state); c.save 
c = City.new(:name => 'Dom Eliseu', :zip_code => '68.633-000', :state => state); c.save 
c = City.new(:name => 'Senador Jose Porfirio', :zip_code => '68.360-000', :state => state); c.save 
c = City.new(:name => 'Serra Pelada', :zip_code => '68.514-000', :state => state); c.save 
c = City.new(:name => 'Soure', :zip_code => '68.870-000', :state => state); c.save 
c = City.new(:name => 'Tailandia', :zip_code => '68.695-000', :state => state); c.save 
c = City.new(:name => 'Tatuteua', :zip_code => '68.717-000', :state => state); c.save 
c = City.new(:name => 'Tauari', :zip_code => '68.705-000', :state => state); c.save 
c = City.new(:name => 'Tauarizinho', :zip_code => '68.735-000', :state => state); c.save 
c = City.new(:name => 'Tentugal', :zip_code => '68.642-000', :state => state); c.save 
c = City.new(:name => 'Terra Alta', :zip_code => '68.773-000', :state => state); c.save 
c = City.new(:name => 'Terra Santa', :zip_code => '68.285-000', :state => state); c.save 
c = City.new(:name => 'Tijoca', :zip_code => '68.606-000', :state => state); c.save 
c = City.new(:name => 'Timboteua', :zip_code => '68.732-000', :state => state); c.save 
c = City.new(:name => 'Tome-acu', :zip_code => '68.680-000', :state => state); c.save 
c = City.new(:name => 'Tracuateua', :zip_code => '68.647-000', :state => state); c.save 
c = City.new(:name => 'Tucuma', :zip_code => '68.385-000', :state => state); c.save 
c = City.new(:name => 'Tucurui', :zip_code => '68.455-000', :state => state); c.save 
c = City.new(:name => 'Urucuri', :zip_code => '68.663-000', :state => state); c.save 
c = City.new(:name => 'Urucuriteua', :zip_code => '68.662-000', :state => state); c.save 
c = City.new(:name => 'Val-de-caes', :zip_code => '66.000-000', :state => state); c.save 
c = City.new(:name => 'Veiros', :zip_code => '68.350-000', :state => state); c.save 
c = City.new(:name => 'Vigia', :zip_code => '68.780-000', :state => state); c.save 
c = City.new(:name => 'Aurora Do Para', :zip_code => '68.658-000', :state => state); c.save 
c = City.new(:name => 'Vila Do Carmo Do Tocantins', :zip_code => '68.409-000', :state => state); c.save 
c = City.new(:name => 'Mae Do Rio', :zip_code => '68.675-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova', :zip_code => '68.779-000', :state => state); c.save 
c = City.new(:name => 'Vilarinho Do Monte', :zip_code => '68.340-000', :state => state); c.save 
c = City.new(:name => 'Viseu', :zip_code => '68.620-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '68.759-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre Do Para', :zip_code => '68.765-000', :state => state); c.save 
c = City.new(:name => 'Vitoria Do Xingu', :zip_code => '68.383-000', :state => state); c.save 
c = City.new(:name => 'Xinguara', :zip_code => '68.555-000', :state => state); c.save 
c = City.new(:name => 'Parauapebas', :zip_code => '68.515-000', :state => state); c.save 
c = City.new(:name => 'Ulianopolis', :zip_code => '68.632-000', :state => state); c.save 
c = City.new(:name => 'Medicilandia', :zip_code => '68.145-000', :state => state); c.save 
c = City.new(:name => 'Outeiro', :zip_code => '66.000-000', :state => state); c.save 
c = City.new(:name => 'Baturite', :zip_code => '68.892-000', :state => state); c.save 
c = City.new(:name => 'Novo Progresso', :zip_code => '68.193-000', :state => state); c.save 
c = City.new(:name => 'Trairao', :zip_code => '68.198-000', :state => state); c.save 
c = City.new(:name => 'Novo Repartimento', :zip_code => '68.473-000', :state => state); c.save 
c = City.new(:name => 'Agua Azul Do Norte', :zip_code => '68.533-000', :state => state); c.save 
c = City.new(:name => 'Breu Branco', :zip_code => '68.488-000', :state => state); c.save 
c = City.new(:name => 'Palestina Do Para', :zip_code => '68.535-000', :state => state); c.save 
c = City.new(:name => 'Pau Darco', :zip_code => '68.545-000', :state => state); c.save 
c = City.new(:name => 'Nova Esperanca Do Piria', :zip_code => '68.618-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Do Para', :zip_code => '68.644-000', :state => state); c.save 
c = City.new(:name => 'Vila Santa Fe', :zip_code => '68.514-100', :state => state); c.save 
c = City.new(:name => 'Brejo Do Meio', :zip_code => '68.514-200', :state => state); c.save 
c = City.new(:name => 'Morada Nova', :zip_code => '68.514-300', :state => state); c.save 
c = City.new(:name => 'Murumuru', :zip_code => '68.514-400', :state => state); c.save 
c = City.new(:name => 'Paratins', :zip_code => '68.514-500', :state => state); c.save 
c = City.new(:name => 'Agropolis Bela Vista', :zip_code => '68.111-000', :state => state); c.save 
c = City.new(:name => 'Alta Para', :zip_code => '68.112-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '68.113-000', :state => state); c.save 
c = City.new(:name => 'Boa Fe', :zip_code => '68.114-000', :state => state); c.save 
c = City.new(:name => 'Cambuquira', :zip_code => '68.116-000', :state => state); c.save 
c = City.new(:name => 'Igarape Da Lama', :zip_code => '68.117-000', :state => state); c.save 
c = City.new(:name => 'Inanu', :zip_code => '68.118-000', :state => state); c.save 
c = City.new(:name => 'Piraquara', :zip_code => '68.119-000', :state => state); c.save 
c = City.new(:name => 'Vila Franca', :zip_code => '68.121-000', :state => state); c.save 
c = City.new(:name => 'Vila Goreth', :zip_code => '68.122-000', :state => state); c.save 
c = City.new(:name => 'Vila Socorro', :zip_code => '68.123-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim Do Tapara', :zip_code => '68.124-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge', :zip_code => '68.126-000', :state => state); c.save 
c = City.new(:name => 'Iatai', :zip_code => '68.379-100', :state => state); c.save 
c = City.new(:name => 'Castelo Dos Sonhos', :zip_code => '68.379-200', :state => state); c.save 
c = City.new(:name => 'Nazare Dos Patos', :zip_code => '68.462-000', :state => state); c.save 
c = City.new(:name => 'Repartimento', :zip_code => '68.463-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '68.449-000', :state => state); c.save 
c = City.new(:name => 'Boa Sorte', :zip_code => '68.449-100', :state => state); c.save 
c = City.new(:name => 'Mata Geral', :zip_code => '68.449-200', :state => state); c.save 
c = City.new(:name => 'Marajoara', :zip_code => '68.449-300', :state => state); c.save 
c = City.new(:name => 'Novo Planalto', :zip_code => '68.449-400', :state => state); c.save 
c = City.new(:name => 'Osvaldilandia', :zip_code => '68.449-500', :state => state); c.save 
c = City.new(:name => 'Sapucaia', :zip_code => '68.548-000', :state => state); c.save 
c = City.new(:name => 'Xinguarinha', :zip_code => '68.559-200', :state => state); c.save 
c = City.new(:name => 'Agua Fria', :zip_code => '68.559-300', :state => state); c.save 
c = City.new(:name => 'Picarra', :zip_code => '68.559-400', :state => state); c.save 
c = City.new(:name => 'Rio Vermelho', :zip_code => '68.559-500', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '68.559-600', :state => state); c.save 
c = City.new(:name => 'Gurupizinho', :zip_code => '68.631-000', :state => state); c.save 
c = City.new(:name => 'Arco-iris', :zip_code => '68.631-200', :state => state); c.save 
c = City.new(:name => 'Conceicao', :zip_code => '68.631-400', :state => state); c.save 
c = City.new(:name => 'Ligacao Do Para', :zip_code => '68.631-600', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Piria', :zip_code => '68.631-800', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '68.747-500', :state => state); c.save 
c = City.new(:name => 'Vila Planalto', :zip_code => '68.191-000', :state => state); c.save 
c = City.new(:name => 'Vila Isol', :zip_code => '68.191-200', :state => state); c.save 
c = City.new(:name => 'Riozinho', :zip_code => '68.191-300', :state => state); c.save 
c = City.new(:name => 'Miritituba', :zip_code => '68.191-400', :state => state); c.save 
c = City.new(:name => 'Aruri', :zip_code => '68.191-500', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Caracol', :zip_code => '68.191-600', :state => state); c.save 
c = City.new(:name => 'Alvorada', :zip_code => '68.191-700', :state => state); c.save 
c = City.new(:name => 'Barreiras', :zip_code => '68.192-000', :state => state); c.save 
c = City.new(:name => 'Cripurizao', :zip_code => '68.192-200', :state => state); c.save 
c = City.new(:name => 'Cripuriznho', :zip_code => '68.192-300', :state => state); c.save 
c = City.new(:name => 'Cuiu-cuiu', :zip_code => '68.192-400', :state => state); c.save 
c = City.new(:name => 'Floresta', :zip_code => '68.192-500', :state => state); c.save 
c = City.new(:name => 'Jamanxinzinho', :zip_code => '68.192-600', :state => state); c.save 
c = City.new(:name => 'Nucleo Urbano Quilometro 30', :zip_code => '68.192-700', :state => state); c.save 
c = City.new(:name => 'Otelo', :zip_code => '66.000-000', :state => state); c.save 
c = City.new(:name => 'Apeu', :zip_code => '68.740-000', :state => state); c.save 
c = City.new(:name => 'Placas', :zip_code => '68.138-000', :state => state); c.save 
c = City.new(:name => 'Anapu', :zip_code => '68.365-000', :state => state); c.save 
c = City.new(:name => 'Bannach', :zip_code => '68.388-000', :state => state); c.save 
c = City.new(:name => 'Canaa Dos Carajas', :zip_code => '68.537-000', :state => state); c.save 
c = City.new(:name => 'Floresta Do Araguaia', :zip_code => '68.543-000', :state => state); c.save 
c = City.new(:name => 'Nova Ipixuna', :zip_code => '68.585-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Piria', :zip_code => '68.617-000', :state => state); c.save 
c = City.new(:name => 'Picarra', :zip_code => '68.575-000', :state => state); c.save 

