#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Minas Gerais')
state ||= State.create!( :name => 'Minas Gerais', :code => 'MG', :country => country);

c = City.new(:name => 'Abadia Dos Dourados', :zip_code => '38.540-000', :state => state); c.save 
c = City.new(:name => 'Abaete', :zip_code => '35.620-000', :state => state); c.save 
c = City.new(:name => 'Abaete Dos Mendes', :zip_code => '38.812-000', :state => state); c.save 
c = City.new(:name => 'Abaiba', :zip_code => '36.704-000', :state => state); c.save 
c = City.new(:name => 'Abre Campo', :zip_code => '35.365-000', :state => state); c.save 
c = City.new(:name => 'Abreus', :zip_code => '36.263-000', :state => state); c.save 
c = City.new(:name => 'Acaiaca', :zip_code => '35.438-000', :state => state); c.save 
c = City.new(:name => 'Acucena', :zip_code => '35.150-000', :state => state); c.save 
c = City.new(:name => 'Acurui', :zip_code => '35.451-000', :state => state); c.save 
c = City.new(:name => 'Adao Colares', :zip_code => '39.597-000', :state => state); c.save 
c = City.new(:name => 'Agua Boa', :zip_code => '39.790-000', :state => state); c.save 
c = City.new(:name => 'Agua Branca De Minas', :zip_code => '39.629-000', :state => state); c.save 
c = City.new(:name => 'Agua Comprida', :zip_code => '38.110-000', :state => state); c.save 
c = City.new(:name => 'Agua Viva', :zip_code => '36.728-000', :state => state); c.save 
c = City.new(:name => 'Aguanil', :zip_code => '37.273-000', :state => state); c.save 
c = City.new(:name => 'Aguas De Araxa', :zip_code => '38.180-000', :state => state); c.save 
c = City.new(:name => 'Aguas De Contendas', :zip_code => '37.435-000', :state => state); c.save 
c = City.new(:name => 'Aguas Formosas', :zip_code => '39.880-000', :state => state); c.save 
c = City.new(:name => 'Aguas Vermelhas', :zip_code => '39.990-000', :state => state); c.save 
c = City.new(:name => 'Aimores', :zip_code => '35.200-000', :state => state); c.save 
c = City.new(:name => 'Aiuruoca', :zip_code => '37.450-000', :state => state); c.save 
c = City.new(:name => 'Alagoa', :zip_code => '37.458-000', :state => state); c.save 
c = City.new(:name => 'Albertina', :zip_code => '37.596-000', :state => state); c.save 
c = City.new(:name => 'Alberto Isaacson', :zip_code => '35.608-000', :state => state); c.save 
c = City.new(:name => 'Albertos', :zip_code => '35.576-000', :state => state); c.save 
c = City.new(:name => 'Alegre', :zip_code => '38.560-000', :state => state); c.save 
c = City.new(:name => 'Alegria', :zip_code => '36.935-000', :state => state); c.save 
c = City.new(:name => 'Alem Paraiba', :zip_code => '36.660-000', :state => state); c.save 
c = City.new(:name => 'Alexandrita', :zip_code => '38.282-000', :state => state); c.save 
c = City.new(:name => 'Alfenas', :zip_code => '37.130-000', :state => state); c.save 
c = City.new(:name => 'Alfredo Vasconcelos', :zip_code => '36.272-000', :state => state); c.save 
c = City.new(:name => 'Almeida', :zip_code => '35.835-000', :state => state); c.save 
c = City.new(:name => 'Almenara', :zip_code => '39.900-000', :state => state); c.save 
c = City.new(:name => 'Alpercata', :zip_code => '35.138-000', :state => state); c.save 
c = City.new(:name => 'Alpinopolis', :zip_code => '37.940-000', :state => state); c.save 
c = City.new(:name => 'Alterosa', :zip_code => '37.145-000', :state => state); c.save 
c = City.new(:name => 'Alto Caparao', :zip_code => '36.836-000', :state => state); c.save 
c = City.new(:name => 'Alto Capim', :zip_code => '35.210-000', :state => state); c.save 
c = City.new(:name => 'Alto Maranhao', :zip_code => '36.417-000', :state => state); c.save 
c = City.new(:name => 'Alto Rio Doce', :zip_code => '36.260-000', :state => state); c.save 
c = City.new(:name => 'Altolandia', :zip_code => '38.985-000', :state => state); c.save 
c = City.new(:name => 'Alvacao', :zip_code => '39.347-000', :state => state); c.save 
c = City.new(:name => 'Alvarenga', :zip_code => '35.249-000', :state => state); c.save 
c = City.new(:name => 'Alvinopolis', :zip_code => '35.950-000', :state => state); c.save 
c = City.new(:name => 'Alvorada', :zip_code => '36.803-000', :state => state); c.save 
c = City.new(:name => 'Alvorada De Minas', :zip_code => '39.140-000', :state => state); c.save 
c = City.new(:name => 'Amanhece', :zip_code => '38.455-000', :state => state); c.save 
c = City.new(:name => 'Amarantina', :zip_code => '35.412-000', :state => state); c.save 
c = City.new(:name => 'Amparo Da Serra', :zip_code => '35.444-000', :state => state); c.save 
c = City.new(:name => 'Andradas', :zip_code => '37.795-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Pajeu', :zip_code => '39.980-000', :state => state); c.save 
c = City.new(:name => 'Andrelandia', :zip_code => '37.300-000', :state => state); c.save 
c = City.new(:name => 'Andrequice', :zip_code => '39.207-000', :state => state); c.save 
c = City.new(:name => 'Angaturama', :zip_code => '36.746-000', :state => state); c.save 
c = City.new(:name => 'Angicos De Minas', :zip_code => '39.332-000', :state => state); c.save 
c = City.new(:name => 'Angustura', :zip_code => '36.664-000', :state => state); c.save 
c = City.new(:name => 'Antonio Carlos', :zip_code => '36.220-000', :state => state); c.save 
c = City.new(:name => 'Antonio Dias', :zip_code => '35.177-000', :state => state); c.save 
c = City.new(:name => 'Antonio Dos Santos', :zip_code => '34.960-000', :state => state); c.save 
c = City.new(:name => 'Antonio Ferreira', :zip_code => '39.697-000', :state => state); c.save 
c = City.new(:name => 'Antonio Prado De Minas', :zip_code => '36.850-000', :state => state); c.save 
c = City.new(:name => 'Antunes', :zip_code => '35.698-000', :state => state); c.save 
c = City.new(:name => 'Aparecida De Minas', :zip_code => '38.205-000', :state => state); c.save 
c = City.new(:name => 'Aracai', :zip_code => '35.777-000', :state => state); c.save 
c = City.new(:name => 'Aracati De Minas', :zip_code => '36.776-000', :state => state); c.save 
c = City.new(:name => 'Aracitaba', :zip_code => '36.255-000', :state => state); c.save 
c = City.new(:name => 'Aracuai', :zip_code => '39.600-000', :state => state); c.save 
c = City.new(:name => 'Araguari', :zip_code => '38.440-000', :state => state); c.save 
c = City.new(:name => 'Aranha', :zip_code => '35.462-000', :state => state); c.save 
c = City.new(:name => 'Arantina', :zip_code => '37.360-000', :state => state); c.save 
c = City.new(:name => 'Araponga', :zip_code => '36.594-000', :state => state); c.save 
c = City.new(:name => 'Arapora', :zip_code => '38.435-000', :state => state); c.save 
c = City.new(:name => 'Arapua', :zip_code => '38.860-000', :state => state); c.save 
c = City.new(:name => 'Araujos', :zip_code => '35.603-000', :state => state); c.save 
c = City.new(:name => 'Arauna', :zip_code => '37.180-000', :state => state); c.save 
c = City.new(:name => 'Araxa', :zip_code => '38.180-000', :state => state); c.save 
c = City.new(:name => 'Arcangelo', :zip_code => '36.318-000', :state => state); c.save 
c = City.new(:name => 'Arceburgo', :zip_code => '37.820-000', :state => state); c.save 
c = City.new(:name => 'Arcos', :zip_code => '35.588-000', :state => state); c.save 
c = City.new(:name => 'Areado', :zip_code => '37.140-000', :state => state); c.save 
c = City.new(:name => 'Argenita', :zip_code => '38.955-000', :state => state); c.save 
c = City.new(:name => 'Argirita', :zip_code => '36.710-000', :state => state); c.save 
c = City.new(:name => 'Aricanduva', :zip_code => '39.678-000', :state => state); c.save 
c = City.new(:name => 'Arinos', :zip_code => '38.680-000', :state => state); c.save 
c = City.new(:name => 'Aristides Batista', :zip_code => '39.341-000', :state => state); c.save 
c = City.new(:name => 'Assarai', :zip_code => '36.966-000', :state => state); c.save 
c = City.new(:name => 'Astolfo Dutra', :zip_code => '36.780-000', :state => state); c.save 
c = City.new(:name => 'Ataleia', :zip_code => '39.850-000', :state => state); c.save 
c = City.new(:name => 'Augusto De Lima', :zip_code => '39.220-000', :state => state); c.save 
c = City.new(:name => 'Avai Do Jacinto', :zip_code => '39.931-000', :state => state); c.save 
c = City.new(:name => 'Azurita', :zip_code => '35.672-000', :state => state); c.save 
c = City.new(:name => 'Babilonia', :zip_code => '37.915-000', :state => state); c.save 
c = City.new(:name => 'Baependi', :zip_code => '37.443-000', :state => state); c.save 
c = City.new(:name => 'Baioes', :zip_code => '35.575-000', :state => state); c.save 
c = City.new(:name => 'Balbinopolis', :zip_code => '39.877-000', :state => state); c.save 
c = City.new(:name => 'Baldim', :zip_code => '35.706-000', :state => state); c.save 
c = City.new(:name => 'Bambui', :zip_code => '38.900-000', :state => state); c.save 
c = City.new(:name => 'Bandeira', :zip_code => '39.917-000', :state => state); c.save 
c = City.new(:name => 'Bandeira Do Sul', :zip_code => '37.740-000', :state => state); c.save 
c = City.new(:name => 'Bandeirantes', :zip_code => '35.423-000', :state => state); c.save 
c = City.new(:name => 'Barao De Cocais', :zip_code => '35.970-000', :state => state); c.save 
c = City.new(:name => 'Barao De Monte Alto', :zip_code => '36.870-000', :state => state); c.save 
c = City.new(:name => 'Barbacena', :zip_code => '36.200-000', :state => state); c.save 
c = City.new(:name => 'Barra Alegre', :zip_code => '35.165-000', :state => state); c.save 
c = City.new(:name => 'Barra Da Figueira', :zip_code => '36.963-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Ariranha', :zip_code => '35.295-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Cuiete', :zip_code => '35.243-000', :state => state); c.save 
c = City.new(:name => 'Barra Longa', :zip_code => '35.447-000', :state => state); c.save 
c = City.new(:name => 'Barranco Alto', :zip_code => '37.131-000', :state => state); c.save 
c = City.new(:name => 'Barreiro Da Raiz', :zip_code => '39.442-000', :state => state); c.save 
c = City.new(:name => 'Barreiro Do Rio Verde', :zip_code => '39.441-000', :state => state); c.save 
c = City.new(:name => 'Barretos De Alvinopolis', :zip_code => '35.952-000', :state => state); c.save 
c = City.new(:name => 'Barrocao', :zip_code => '39.572-000', :state => state); c.save 
c = City.new(:name => 'Barroso', :zip_code => '36.212-000', :state => state); c.save 
c = City.new(:name => 'Bau', :zip_code => '35.615-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista De Minas', :zip_code => '35.938-000', :state => state); c.save 
c = City.new(:name => 'Belisario', :zip_code => '36.888-000', :state => state); c.save 
c = City.new(:name => 'Belmiro Braga', :zip_code => '36.126-000', :state => state); c.save 
c = City.new(:name => 'Belo Horizonte', :zip_code => '30.000-000', :state => state); c.save 
c = City.new(:name => 'Belo Oriente', :zip_code => '35.195-000', :state => state); c.save 
c = City.new(:name => 'Belo Oriente', :zip_code => '39.806-000', :state => state); c.save 
c = City.new(:name => 'Belo Vale', :zip_code => '35.473-000', :state => state); c.save 
c = City.new(:name => 'Bentopolis De Minas', :zip_code => '39.325-000', :state => state); c.save 
c = City.new(:name => 'Berilo', :zip_code => '39.640-000', :state => state); c.save 
c = City.new(:name => 'Berizal', :zip_code => '39.555-000', :state => state); c.save 
c = City.new(:name => 'Bertopolis', :zip_code => '39.875-000', :state => state); c.save 
c = City.new(:name => 'Betim', :zip_code => '32.500-000', :state => state); c.save 
c = City.new(:name => 'Bias Fortes', :zip_code => '36.230-000', :state => state); c.save 
c = City.new(:name => 'Bicas', :zip_code => '36.600-000', :state => state); c.save 
c = City.new(:name => 'Bicuiba', :zip_code => '35.352-000', :state => state); c.save 
c = City.new(:name => 'Biquinhas', :zip_code => '35.621-000', :state => state); c.save 
c = City.new(:name => 'Bituri', :zip_code => '35.497-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '37.170-000', :state => state); c.save 
c = City.new(:name => 'Boa Familia', :zip_code => '36.891-000', :state => state); c.save 
c = City.new(:name => 'Boa Uniao De Itabirinha', :zip_code => '35.285-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista De Minas', :zip_code => '35.517-000', :state => state); c.save 
c = City.new(:name => 'Bocaina De Minas', :zip_code => '37.340-000', :state => state); c.save 
c = City.new(:name => 'Bocaiuva', :zip_code => '39.390-000', :state => state); c.save 
c = City.new(:name => 'Bom Despacho', :zip_code => '35.600-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim De Minas', :zip_code => '37.310-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Da Cachoeira', :zip_code => '36.892-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Da Penha', :zip_code => '37.948-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Amparo', :zip_code => '35.908-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Divino', :zip_code => '36.825-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Galho', :zip_code => '35.340-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Madeira', :zip_code => '36.817-000', :state => state); c.save 
c = City.new(:name => 'Bom Pastor', :zip_code => '35.233-000', :state => state); c.save 
c = City.new(:name => 'Bom Repouso', :zip_code => '37.610-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro', :zip_code => '36.218-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso', :zip_code => '37.220-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso De Patos', :zip_code => '38.712-000', :state => state); c.save 
c = City.new(:name => 'Bonanca', :zip_code => '39.456-000', :state => state); c.save 
c = City.new(:name => 'Bonfim', :zip_code => '35.521-000', :state => state); c.save 
c = City.new(:name => 'Bonfinopolis De Minas', :zip_code => '38.650-000', :state => state); c.save 
c = City.new(:name => 'Bonito De Minas', :zip_code => '39.490-000', :state => state); c.save 
c = City.new(:name => 'Borda Da Mata', :zip_code => '37.564-000', :state => state); c.save 
c = City.new(:name => 'Botelhos', :zip_code => '37.720-000', :state => state); c.save 
c = City.new(:name => 'Botumirim', :zip_code => '39.596-000', :state => state); c.save 
c = City.new(:name => 'Bras Pires', :zip_code => '36.542-000', :state => state); c.save 
c = City.new(:name => 'Brasilia De Minas', :zip_code => '39.330-000', :state => state); c.save 
c = City.new(:name => 'Brasopolis', :zip_code => '37.530-000', :state => state); c.save 
c = City.new(:name => 'Braunas', :zip_code => '35.169-000', :state => state); c.save 
c = City.new(:name => 'Brejauba', :zip_code => '35.858-000', :state => state); c.save 
c = City.new(:name => 'Brejo Bonito', :zip_code => '38.738-000', :state => state); c.save 
c = City.new(:name => 'Brejo Do Amparo', :zip_code => '39.482-000', :state => state); c.save 
c = City.new(:name => 'Brumadinho', :zip_code => '35.460-000', :state => state); c.save 
c = City.new(:name => 'Buarque De Macedo', :zip_code => '36.413-000', :state => state); c.save 
c = City.new(:name => 'Bueno', :zip_code => '35.244-000', :state => state); c.save 
c = City.new(:name => 'Bueno Brandao', :zip_code => '37.578-000', :state => state); c.save 
c = City.new(:name => 'Buenopolis', :zip_code => '39.230-000', :state => state); c.save 
c = City.new(:name => 'Bugre', :zip_code => '35.193-000', :state => state); c.save 
c = City.new(:name => 'Buritis', :zip_code => '38.660-000', :state => state); c.save 
c = City.new(:name => 'Buritizeiro', :zip_code => '39.280-000', :state => state); c.save 
c = City.new(:name => 'Caatinga', :zip_code => '38.778-000', :state => state); c.save 
c = City.new(:name => 'Cabeceira Grande', :zip_code => '38.625-000', :state => state); c.save 
c = City.new(:name => 'Cabo Verde', :zip_code => '37.880-000', :state => state); c.save 
c = City.new(:name => 'Caburu', :zip_code => '36.317-000', :state => state); c.save 
c = City.new(:name => 'Cacaratiba', :zip_code => '39.662-000', :state => state); c.save 
c = City.new(:name => 'Cacarema', :zip_code => '39.448-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Alegre', :zip_code => '36.876-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Da Prata', :zip_code => '35.765-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Minas', :zip_code => '37.545-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Santa Cruz', :zip_code => '36.574-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Brumado', :zip_code => '35.424-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Campo', :zip_code => '35.410-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Manteiga', :zip_code => '39.288-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Vale', :zip_code => '35.180-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Dos Antunes', :zip_code => '35.523-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Dourada', :zip_code => '38.370-000', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha', :zip_code => '38.995-000', :state => state); c.save 
c = City.new(:name => 'Caetanopolis', :zip_code => '35.770-000', :state => state); c.save 
c = City.new(:name => 'Caete', :zip_code => '34.800-000', :state => state); c.save 
c = City.new(:name => 'Caiana', :zip_code => '36.832-000', :state => state); c.save 
c = City.new(:name => 'Caiapo', :zip_code => '36.735-000', :state => state); c.save 
c = City.new(:name => 'Cajuri', :zip_code => '36.560-000', :state => state); c.save 
c = City.new(:name => 'Caldas', :zip_code => '37.780-000', :state => state); c.save 
c = City.new(:name => 'Calixto', :zip_code => '35.232-000', :state => state); c.save 
c = City.new(:name => 'Camacho', :zip_code => '35.555-000', :state => state); c.save 
c = City.new(:name => 'Camanducaia', :zip_code => '37.650-000', :state => state); c.save 
c = City.new(:name => 'Camargos', :zip_code => '35.427-000', :state => state); c.save 
c = City.new(:name => 'Cambui', :zip_code => '37.600-000', :state => state); c.save 
c = City.new(:name => 'Cambuquira', :zip_code => '37.420-000', :state => state); c.save 
c = City.new(:name => 'Campanario', :zip_code => '39.835-000', :state => state); c.save 
c = City.new(:name => 'Campanha', :zip_code => '37.400-000', :state => state); c.save 
c = City.new(:name => 'Campestre', :zip_code => '37.730-000', :state => state); c.save 
c = City.new(:name => 'Campestrinho', :zip_code => '37.797-000', :state => state); c.save 
c = City.new(:name => 'Campina Verde', :zip_code => '38.270-000', :state => state); c.save 
c = City.new(:name => 'Campo Azul', :zip_code => '39.338-000', :state => state); c.save 
c = City.new(:name => 'Campo Belo', :zip_code => '37.270-000', :state => state); c.save 
c = City.new(:name => 'Campo Do Meio', :zip_code => '37.165-000', :state => state); c.save 
c = City.new(:name => 'Campo Florido', :zip_code => '38.130-000', :state => state); c.save 
c = City.new(:name => 'Campo Redondo', :zip_code => '39.452-000', :state => state); c.save 
c = City.new(:name => 'Campolide', :zip_code => '36.237-000', :state => state); c.save 
c = City.new(:name => 'Campos Altos', :zip_code => '38.970-000', :state => state); c.save 
c = City.new(:name => 'Campos Gerais', :zip_code => '37.160-000', :state => state); c.save 
c = City.new(:name => 'Cana Verde', :zip_code => '37.267-000', :state => state); c.save 
c = City.new(:name => 'Canaa', :zip_code => '36.592-000', :state => state); c.save 
c = City.new(:name => 'Canabrava', :zip_code => '39.581-000', :state => state); c.save 
c = City.new(:name => 'Canabrava', :zip_code => '38.773-000', :state => state); c.save 
c = City.new(:name => 'Canapolis', :zip_code => '38.380-000', :state => state); c.save 
c = City.new(:name => 'Canastrao', :zip_code => '38.890-000', :state => state); c.save 
c = City.new(:name => 'Candeias', :zip_code => '37.280-000', :state => state); c.save 
c = City.new(:name => 'Canoeiros', :zip_code => '38.792-000', :state => state); c.save 
c = City.new(:name => 'Cantagalo', :zip_code => '39.703-000', :state => state); c.save 
c = City.new(:name => 'Caparao', :zip_code => '36.834-000', :state => state); c.save 
c = City.new(:name => 'Capela Nova', :zip_code => '36.290-000', :state => state); c.save 
c = City.new(:name => 'Capelinha', :zip_code => '39.680-000', :state => state); c.save 
c = City.new(:name => 'Capetinga', :zip_code => '37.993-000', :state => state); c.save 
c = City.new(:name => 'Capim Branco', :zip_code => '35.730-000', :state => state); c.save 
c = City.new(:name => 'Capinopolis', :zip_code => '38.360-000', :state => state); c.save 
c = City.new(:name => 'Capitania', :zip_code => '39.499-000', :state => state); c.save 
c = City.new(:name => 'Capitao Andrade', :zip_code => '35.123-000', :state => state); c.save 
c = City.new(:name => 'Capitao Eneas', :zip_code => '39.445-000', :state => state); c.save 
c = City.new(:name => 'Capitolio', :zip_code => '37.930-000', :state => state); c.save 
c = City.new(:name => 'Caputira', :zip_code => '36.925-000', :state => state); c.save 
c = City.new(:name => 'Carai', :zip_code => '39.810-000', :state => state); c.save 
c = City.new(:name => 'Caranaiba', :zip_code => '36.428-000', :state => state); c.save 
c = City.new(:name => 'Carandai', :zip_code => '36.280-000', :state => state); c.save 
c = City.new(:name => 'Carangola', :zip_code => '36.800-000', :state => state); c.save 
c = City.new(:name => 'Caratinga', :zip_code => '35.300-000', :state => state); c.save 
c = City.new(:name => 'Carbonita', :zip_code => '39.665-000', :state => state); c.save 
c = City.new(:name => 'Cardeal Mota', :zip_code => '35.847-000', :state => state); c.save 
c = City.new(:name => 'Careacu', :zip_code => '37.556-000', :state => state); c.save 
c = City.new(:name => 'Carlos Alves', :zip_code => '36.686-000', :state => state); c.save 
c = City.new(:name => 'Carlos Chagas', :zip_code => '39.864-000', :state => state); c.save 
c = City.new(:name => 'Carmesia', :zip_code => '35.878-000', :state => state); c.save 
c = City.new(:name => 'Carmo Da Cachoeira', :zip_code => '37.225-000', :state => state); c.save 
c = City.new(:name => 'Carmo Da Mata', :zip_code => '35.547-000', :state => state); c.save 
c = City.new(:name => 'Carmo De Minas', :zip_code => '37.472-000', :state => state); c.save 
c = City.new(:name => 'Carmo Do Cajuru', :zip_code => '35.510-000', :state => state); c.save 
c = City.new(:name => 'Carmo Do Paranaiba', :zip_code => '38.840-000', :state => state); c.save 
c = City.new(:name => 'Carmo Do Rio Claro', :zip_code => '37.150-000', :state => state); c.save 
c = City.new(:name => 'Carmopolis De Minas', :zip_code => '35.534-000', :state => state); c.save 
c = City.new(:name => 'Carneirinho', :zip_code => '38.290-000', :state => state); c.save 
c = City.new(:name => 'Carrancas', :zip_code => '37.245-000', :state => state); c.save 
c = City.new(:name => 'Carvalho De Brito', :zip_code => '34.500-000', :state => state); c.save 
c = City.new(:name => 'Carvalhopolis', :zip_code => '37.760-000', :state => state); c.save 
c = City.new(:name => 'Carvalhos', :zip_code => '37.456-000', :state => state); c.save 
c = City.new(:name => 'Casa Grande', :zip_code => '36.422-000', :state => state); c.save 
c = City.new(:name => 'Cascalho Rico', :zip_code => '38.460-000', :state => state); c.save 
c = City.new(:name => 'Cassia', :zip_code => '37.980-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Da Barra De Minas', :zip_code => '36.360-000', :state => state); c.save 
c = City.new(:name => 'Cataguarino', :zip_code => '36.779-000', :state => state); c.save 
c = City.new(:name => 'Cataguases', :zip_code => '36.770-000', :state => state); c.save 
c = City.new(:name => 'Catajas', :zip_code => '39.937-000', :state => state); c.save 
c = City.new(:name => 'Catas Altas', :zip_code => '35.969-000', :state => state); c.save 
c = City.new(:name => 'Catas Altas Da Noruega', :zip_code => '36.450-000', :state => state); c.save 
c = City.new(:name => 'Catiara', :zip_code => '38.762-000', :state => state); c.save 
c = City.new(:name => 'Catuji', :zip_code => '39.816-000', :state => state); c.save 
c = City.new(:name => 'Catune', :zip_code => '36.846-000', :state => state); c.save 
c = City.new(:name => 'Catuni', :zip_code => '39.585-000', :state => state); c.save 
c = City.new(:name => 'Caxambu', :zip_code => '37.440-000', :state => state); c.save 
c = City.new(:name => 'Cedro Do Abaete', :zip_code => '35.624-000', :state => state); c.save 
c = City.new(:name => 'Centenario', :zip_code => '36.957-000', :state => state); c.save 
c = City.new(:name => 'Central De Minas', :zip_code => '35.260-000', :state => state); c.save 
c = City.new(:name => 'Central De Santa Helena', :zip_code => '35.267-000', :state => state); c.save 
c = City.new(:name => 'Centralina', :zip_code => '38.390-000', :state => state); c.save 
c = City.new(:name => 'Cervo', :zip_code => '37.565-000', :state => state); c.save 
c = City.new(:name => 'Chacara', :zip_code => '36.110-000', :state => state); c.save 
c = City.new(:name => 'Chale', :zip_code => '36.985-000', :state => state); c.save 
c = City.new(:name => 'Chapada De Minas', :zip_code => '38.528-000', :state => state); c.save 
c = City.new(:name => 'Chapada Do Norte', :zip_code => '39.648-000', :state => state); c.save 
c = City.new(:name => 'Chaveslandia', :zip_code => '38.325-000', :state => state); c.save 
c = City.new(:name => 'Chiador', :zip_code => '36.630-000', :state => state); c.save 
c = City.new(:name => 'Chumbo', :zip_code => '38.713-000', :state => state); c.save 
c = City.new(:name => 'Cipotanea', :zip_code => '36.265-000', :state => state); c.save 
c = City.new(:name => 'Cisneiros', :zip_code => '36.753-000', :state => state); c.save 
c = City.new(:name => 'Claraval', :zip_code => '37.997-000', :state => state); c.save 
c = City.new(:name => 'Claro De Minas', :zip_code => '38.782-000', :state => state); c.save 
c = City.new(:name => 'Claro Dos Pocoes', :zip_code => '39.380-000', :state => state); c.save 
c = City.new(:name => 'Claudio', :zip_code => '35.530-000', :state => state); c.save 
c = City.new(:name => 'Claudio Manuel', :zip_code => '35.429-000', :state => state); c.save 
c = City.new(:name => 'Cocais', :zip_code => '35.975-000', :state => state); c.save 
c = City.new(:name => 'Coco', :zip_code => '35.472-000', :state => state); c.save 
c = City.new(:name => 'Coimbra', :zip_code => '36.550-000', :state => state); c.save 
c = City.new(:name => 'Coluna', :zip_code => '39.770-000', :state => state); c.save 
c = City.new(:name => 'Comendador Gomes', :zip_code => '38.250-000', :state => state); c.save 
c = City.new(:name => 'Comercinho', :zip_code => '39.628-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Da Aparecida', :zip_code => '37.148-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Da Boa Vista', :zip_code => '36.743-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Da Brejauba', :zip_code => '39.721-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Da Ibitipoca', :zip_code => '36.144-000', :state => state); c.save 
c = City.new(:name => 'Icarai De Minas', :zip_code => '39.318-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Das Alagoas', :zip_code => '38.120-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Das Pedras', :zip_code => '37.527-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Ipanema', :zip_code => '36.947-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Itagua', :zip_code => '35.466-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Minas', :zip_code => '35.985-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Tronqueiras', :zip_code => '39.711-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Capim', :zip_code => '35.202-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Formoso', :zip_code => '36.248-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Mato Dentro', :zip_code => '35.860-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Para', :zip_code => '35.668-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Rio Acima', :zip_code => '35.968-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Rio Verde', :zip_code => '37.430-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Dos Ouros', :zip_code => '37.548-000', :state => state); c.save 
c = City.new(:name => 'Concordia De Mucuri', :zip_code => '39.826-000', :state => state); c.save 
c = City.new(:name => 'Condado Do Norte', :zip_code => '39.435-000', :state => state); c.save 
c = City.new(:name => 'Conego Joao Pio', :zip_code => '35.993-000', :state => state); c.save 
c = City.new(:name => 'Conego Marinho', :zip_code => '39.489-000', :state => state); c.save 
c = City.new(:name => 'Confins', :zip_code => '33.500-000', :state => state); c.save 
c = City.new(:name => 'Congonhal', :zip_code => '37.557-000', :state => state); c.save 
c = City.new(:name => 'Congonhas', :zip_code => '36.415-000', :state => state); c.save 
c = City.new(:name => 'Congonhas Do Norte', :zip_code => '35.850-000', :state => state); c.save 
c = City.new(:name => 'Conquista', :zip_code => '38.195-000', :state => state); c.save 
c = City.new(:name => 'Conselheiro Lafaiete', :zip_code => '36.400-000', :state => state); c.save 
c = City.new(:name => 'Conselheiro Mata', :zip_code => '39.106-000', :state => state); c.save 
c = City.new(:name => 'Conselheiro Pena', :zip_code => '35.240-000', :state => state); c.save 
c = City.new(:name => 'Consolacao', :zip_code => '37.670-000', :state => state); c.save 
c = City.new(:name => 'Contagem', :zip_code => '32.000-000', :state => state); c.save 
c = City.new(:name => 'Contrato', :zip_code => '39.676-000', :state => state); c.save 
c = City.new(:name => 'Contria', :zip_code => '39.202-000', :state => state); c.save 
c = City.new(:name => 'Coqueiral', :zip_code => '37.235-000', :state => state); c.save 
c = City.new(:name => 'Coracao De Jesus', :zip_code => '39.340-000', :state => state); c.save 
c = City.new(:name => 'Cordisburgo', :zip_code => '35.780-000', :state => state); c.save 
c = City.new(:name => 'Cordislandia', :zip_code => '37.498-000', :state => state); c.save 
c = City.new(:name => 'Corinto', :zip_code => '39.200-000', :state => state); c.save 
c = City.new(:name => 'Coroaci', :zip_code => '39.710-000', :state => state); c.save 
c = City.new(:name => 'Coromandel', :zip_code => '38.550-000', :state => state); c.save 
c = City.new(:name => 'Coronel Fabriciano', :zip_code => '35.170-000', :state => state); c.save 
c = City.new(:name => 'Coronel Murta', :zip_code => '39.635-000', :state => state); c.save 
c = City.new(:name => 'Coronel Pacheco', :zip_code => '36.155-000', :state => state); c.save 
c = City.new(:name => 'Coronel Xavier Chaves', :zip_code => '36.330-000', :state => state); c.save 
c = City.new(:name => 'Corrego Danta', :zip_code => '38.990-000', :state => state); c.save 
c = City.new(:name => 'Corrego Do Bom Jesus', :zip_code => '37.605-000', :state => state); c.save 
c = City.new(:name => 'Corrego Do Ouro', :zip_code => '37.163-000', :state => state); c.save 
c = City.new(:name => 'Corrego Fundo', :zip_code => '35.578-000', :state => state); c.save 
c = City.new(:name => 'Corrego Novo', :zip_code => '35.345-000', :state => state); c.save 
c = City.new(:name => 'Corregos', :zip_code => '35.864-000', :state => state); c.save 
c = City.new(:name => 'Correia De Almeida', :zip_code => '36.208-000', :state => state); c.save 
c = City.new(:name => 'Correntinho', :zip_code => '39.741-000', :state => state); c.save 
c = City.new(:name => 'Costa Sena', :zip_code => '35.859-000', :state => state); c.save 
c = City.new(:name => 'Costas', :zip_code => '37.665-000', :state => state); c.save 
c = City.new(:name => 'Couto De Magalhaes De Minas', :zip_code => '39.188-000', :state => state); c.save 
c = City.new(:name => 'Crisolia', :zip_code => '37.572-000', :state => state); c.save 
c = City.new(:name => 'Crisolita', :zip_code => '39.885-000', :state => state); c.save 
c = City.new(:name => 'Crispim Jaques', :zip_code => '39.809-000', :state => state); c.save 
c = City.new(:name => 'Cristais', :zip_code => '37.275-000', :state => state); c.save 
c = City.new(:name => 'Cristalia', :zip_code => '39.598-000', :state => state); c.save 
c = City.new(:name => 'Cristiano Otoni', :zip_code => '36.426-000', :state => state); c.save 
c = City.new(:name => 'Cristina', :zip_code => '37.476-000', :state => state); c.save 
c = City.new(:name => 'Crucilandia', :zip_code => '35.520-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Da Fortaleza', :zip_code => '38.735-000', :state => state); c.save 
c = City.new(:name => 'Cruzilia', :zip_code => '37.445-000', :state => state); c.save 
c = City.new(:name => 'Cubas', :zip_code => '35.806-000', :state => state); c.save 
c = City.new(:name => 'Cuparaque', :zip_code => '35.246-000', :state => state); c.save 
c = City.new(:name => 'Curimatai', :zip_code => '39.235-000', :state => state); c.save 
c = City.new(:name => 'Curral De Dentro', :zip_code => '39.998-000', :state => state); c.save 
c = City.new(:name => 'Curvelo', :zip_code => '35.790-000', :state => state); c.save 
c = City.new(:name => 'Datas', :zip_code => '39.130-000', :state => state); c.save 
c = City.new(:name => 'Delfim Moreira', :zip_code => '37.514-000', :state => state); c.save 
c = City.new(:name => 'Delfinopolis', :zip_code => '37.910-000', :state => state); c.save 
c = City.new(:name => 'Deputado Augusto Clementino', :zip_code => '39.152-000', :state => state); c.save 
c = City.new(:name => 'Derribadinha', :zip_code => '35.103-000', :state => state); c.save 
c = City.new(:name => 'Descoberto', :zip_code => '36.690-000', :state => state); c.save 
c = City.new(:name => 'Desembargador Otoni', :zip_code => '39.113-000', :state => state); c.save 
c = City.new(:name => 'Desemboque', :zip_code => '38.193-000', :state => state); c.save 
c = City.new(:name => 'Desterro De Entre Rios', :zip_code => '35.494-000', :state => state); c.save 
c = City.new(:name => 'Desterro Do Melo', :zip_code => '36.210-000', :state => state); c.save 
c = City.new(:name => 'Diamante De Uba', :zip_code => '36.506-000', :state => state); c.save 
c = City.new(:name => 'Diamantina', :zip_code => '39.100-000', :state => state); c.save 
c = City.new(:name => 'Dias', :zip_code => '37.532-000', :state => state); c.save 
c = City.new(:name => 'Dias Tavares/siderurgica', :zip_code => '36.105-000', :state => state); c.save 
c = City.new(:name => 'Diogo De Vasconcelos', :zip_code => '35.437-000', :state => state); c.save 
c = City.new(:name => 'Dionisio', :zip_code => '35.984-000', :state => state); c.save 
c = City.new(:name => 'Divinesia', :zip_code => '36.546-000', :state => state); c.save 
c = City.new(:name => 'Divino', :zip_code => '36.820-000', :state => state); c.save 
c = City.new(:name => 'Divino Das Laranjeiras', :zip_code => '35.265-000', :state => state); c.save 
c = City.new(:name => 'Divino De Virgolandia', :zip_code => '39.716-000', :state => state); c.save 
c = City.new(:name => 'Divino Espirito Santo', :zip_code => '37.147-000', :state => state); c.save 
c = City.new(:name => 'Divinolandia De Minas', :zip_code => '39.735-000', :state => state); c.save 
c = City.new(:name => 'Divinopolis', :zip_code => '35.500-000', :state => state); c.save 
c = City.new(:name => 'Divisa Alegre', :zip_code => '39.995-000', :state => state); c.save 
c = City.new(:name => 'Divisa Nova', :zip_code => '37.134-000', :state => state); c.save 
c = City.new(:name => 'Divisopolis', :zip_code => '39.912-000', :state => state); c.save 
c = City.new(:name => 'Dois De Abril', :zip_code => '39.948-000', :state => state); c.save 
c = City.new(:name => 'Dom Cavati', :zip_code => '35.148-000', :state => state); c.save 
c = City.new(:name => 'Dom Joaquim', :zip_code => '35.865-000', :state => state); c.save 
c = City.new(:name => 'Dom Lara', :zip_code => '35.314-000', :state => state); c.save 
c = City.new(:name => 'Dom Silverio', :zip_code => '35.440-000', :state => state); c.save 
c = City.new(:name => 'Dom Vicoso', :zip_code => '37.474-000', :state => state); c.save 
c = City.new(:name => 'Dona Euzebia', :zip_code => '36.784-000', :state => state); c.save 
c = City.new(:name => 'Dores Da Vitoria', :zip_code => '36.792-000', :state => state); c.save 
c = City.new(:name => 'Dores De Campos', :zip_code => '36.213-000', :state => state); c.save 
c = City.new(:name => 'Dores De Guanhaes', :zip_code => '35.894-000', :state => state); c.save 
c = City.new(:name => 'Dores Do Indaia', :zip_code => '35.610-000', :state => state); c.save 
c = City.new(:name => 'Dores Do Paraibuna', :zip_code => '36.243-000', :state => state); c.save 
c = City.new(:name => 'Dores Do Turvo', :zip_code => '36.513-000', :state => state); c.save 
c = City.new(:name => 'Doresopolis', :zip_code => '37.926-000', :state => state); c.save 
c = City.new(:name => 'Douradoquara', :zip_code => '38.530-000', :state => state); c.save 
c = City.new(:name => 'Doutor Campolina', :zip_code => '35.768-000', :state => state); c.save 
c = City.new(:name => 'Doutor Lund', :zip_code => '33.650-000', :state => state); c.save 
c = City.new(:name => 'Durande', :zip_code => '36.974-000', :state => state); c.save 
c = City.new(:name => 'Edgard Melo', :zip_code => '35.122-000', :state => state); c.save 
c = City.new(:name => 'Eloi Mendes', :zip_code => '37.110-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Caldas', :zip_code => '35.130-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Correia', :zip_code => '35.416-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Navarro', :zip_code => '39.417-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Schnoor', :zip_code => '39.602-000', :state => state); c.save 
c = City.new(:name => 'Engenho Do Ribeiro', :zip_code => '35.602-000', :state => state); c.save 
c = City.new(:name => 'Engenho Novo', :zip_code => '36.643-000', :state => state); c.save 
c = City.new(:name => 'Entre Folhas', :zip_code => '35.324-000', :state => state); c.save 
c = City.new(:name => 'Entre Rios De Minas', :zip_code => '35.490-000', :state => state); c.save 
c = City.new(:name => 'Epaminondas Otoni', :zip_code => '39.866-000', :state => state); c.save 
c = City.new(:name => 'Ermidinha', :zip_code => '39.410-000', :state => state); c.save 
c = City.new(:name => 'Ervalia', :zip_code => '36.555-000', :state => state); c.save 
c = City.new(:name => 'Esmeraldas', :zip_code => '35.740-000', :state => state); c.save 
c = City.new(:name => 'Esmeraldas De Ferros', :zip_code => '35.804-000', :state => state); c.save 
c = City.new(:name => 'Espera Feliz', :zip_code => '36.830-000', :state => state); c.save 
c = City.new(:name => 'Espinosa', :zip_code => '39.510-000', :state => state); c.save 
c = City.new(:name => 'Espirito Santo Do Dourado', :zip_code => '37.566-000', :state => state); c.save 
c = City.new(:name => 'Esteios', :zip_code => '35.596-000', :state => state); c.save 
c = City.new(:name => 'Estevao De Araujo', :zip_code => '36.596-000', :state => state); c.save 
c = City.new(:name => 'Estiva', :zip_code => '37.542-000', :state => state); c.save 
c = City.new(:name => 'Estrela Da Barra', :zip_code => '38.294-000', :state => state); c.save 
c = City.new(:name => 'Estrela Dalva', :zip_code => '36.725-000', :state => state); c.save 
c = City.new(:name => 'Estrela De Jordania', :zip_code => '39.923-000', :state => state); c.save 
c = City.new(:name => 'Estrela Do Indaia', :zip_code => '35.613-000', :state => state); c.save 
c = City.new(:name => 'Estrela Do Sul', :zip_code => '38.525-000', :state => state); c.save 
c = City.new(:name => 'Eugenopolis', :zip_code => '36.855-000', :state => state); c.save 
c = City.new(:name => 'Euxenita', :zip_code => '39.751-000', :state => state); c.save 
c = City.new(:name => 'Ewbank Da Camara', :zip_code => '36.108-000', :state => state); c.save 
c = City.new(:name => 'Expedicionario Alicio', :zip_code => '35.204-000', :state => state); c.save 
c = City.new(:name => 'Extracao', :zip_code => '39.105-000', :state => state); c.save 
c = City.new(:name => 'Extrema', :zip_code => '37.640-000', :state => state); c.save 
c = City.new(:name => 'Fama', :zip_code => '37.138-000', :state => state); c.save 
c = City.new(:name => 'Faria Lemos', :zip_code => '36.840-000', :state => state); c.save 
c = City.new(:name => 'Farias', :zip_code => '39.744-000', :state => state); c.save 
c = City.new(:name => 'Fechados', :zip_code => '35.788-000', :state => state); c.save 
c = City.new(:name => 'Felicio Dos Santos', :zip_code => '39.180-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Rio Preto', :zip_code => '39.185-000', :state => state); c.save 
c = City.new(:name => 'Felisburgo', :zip_code => '39.895-000', :state => state); c.save 
c = City.new(:name => 'Felixlandia', :zip_code => '35.794-000', :state => state); c.save 
c = City.new(:name => 'Fernandes Tourinho', :zip_code => '35.135-000', :state => state); c.save 
c = City.new(:name => 'Fernao Dias', :zip_code => '39.334-000', :state => state); c.save 
c = City.new(:name => 'Ferreiras', :zip_code => '37.493-000', :state => state); c.save 
c = City.new(:name => 'Ferreiropolis', :zip_code => '39.562-000', :state => state); c.save 
c = City.new(:name => 'Ferros', :zip_code => '35.800-000', :state => state); c.save 
c = City.new(:name => 'Ferruginha', :zip_code => '35.245-500', :state => state); c.save 
c = City.new(:name => 'Fervedouro', :zip_code => '36.815-000', :state => state); c.save 
c = City.new(:name => 'Fidalgo', :zip_code => '33.620-000', :state => state); c.save 
c = City.new(:name => 'Fidelandia', :zip_code => '39.851-000', :state => state); c.save 
c = City.new(:name => 'Flor De Minas', :zip_code => '38.315-000', :state => state); c.save 
c = City.new(:name => 'Floresta', :zip_code => '35.263-000', :state => state); c.save 
c = City.new(:name => 'Florestal', :zip_code => '35.690-000', :state => state); c.save 
c = City.new(:name => 'Florestina', :zip_code => '38.450-000', :state => state); c.save 
c = City.new(:name => 'Fonseca', :zip_code => '35.955-000', :state => state); c.save 
c = City.new(:name => 'Formiga', :zip_code => '35.570-000', :state => state); c.save 
c = City.new(:name => 'Formoso', :zip_code => '38.690-000', :state => state); c.save 
c = City.new(:name => 'Fortaleza De Minas', :zip_code => '37.905-000', :state => state); c.save 
c = City.new(:name => 'Fortuna De Minas', :zip_code => '35.760-000', :state => state); c.save 
c = City.new(:name => 'Francisco Badaro', :zip_code => '39.644-000', :state => state); c.save 
c = City.new(:name => 'Francisco Dumont', :zip_code => '39.387-000', :state => state); c.save 
c = City.new(:name => 'Francisco Sa', :zip_code => '39.580-000', :state => state); c.save 
c = City.new(:name => 'Franciscopolis', :zip_code => '39.695-000', :state => state); c.save 
c = City.new(:name => 'Frei Eustaquio', :zip_code => '37.237-000', :state => state); c.save 
c = City.new(:name => 'Frei Gaspar', :zip_code => '39.840-000', :state => state); c.save 
c = City.new(:name => 'Novo Oriente De Minas', :zip_code => '39.817-000', :state => state); c.save 
c = City.new(:name => 'Frei Inocencio', :zip_code => '35.112-000', :state => state); c.save 
c = City.new(:name => 'Sao Felix De Minas', :zip_code => '35.275-000', :state => state); c.save 
c = City.new(:name => 'Frei Lagonegro', :zip_code => '39.708-000', :state => state); c.save 
c = City.new(:name => 'Frei Orlando', :zip_code => '35.629-000', :state => state); c.save 
c = City.new(:name => 'Frei Serafim', :zip_code => '39.832-000', :state => state); c.save 
c = City.new(:name => 'Freire Cardoso', :zip_code => '39.637-000', :state => state); c.save 
c = City.new(:name => 'Fronteira', :zip_code => '38.230-000', :state => state); c.save 
c = City.new(:name => 'Fronteira Dos Vales', :zip_code => '39.870-000', :state => state); c.save 
c = City.new(:name => 'Frutal', :zip_code => '38.200-000', :state => state); c.save 
c = City.new(:name => 'Funchal', :zip_code => '38.802-000', :state => state); c.save 
c = City.new(:name => 'Funilandia', :zip_code => '35.709-000', :state => state); c.save 
c = City.new(:name => 'Furnas', :zip_code => '37.943-000', :state => state); c.save 
c = City.new(:name => 'Furquim', :zip_code => '35.426-000', :state => state); c.save 
c = City.new(:name => 'Galena', :zip_code => '38.753-000', :state => state); c.save 
c = City.new(:name => 'Galileia', :zip_code => '35.250-000', :state => state); c.save 
c = City.new(:name => 'Gameleiras', :zip_code => '39.505-000', :state => state); c.save 
c = City.new(:name => 'Garapuava', :zip_code => '38.615-000', :state => state); c.save 
c = City.new(:name => 'Gaviao', :zip_code => '36.858-000', :state => state); c.save 
c = City.new(:name => 'Jenipapo De Minas', :zip_code => '39.645-000', :state => state); c.save 
c = City.new(:name => 'Glaucilandia', :zip_code => '39.592-000', :state => state); c.save 
c = City.new(:name => 'Glucinio', :zip_code => '39.782-000', :state => state); c.save 
c = City.new(:name => 'Goiana', :zip_code => '36.152-000', :state => state); c.save 
c = City.new(:name => 'Goianases', :zip_code => '37.994-000', :state => state); c.save 
c = City.new(:name => 'Goncalves', :zip_code => '37.680-000', :state => state); c.save 
c = City.new(:name => 'Gonzaga', :zip_code => '39.720-000', :state => state); c.save 
c = City.new(:name => 'Gororos', :zip_code => '35.868-000', :state => state); c.save 
c = City.new(:name => 'Gorutuba', :zip_code => '39.522-500', :state => state); c.save 
c = City.new(:name => 'Gouvea', :zip_code => '39.120-000', :state => state); c.save 
c = City.new(:name => 'Governador Valadares', :zip_code => '35.000-000', :state => state); c.save 
c = City.new(:name => 'Graminea', :zip_code => '37.796-000', :state => state); c.save 
c = City.new(:name => 'Granada', :zip_code => '35.365-700', :state => state); c.save 
c = City.new(:name => 'Grao Mogol', :zip_code => '39.570-000', :state => state); c.save 
c = City.new(:name => 'Grupiara', :zip_code => '38.470-000', :state => state); c.save 
c = City.new(:name => 'Guacui', :zip_code => '39.265-000', :state => state); c.save 
c = City.new(:name => 'Guaipava', :zip_code => '37.125-000', :state => state); c.save 
c = City.new(:name => 'Guanhaes', :zip_code => '39.740-000', :state => state); c.save 
c = City.new(:name => 'Guape', :zip_code => '37.177-000', :state => state); c.save 
c = City.new(:name => 'Guaraciaba', :zip_code => '35.436-000', :state => state); c.save 
c = City.new(:name => 'Guaraciama', :zip_code => '39.397-000', :state => state); c.save 
c = City.new(:name => 'Guaranesia', :zip_code => '37.810-000', :state => state); c.save 
c = City.new(:name => 'Guarani', :zip_code => '36.160-000', :state => state); c.save 
c = City.new(:name => 'Guaranilandia', :zip_code => '39.965-000', :state => state); c.save 
c = City.new(:name => 'Guarara', :zip_code => '36.606-000', :state => state); c.save 
c = City.new(:name => 'Guarataia', :zip_code => '39.833-000', :state => state); c.save 
c = City.new(:name => 'Guarda Dos Ferreiros', :zip_code => '38.803-000', :state => state); c.save 
c = City.new(:name => 'Guarda-mor', :zip_code => '38.570-000', :state => state); c.save 
c = City.new(:name => 'Guardinha', :zip_code => '37.952-000', :state => state); c.save 
c = City.new(:name => 'Guaxima', :zip_code => '38.198-000', :state => state); c.save 
c = City.new(:name => 'Guaxupe', :zip_code => '37.800-000', :state => state); c.save 
c = City.new(:name => 'Guidoval', :zip_code => '36.515-000', :state => state); c.save 
c = City.new(:name => 'Guimarania', :zip_code => '38.730-000', :state => state); c.save 
c = City.new(:name => 'Guinda', :zip_code => '39.103-000', :state => state); c.save 
c = City.new(:name => 'Guiricema', :zip_code => '36.525-000', :state => state); c.save 
c = City.new(:name => 'Gurinhata', :zip_code => '38.310-000', :state => state); c.save 
c = City.new(:name => 'Heliodora', :zip_code => '37.484-000', :state => state); c.save 
c = City.new(:name => 'Hermilo Alves', :zip_code => '36.285-000', :state => state); c.save 
c = City.new(:name => 'Honoropolis', :zip_code => '38.272-000', :state => state); c.save 
c = City.new(:name => 'Iapu', :zip_code => '35.190-000', :state => state); c.save 
c = City.new(:name => 'Ibertioga', :zip_code => '36.225-000', :state => state); c.save 
c = City.new(:name => 'Ibia', :zip_code => '38.950-000', :state => state); c.save 
c = City.new(:name => 'Ibiai', :zip_code => '39.350-000', :state => state); c.save 
c = City.new(:name => 'Ibiracatu', :zip_code => '39.455-000', :state => state); c.save 
c = City.new(:name => 'Ibiraci', :zip_code => '37.990-000', :state => state); c.save 
c = City.new(:name => 'Ibirite', :zip_code => '32.400-000', :state => state); c.save 
c = City.new(:name => 'Ibitira', :zip_code => '35.607-000', :state => state); c.save 
c = City.new(:name => 'Ibitiura De Minas', :zip_code => '37.790-000', :state => state); c.save 
c = City.new(:name => 'Ibituruna', :zip_code => '37.223-000', :state => state); c.save 
c = City.new(:name => 'Igarape', :zip_code => '32.900-000', :state => state); c.save 
c = City.new(:name => 'Igaratinga', :zip_code => '35.695-000', :state => state); c.save 
c = City.new(:name => 'Iguatama', :zip_code => '38.910-000', :state => state); c.save 
c = City.new(:name => 'Ijaci', :zip_code => '37.205-000', :state => state); c.save 
c = City.new(:name => 'Ilheus Do Prata', :zip_code => '35.994-000', :state => state); c.save 
c = City.new(:name => 'Ilicinea', :zip_code => '37.175-000', :state => state); c.save 
c = City.new(:name => 'Imbe De Minas', :zip_code => '35.323-000', :state => state); c.save 
c = City.new(:name => 'Inconfidentes', :zip_code => '37.576-000', :state => state); c.save 
c = City.new(:name => 'Indaiabira', :zip_code => '39.536-000', :state => state); c.save 
c = City.new(:name => 'Indianopolis', :zip_code => '38.490-000', :state => state); c.save 
c = City.new(:name => 'Ingai', :zip_code => '37.215-000', :state => state); c.save 
c = City.new(:name => 'Inhai', :zip_code => '39.111-000', :state => state); c.save 
c = City.new(:name => 'Inhapim', :zip_code => '35.330-000', :state => state); c.save 
c = City.new(:name => 'Inhauma', :zip_code => '35.710-000', :state => state); c.save 
c = City.new(:name => 'Inimutaba', :zip_code => '35.796-000', :state => state); c.save 
c = City.new(:name => 'Ipaba', :zip_code => '35.198-000', :state => state); c.save 
c = City.new(:name => 'Ipanema', :zip_code => '36.950-000', :state => state); c.save 
c = City.new(:name => 'Ipatinga', :zip_code => '35.160-000', :state => state); c.save 
c = City.new(:name => 'Ipiacu', :zip_code => '38.350-000', :state => state); c.save 
c = City.new(:name => 'Ipoema', :zip_code => '35.905-000', :state => state); c.save 
c = City.new(:name => 'Ipuiuna', :zip_code => '37.559-000', :state => state); c.save 
c = City.new(:name => 'Irai De Minas', :zip_code => '38.510-000', :state => state); c.save 
c = City.new(:name => 'Itabira', :zip_code => '35.900-000', :state => state); c.save 
c = City.new(:name => 'Itabirinha De Mantena', :zip_code => '35.280-000', :state => state); c.save 
c = City.new(:name => 'Itabirito', :zip_code => '35.450-000', :state => state); c.save 
c = City.new(:name => 'Itaboca', :zip_code => '36.138-000', :state => state); c.save 
c = City.new(:name => 'Itacambira', :zip_code => '39.594-000', :state => state); c.save 
c = City.new(:name => 'Itacarambi', :zip_code => '39.470-000', :state => state); c.save 
c = City.new(:name => 'Itaci', :zip_code => '37.155-000', :state => state); c.save 
c = City.new(:name => 'Itacolomi', :zip_code => '35.861-000', :state => state); c.save 
c = City.new(:name => 'Itaguara', :zip_code => '35.514-000', :state => state); c.save 
c = City.new(:name => 'Itaim', :zip_code => '37.546-000', :state => state); c.save 
c = City.new(:name => 'Itaipe', :zip_code => '39.815-000', :state => state); c.save 
c = City.new(:name => 'Itajuba', :zip_code => '37.500-000', :state => state); c.save 
c = City.new(:name => 'Itajutiba', :zip_code => '35.331-000', :state => state); c.save 
c = City.new(:name => 'Itamarandiba', :zip_code => '39.670-000', :state => state); c.save 
c = City.new(:name => 'Itamarati', :zip_code => '39.993-000', :state => state); c.save 
c = City.new(:name => 'Itamarati De Minas', :zip_code => '36.788-000', :state => state); c.save 
c = City.new(:name => 'Itambacuri', :zip_code => '39.830-000', :state => state); c.save 
c = City.new(:name => 'Itambe Do Mato Dentro', :zip_code => '35.820-000', :state => state); c.save 
c = City.new(:name => 'Itamirim', :zip_code => '39.515-000', :state => state); c.save 
c = City.new(:name => 'Itamogi', :zip_code => '37.955-000', :state => state); c.save 
c = City.new(:name => 'Itamonte', :zip_code => '37.466-000', :state => state); c.save 
c = City.new(:name => 'Itamuri', :zip_code => '36.886-000', :state => state); c.save 
c = City.new(:name => 'Itanhandu', :zip_code => '37.464-000', :state => state); c.save 
c = City.new(:name => 'Itanhomi', :zip_code => '35.120-000', :state => state); c.save 
c = City.new(:name => 'Itaobim', :zip_code => '39.625-000', :state => state); c.save 
c = City.new(:name => 'Itapagipe', :zip_code => '38.240-000', :state => state); c.save 
c = City.new(:name => 'Itapanhoacanga', :zip_code => '39.145-000', :state => state); c.save 
c = City.new(:name => 'Itapecerica', :zip_code => '35.550-000', :state => state); c.save 
c = City.new(:name => 'Itapeva', :zip_code => '37.655-000', :state => state); c.save 
c = City.new(:name => 'Itapiru', :zip_code => '39.955-000', :state => state); c.save 
c = City.new(:name => 'Itapirucu', :zip_code => '36.756-000', :state => state); c.save 
c = City.new(:name => 'Itatiaiucu', :zip_code => '35.685-000', :state => state); c.save 
c = City.new(:name => 'Itau De Minas', :zip_code => '37.975-000', :state => state); c.save 
c = City.new(:name => 'Itauna', :zip_code => '35.680-000', :state => state); c.save 
c = City.new(:name => 'Itaverava', :zip_code => '36.440-000', :state => state); c.save 
c = City.new(:name => 'Iterere', :zip_code => '37.513-000', :state => state); c.save 
c = City.new(:name => 'Itinga', :zip_code => '39.610-000', :state => state); c.save 
c = City.new(:name => 'Itira', :zip_code => '39.605-000', :state => state); c.save 
c = City.new(:name => 'Itueta', :zip_code => '35.220-000', :state => state); c.save 
c = City.new(:name => 'Itui', :zip_code => '36.684-000', :state => state); c.save 
c = City.new(:name => 'Ituiutaba', :zip_code => '38.300-000', :state => state); c.save 
c = City.new(:name => 'Itumirim', :zip_code => '37.210-000', :state => state); c.save 
c = City.new(:name => 'Iturama', :zip_code => '38.280-000', :state => state); c.save 
c = City.new(:name => 'Itutinga', :zip_code => '36.390-000', :state => state); c.save 
c = City.new(:name => 'Jaboticatubas', :zip_code => '35.830-000', :state => state); c.save 
c = City.new(:name => 'Jacarandira', :zip_code => '36.342-000', :state => state); c.save 
c = City.new(:name => 'Jacare', :zip_code => '39.613-000', :state => state); c.save 
c = City.new(:name => 'Jacinto', :zip_code => '39.930-000', :state => state); c.save 
c = City.new(:name => 'Jacui', :zip_code => '37.965-000', :state => state); c.save 
c = City.new(:name => 'Jacutinga', :zip_code => '37.590-000', :state => state); c.save 
c = City.new(:name => 'Jaguaracu', :zip_code => '35.188-000', :state => state); c.save 
c = City.new(:name => 'Jaguarao', :zip_code => '39.933-000', :state => state); c.save 
c = City.new(:name => 'Jaguaritira', :zip_code => '39.692-000', :state => state); c.save 
c = City.new(:name => 'Jaiba', :zip_code => '39.508-000', :state => state); c.save 
c = City.new(:name => 'Jampruca', :zip_code => '39.837-000', :state => state); c.save 
c = City.new(:name => 'Janauba', :zip_code => '39.440-000', :state => state); c.save 
c = City.new(:name => 'Januaria', :zip_code => '39.480-000', :state => state); c.save 
c = City.new(:name => 'Japaraiba', :zip_code => '35.580-000', :state => state); c.save 
c = City.new(:name => 'Japonvar', :zip_code => '39.335-000', :state => state); c.save 
c = City.new(:name => 'Jardinesia', :zip_code => '38.142-000', :state => state); c.save 
c = City.new(:name => 'Jeceaba', :zip_code => '35.498-000', :state => state); c.save 
c = City.new(:name => 'Jequeri', :zip_code => '35.390-000', :state => state); c.save 
c = City.new(:name => 'Jequitai', :zip_code => '39.370-000', :state => state); c.save 
c = City.new(:name => 'Jequitiba', :zip_code => '35.767-000', :state => state); c.save 
c = City.new(:name => 'Jequitinhonha', :zip_code => '39.960-000', :state => state); c.save 
c = City.new(:name => 'Jesuania', :zip_code => '37.485-000', :state => state); c.save 
c = City.new(:name => 'Joaima', :zip_code => '39.890-000', :state => state); c.save 
c = City.new(:name => 'Joanesia', :zip_code => '35.168-000', :state => state); c.save 
c = City.new(:name => 'Joao Monlevade', :zip_code => '35.930-000', :state => state); c.save 
c = City.new(:name => 'Joao Pinheiro', :zip_code => '38.770-000', :state => state); c.save 
c = City.new(:name => 'Joaquim Felicio', :zip_code => '39.240-000', :state => state); c.save 
c = City.new(:name => 'Jordania', :zip_code => '39.920-000', :state => state); c.save 
c = City.new(:name => 'Nova Uniao', :zip_code => '34.990-000', :state => state); c.save 
c = City.new(:name => 'Jose Goncalves De Minas', :zip_code => '39.642-000', :state => state); c.save 
c = City.new(:name => 'Jose Raydan', :zip_code => '39.775-000', :state => state); c.save 
c = City.new(:name => 'Joselandia', :zip_code => '36.435-000', :state => state); c.save 
c = City.new(:name => 'Josenopolis', :zip_code => '39.575-000', :state => state); c.save 
c = City.new(:name => 'Juatuba', :zip_code => '35.675-000', :state => state); c.save 
c = City.new(:name => 'Jubai', :zip_code => '38.196-000', :state => state); c.save 
c = City.new(:name => 'Juiracu', :zip_code => '35.996-000', :state => state); c.save 
c = City.new(:name => 'Juiz De Fora', :zip_code => '36.000-000', :state => state); c.save 
c = City.new(:name => 'Junco De Minas', :zip_code => '39.693-500', :state => state); c.save 
c = City.new(:name => 'Juramento', :zip_code => '39.590-000', :state => state); c.save 
c = City.new(:name => 'Jureia', :zip_code => '37.117-000', :state => state); c.save 
c = City.new(:name => 'Juruaia', :zip_code => '37.805-000', :state => state); c.save 
c = City.new(:name => 'Jurumirim', :zip_code => '35.375-000', :state => state); c.save 
c = City.new(:name => 'Justinopolis', :zip_code => '33.800-000', :state => state); c.save 
c = City.new(:name => 'Juvenilia', :zip_code => '39.467-000', :state => state); c.save 
c = City.new(:name => 'Lacerdinha', :zip_code => '36.802-000', :state => state); c.save 
c = City.new(:name => 'Ladainha', :zip_code => '39.825-000', :state => state); c.save 
c = City.new(:name => 'Lagamar', :zip_code => '38.785-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Bonita', :zip_code => '35.782-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Da Prata', :zip_code => '35.590-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Dos Patos', :zip_code => '39.360-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Dourada', :zip_code => '36.345-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Formosa', :zip_code => '38.720-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Grande', :zip_code => '38.755-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Santa', :zip_code => '33.400-000', :state => state); c.save 
c = City.new(:name => 'Lajinha', :zip_code => '36.980-000', :state => state); c.save 
c = City.new(:name => 'Lambari', :zip_code => '37.480-000', :state => state); c.save 
c = City.new(:name => 'Lamim', :zip_code => '36.455-000', :state => state); c.save 
c = City.new(:name => 'Lamounier', :zip_code => '35.551-000', :state => state); c.save 
c = City.new(:name => 'Lapinha', :zip_code => '33.450-000', :state => state); c.save 
c = City.new(:name => 'Laranjal', :zip_code => '36.760-000', :state => state); c.save 
c = City.new(:name => 'Laranjeiras De Caldas', :zip_code => '37.782-000', :state => state); c.save 
c = City.new(:name => 'Lassance', :zip_code => '39.250-000', :state => state); c.save 
c = City.new(:name => 'Lavras', :zip_code => '37.200-000', :state => state); c.save 
c = City.new(:name => 'Leandro Ferreira', :zip_code => '35.657-000', :state => state); c.save 
c = City.new(:name => 'Leme Do Prado', :zip_code => '39.655-000', :state => state); c.save 
c = City.new(:name => 'Leopoldina', :zip_code => '36.700-000', :state => state); c.save 
c = City.new(:name => 'Levinopolis', :zip_code => '39.485-000', :state => state); c.save 
c = City.new(:name => 'Liberdade', :zip_code => '37.350-000', :state => state); c.save 
c = City.new(:name => 'Lima Duarte', :zip_code => '36.140-000', :state => state); c.save 
c = City.new(:name => 'Limeira Doeste', :zip_code => '38.295-000', :state => state); c.save 
c = City.new(:name => 'Limeira De Mantena', :zip_code => '35.296-000', :state => state); c.save 
c = City.new(:name => 'Lobo Leite', :zip_code => '36.419-000', :state => state); c.save 
c = City.new(:name => 'Lontra', :zip_code => '39.437-000', :state => state); c.save 
c = City.new(:name => 'Lourenco Velho', :zip_code => '37.507-000', :state => state); c.save 
c = City.new(:name => 'Lufa', :zip_code => '39.824-000', :state => state); c.save 
c = City.new(:name => 'Luisburgo', :zip_code => '36.923-000', :state => state); c.save 
c = City.new(:name => 'Luislandia', :zip_code => '39.336-000', :state => state); c.save 
c = City.new(:name => 'Luiz Pires De Minas', :zip_code => '39.344-000', :state => state); c.save 
c = City.new(:name => 'Luizlandia Do Oeste', :zip_code => '38.776-000', :state => state); c.save 
c = City.new(:name => 'Luminarias', :zip_code => '37.240-000', :state => state); c.save 
c = City.new(:name => 'Luminosa', :zip_code => '37.535-000', :state => state); c.save 
c = City.new(:name => 'Luz', :zip_code => '35.595-000', :state => state); c.save 
c = City.new(:name => 'Macaia', :zip_code => '37.221-000', :state => state); c.save 
c = City.new(:name => 'Machacalis', :zip_code => '39.873-000', :state => state); c.save 
c = City.new(:name => 'Machado', :zip_code => '37.750-000', :state => state); c.save 
c = City.new(:name => 'Macuco De Minas', :zip_code => '37.212-000', :state => state); c.save 
c = City.new(:name => 'Madre De Deus De Minas', :zip_code => '37.305-000', :state => state); c.save 
c = City.new(:name => 'Mae Dos Homens', :zip_code => '39.797-000', :state => state); c.save 
c = City.new(:name => 'Major Ezequiel', :zip_code => '35.953-000', :state => state); c.save 
c = City.new(:name => 'Major Porto', :zip_code => '38.710-000', :state => state); c.save 
c = City.new(:name => 'Malacacheta', :zip_code => '39.690-000', :state => state); c.save 
c = City.new(:name => 'Mamonas', :zip_code => '39.516-000', :state => state); c.save 
c = City.new(:name => 'Manga', :zip_code => '39.460-000', :state => state); c.save 
c = City.new(:name => 'Manhuacu', :zip_code => '36.900-000', :state => state); c.save 
c = City.new(:name => 'Manhumirim', :zip_code => '36.970-000', :state => state); c.save 
c = City.new(:name => 'Mantena', :zip_code => '35.290-000', :state => state); c.save 
c = City.new(:name => 'Mantiqueira', :zip_code => '36.242-000', :state => state); c.save 
c = City.new(:name => 'Mar De Espanha', :zip_code => '36.640-000', :state => state); c.save 
c = City.new(:name => 'Marambainha', :zip_code => '39.813-000', :state => state); c.save 
c = City.new(:name => 'Maravilhas', :zip_code => '35.666-000', :state => state); c.save 
c = City.new(:name => 'Maria Da Fe', :zip_code => '37.517-000', :state => state); c.save 
c = City.new(:name => 'Mariana', :zip_code => '35.420-000', :state => state); c.save 
c = City.new(:name => 'Marilac', :zip_code => '35.115-000', :state => state); c.save 
c = City.new(:name => 'Marilandia', :zip_code => '35.553-000', :state => state); c.save 
c = City.new(:name => 'Mario Campos', :zip_code => '32.470-000', :state => state); c.save 
c = City.new(:name => 'Maripa De Minas', :zip_code => '36.608-000', :state => state); c.save 
c = City.new(:name => 'Marlieria', :zip_code => '35.185-000', :state => state); c.save 
c = City.new(:name => 'Marmelopolis', :zip_code => '37.516-000', :state => state); c.save 
c = City.new(:name => 'Martinho Campos', :zip_code => '35.606-000', :state => state); c.save 
c = City.new(:name => 'Martins Soares', :zip_code => '36.972-000', :state => state); c.save 
c = City.new(:name => 'Mata Verde', :zip_code => '39.915-000', :state => state); c.save 
c = City.new(:name => 'Materlandia', :zip_code => '39.755-000', :state => state); c.save 
c = City.new(:name => 'Mateus Leme', :zip_code => '35.670-000', :state => state); c.save 
c = City.new(:name => 'Matias Barbosa', :zip_code => '36.120-000', :state => state); c.save 
c = City.new(:name => 'Matias Cardoso', :zip_code => '39.478-000', :state => state); c.save 
c = City.new(:name => 'Matipo', :zip_code => '35.367-000', :state => state); c.save 
c = City.new(:name => 'Mato Verde', :zip_code => '39.527-000', :state => state); c.save 
c = City.new(:name => 'Matozinhos', :zip_code => '35.720-000', :state => state); c.save 
c = City.new(:name => 'Matutina', :zip_code => '38.870-000', :state => state); c.save 
c = City.new(:name => 'Medeiros', :zip_code => '38.930-000', :state => state); c.save 
c = City.new(:name => 'Medina', :zip_code => '39.620-000', :state => state); c.save 
c = City.new(:name => 'Melo Viana', :zip_code => '35.750-000', :state => state); c.save 
c = City.new(:name => 'Mendanha', :zip_code => '39.101-000', :state => state); c.save 
c = City.new(:name => 'Mendes Pimentel', :zip_code => '35.270-000', :state => state); c.save 
c = City.new(:name => 'Merces', :zip_code => '36.190-000', :state => state); c.save 
c = City.new(:name => 'Merces De Agua Limpa', :zip_code => '36.352-000', :state => state); c.save 
c = City.new(:name => 'Mesquita', :zip_code => '35.166-000', :state => state); c.save 
c = City.new(:name => 'Mestre Caetano', :zip_code => '34.750-000', :state => state); c.save 
c = City.new(:name => 'Miguel Burnier', :zip_code => '35.414-000', :state => state); c.save 
c = City.new(:name => 'Milagre', :zip_code => '37.959-000', :state => state); c.save 
c = City.new(:name => 'Milho Verde', :zip_code => '39.155-000', :state => state); c.save 
c = City.new(:name => 'Minas Novas', :zip_code => '39.650-000', :state => state); c.save 
c = City.new(:name => 'Minduri', :zip_code => '37.447-000', :state => state); c.save 
c = City.new(:name => 'Mirabela', :zip_code => '39.420-000', :state => state); c.save 
c = City.new(:name => 'Miradouro', :zip_code => '36.893-000', :state => state); c.save 
c = City.new(:name => 'Mirai', :zip_code => '36.790-000', :state => state); c.save 
c = City.new(:name => 'Miralta', :zip_code => '39.415-000', :state => state); c.save 
c = City.new(:name => 'Mirantao', :zip_code => '37.345-000', :state => state); c.save 
c = City.new(:name => 'Miraporanga', :zip_code => '38.418-000', :state => state); c.save 
c = City.new(:name => 'Miravania', :zip_code => '39.465-000', :state => state); c.save 
c = City.new(:name => 'Missionario', :zip_code => '36.262-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Das Missoes', :zip_code => '39.475-000', :state => state); c.save 
c = City.new(:name => 'Mocambeiro', :zip_code => '35.725-000', :state => state); c.save 
c = City.new(:name => 'Mocambinho', :zip_code => '39.524-000', :state => state); c.save 
c = City.new(:name => 'Moeda', :zip_code => '35.470-000', :state => state); c.save 
c = City.new(:name => 'Moema', :zip_code => '35.604-000', :state => state); c.save 
c = City.new(:name => 'Monjolinho De Minas', :zip_code => '38.722-000', :state => state); c.save 
c = City.new(:name => 'Monjolos', :zip_code => '39.215-000', :state => state); c.save 
c = City.new(:name => 'Monsenhor Horta', :zip_code => '35.425-000', :state => state); c.save 
c = City.new(:name => 'Monsenhor Isidro', :zip_code => '36.445-000', :state => state); c.save 
c = City.new(:name => 'Monsenhor Joao Alexandre', :zip_code => '35.532-000', :state => state); c.save 
c = City.new(:name => 'Monsenhor Paulo', :zip_code => '37.405-000', :state => state); c.save 
c = City.new(:name => 'Montalvania', :zip_code => '39.495-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre De Minas', :zip_code => '38.420-000', :state => state); c.save 
c = City.new(:name => 'Monte Azul', :zip_code => '39.500-000', :state => state); c.save 
c = City.new(:name => 'Monte Belo', :zip_code => '37.115-000', :state => state); c.save 
c = City.new(:name => 'Monte Carmelo', :zip_code => '38.500-000', :state => state); c.save 
c = City.new(:name => 'Monte Celeste', :zip_code => '36.532-000', :state => state); c.save 
c = City.new(:name => 'Monte Rei', :zip_code => '39.468-000', :state => state); c.save 
c = City.new(:name => 'Monte Santo De Minas', :zip_code => '37.958-000', :state => state); c.save 
c = City.new(:name => 'Monte Siao', :zip_code => '37.580-000', :state => state); c.save 
c = City.new(:name => 'Monte Verde', :zip_code => '37.653-000', :state => state); c.save 
c = City.new(:name => 'Montes Claros', :zip_code => '39.400-000', :state => state); c.save 
c = City.new(:name => 'Montezuma', :zip_code => '39.547-000', :state => state); c.save 
c = City.new(:name => 'Morada Nova De Minas', :zip_code => '35.628-000', :state => state); c.save 
c = City.new(:name => 'Morro', :zip_code => '39.313-000', :state => state); c.save 
c = City.new(:name => 'Morro Da Garca', :zip_code => '35.798-000', :state => state); c.save 
c = City.new(:name => 'Morro Do Ferro', :zip_code => '35.541-000', :state => state); c.save 
c = City.new(:name => 'Morro Do Pilar', :zip_code => '35.875-000', :state => state); c.save 
c = City.new(:name => 'Morro Vermelho', :zip_code => '34.940-000', :state => state); c.save 
c = City.new(:name => 'Mucuri', :zip_code => '39.809-800', :state => state); c.save 
c = City.new(:name => 'Mundo Novo De Minas', :zip_code => '35.208-000', :state => state); c.save 
c = City.new(:name => 'Munhoz', :zip_code => '37.620-000', :state => state); c.save 
c = City.new(:name => 'Muquem', :zip_code => '39.423-000', :state => state); c.save 
c = City.new(:name => 'Muriae', :zip_code => '36.880-000', :state => state); c.save 
c = City.new(:name => 'Mutum', :zip_code => '36.955-000', :state => state); c.save 
c = City.new(:name => 'Muzambinho', :zip_code => '37.890-000', :state => state); c.save 
c = City.new(:name => 'Nacip Raydan', :zip_code => '39.718-000', :state => state); c.save 
c = City.new(:name => 'Nanuque', :zip_code => '39.860-000', :state => state); c.save 
c = City.new(:name => 'Naque', :zip_code => '35.157-000', :state => state); c.save 
c = City.new(:name => 'Natercia', :zip_code => '37.524-000', :state => state); c.save 
c = City.new(:name => 'Nazare De Minas', :zip_code => '37.253-000', :state => state); c.save 
c = City.new(:name => 'Nazareno', :zip_code => '36.370-000', :state => state); c.save 
c = City.new(:name => 'Nelson De Sena', :zip_code => '39.706-000', :state => state); c.save 
c = City.new(:name => 'Neolandia', :zip_code => '35.552-000', :state => state); c.save 
c = City.new(:name => 'Nepomuceno', :zip_code => '37.250-000', :state => state); c.save 
c = City.new(:name => 'Nhandutiba', :zip_code => '39.463-000', :state => state); c.save 
c = City.new(:name => 'Nicolandia', :zip_code => '35.235-000', :state => state); c.save 
c = City.new(:name => 'Nova Belem', :zip_code => '35.298-000', :state => state); c.save 
c = City.new(:name => 'Nova Era', :zip_code => '35.920-000', :state => state); c.save 
c = City.new(:name => 'Nova Esperanca', :zip_code => '39.414-000', :state => state); c.save 
c = City.new(:name => 'Nova Lima', :zip_code => '34.000-000', :state => state); c.save 
c = City.new(:name => 'Nova Minda', :zip_code => '39.335-700', :state => state); c.save 
c = City.new(:name => 'Nova Modica', :zip_code => '35.113-000', :state => state); c.save 
c = City.new(:name => 'Nova Ponte', :zip_code => '38.160-000', :state => state); c.save 
c = City.new(:name => 'Nova Porteirinha', :zip_code => '39.525-000', :state => state); c.save 
c = City.new(:name => 'Nova Resende', :zip_code => '37.860-000', :state => state); c.save 
c = City.new(:name => 'Nova Serrana', :zip_code => '35.519-000', :state => state); c.save 
c = City.new(:name => 'Novilhona', :zip_code => '39.821-000', :state => state); c.save 
c = City.new(:name => 'Novo Cruzeiro', :zip_code => '39.820-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '39.853-000', :state => state); c.save 
c = City.new(:name => 'Ocidente', :zip_code => '36.959-000', :state => state); c.save 
c = City.new(:name => 'Olaria', :zip_code => '36.145-000', :state => state); c.save 
c = City.new(:name => 'Olegario Maciel', :zip_code => '37.509-000', :state => state); c.save 
c = City.new(:name => 'Olhos-dagua', :zip_code => '39.398-000', :state => state); c.save 
c = City.new(:name => 'Olhos Dagua Do Oeste', :zip_code => '38.772-000', :state => state); c.save 
c = City.new(:name => 'Olimpio Campos', :zip_code => '39.433-000', :state => state); c.save 
c = City.new(:name => 'Olimpio Noronha', :zip_code => '37.488-000', :state => state); c.save 
c = City.new(:name => 'Oliveira', :zip_code => '35.540-000', :state => state); c.save 
c = City.new(:name => 'Oliveira Fortes', :zip_code => '36.250-000', :state => state); c.save 
c = City.new(:name => 'Onca De Pitangui', :zip_code => '35.655-000', :state => state); c.save 
c = City.new(:name => 'Oratorios', :zip_code => '35.439-000', :state => state); c.save 
c = City.new(:name => 'Orizania', :zip_code => '36.828-000', :state => state); c.save 
c = City.new(:name => 'Ouro Branco', :zip_code => '36.420-000', :state => state); c.save 
c = City.new(:name => 'Ouro Fino', :zip_code => '37.570-000', :state => state); c.save 
c = City.new(:name => 'Ouro Preto', :zip_code => '35.400-000', :state => state); c.save 
c = City.new(:name => 'Ouro Verde De Minas', :zip_code => '39.855-000', :state => state); c.save 
c = City.new(:name => 'Paciencia', :zip_code => '39.524-500', :state => state); c.save 
c = City.new(:name => 'Padre Brito', :zip_code => '36.209-000', :state => state); c.save 
c = City.new(:name => 'Padre Carvalho', :zip_code => '39.573-000', :state => state); c.save 
c = City.new(:name => 'Padre Felisberto', :zip_code => '35.445-000', :state => state); c.save 
c = City.new(:name => 'Padre Fialho', :zip_code => '35.367-700', :state => state); c.save 
c = City.new(:name => 'Padre Joao Afonso', :zip_code => '39.672-000', :state => state); c.save 
c = City.new(:name => 'Padre Paraiso', :zip_code => '39.818-000', :state => state); c.save 
c = City.new(:name => 'Padre Viegas', :zip_code => '35.422-000', :state => state); c.save 
c = City.new(:name => 'Pai Pedro', :zip_code => '39.517-000', :state => state); c.save 
c = City.new(:name => 'Paineiras', :zip_code => '35.622-000', :state => state); c.save 
c = City.new(:name => 'Pains', :zip_code => '35.582-000', :state => state); c.save 
c = City.new(:name => 'Paiolinho', :zip_code => '37.758-000', :state => state); c.save 
c = City.new(:name => 'Paiva', :zip_code => '36.195-000', :state => state); c.save 
c = City.new(:name => 'Palma', :zip_code => '36.750-000', :state => state); c.save 
c = City.new(:name => 'Palmeiral', :zip_code => '37.725-000', :state => state); c.save 
c = City.new(:name => 'Palmital Dos Carvalhos', :zip_code => '36.278-000', :state => state); c.save 
c = City.new(:name => 'Palmopolis', :zip_code => '39.945-000', :state => state); c.save 
c = City.new(:name => 'Pantano', :zip_code => '37.543-000', :state => state); c.save 
c = City.new(:name => 'Papagaios', :zip_code => '35.669-000', :state => state); c.save 
c = City.new(:name => 'Para De Minas', :zip_code => '35.660-000', :state => state); c.save 
c = City.new(:name => 'Paracatu', :zip_code => '38.600-000', :state => state); c.save 
c = City.new(:name => 'Paraguacu', :zip_code => '37.120-000', :state => state); c.save 
c = City.new(:name => 'Paraguai', :zip_code => '36.565-000', :state => state); c.save 
c = City.new(:name => 'Paraiso Garcia', :zip_code => '36.236-000', :state => state); c.save 
c = City.new(:name => 'Paraisopolis', :zip_code => '37.660-000', :state => state); c.save 
c = City.new(:name => 'Paraopeba', :zip_code => '35.774-000', :state => state); c.save 
c = City.new(:name => 'Paredao De Minas', :zip_code => '39.285-000', :state => state); c.save 
c = City.new(:name => 'Parque Durval De Barros', :zip_code => '32.440-000', :state => state); c.save 
c = City.new(:name => 'Parque Industrial', :zip_code => '32.000-000', :state => state); c.save 
c = City.new(:name => 'Passa Dez', :zip_code => '35.343-000', :state => state); c.save 
c = City.new(:name => 'Passa Quatro', :zip_code => '37.460-000', :state => state); c.save 
c = City.new(:name => 'Passa Tempo', :zip_code => '35.537-000', :state => state); c.save 
c = City.new(:name => 'Passa Vinte', :zip_code => '37.330-000', :state => state); c.save 
c = City.new(:name => 'Passabem', :zip_code => '35.810-000', :state => state); c.save 
c = City.new(:name => 'Passagem De Mariana', :zip_code => '35.421-000', :state => state); c.save 
c = City.new(:name => 'Passos', :zip_code => '37.900-000', :state => state); c.save 
c = City.new(:name => 'Patis', :zip_code => '39.425-000', :state => state); c.save 
c = City.new(:name => 'Patos De Minas', :zip_code => '38.700-000', :state => state); c.save 
c = City.new(:name => 'Patrimonio', :zip_code => '38.145-000', :state => state); c.save 
c = City.new(:name => 'Patrocinio', :zip_code => '38.740-000', :state => state); c.save 
c = City.new(:name => 'Patrocinio Do Muriae', :zip_code => '36.860-000', :state => state); c.save 
c = City.new(:name => 'Paula Candido', :zip_code => '36.544-000', :state => state); c.save 
c = City.new(:name => 'Paulistas', :zip_code => '39.765-000', :state => state); c.save 
c = City.new(:name => 'Pavao', :zip_code => '39.814-000', :state => state); c.save 
c = City.new(:name => 'Pe Do Morro', :zip_code => '37.462-000', :state => state); c.save 
c = City.new(:name => 'Pecanha', :zip_code => '39.700-000', :state => state); c.save 
c = City.new(:name => 'Pedra Azul', :zip_code => '39.970-000', :state => state); c.save 
c = City.new(:name => 'Pedra Bonita', :zip_code => '35.364-000', :state => state); c.save 
c = City.new(:name => 'Pedra Do Anta', :zip_code => '36.585-000', :state => state); c.save 
c = City.new(:name => 'Pedra Do Indaia', :zip_code => '35.565-000', :state => state); c.save 
c = City.new(:name => 'Pedra Do Sino', :zip_code => '36.282-000', :state => state); c.save 
c = City.new(:name => 'Pedra Dourada', :zip_code => '36.847-000', :state => state); c.save 
c = City.new(:name => 'Pedra Grande', :zip_code => '39.910-000', :state => state); c.save 
c = City.new(:name => 'Pedra Menina', :zip_code => '39.175-000', :state => state); c.save 
c = City.new(:name => 'Pedralva', :zip_code => '37.520-000', :state => state); c.save 
c = City.new(:name => 'Pedras De Maria Da Cruz', :zip_code => '39.492-000', :state => state); c.save 
c = City.new(:name => 'Pedrinopolis', :zip_code => '38.178-000', :state => state); c.save 
c = City.new(:name => 'Pedro Leopoldo', :zip_code => '33.600-000', :state => state); c.save 
c = City.new(:name => 'Pedro Lessa', :zip_code => '39.158-000', :state => state); c.save 
c = City.new(:name => 'Pedro Teixeira', :zip_code => '36.148-000', :state => state); c.save 
c = City.new(:name => 'Pedro Versiani', :zip_code => '39.809-300', :state => state); c.save 
c = City.new(:name => 'Penedia', :zip_code => '34.930-000', :state => state); c.save 
c = City.new(:name => 'Penha De Franca', :zip_code => '39.675-000', :state => state); c.save 
c = City.new(:name => 'Penha Do Capim', :zip_code => '35.212-000', :state => state); c.save 
c = City.new(:name => 'Penha Do Norte', :zip_code => '35.241-000', :state => state); c.save 
c = City.new(:name => 'Penha Longa', :zip_code => '36.635-000', :state => state); c.save 
c = City.new(:name => 'Pequeri', :zip_code => '36.610-000', :state => state); c.save 
c = City.new(:name => 'Pequi', :zip_code => '35.667-000', :state => state); c.save 
c = City.new(:name => 'Perdigao', :zip_code => '35.515-000', :state => state); c.save 
c = City.new(:name => 'Perdilandia', :zip_code => '38.328-000', :state => state); c.save 
c = City.new(:name => 'Perdizes', :zip_code => '38.170-000', :state => state); c.save 
c = City.new(:name => 'Perdoes', :zip_code => '37.260-000', :state => state); c.save 
c = City.new(:name => 'Pereirinhas', :zip_code => '35.492-000', :state => state); c.save 
c = City.new(:name => 'Periquito', :zip_code => '35.156-000', :state => state); c.save 
c = City.new(:name => 'Perpetuo Socorro', :zip_code => '35.196-000', :state => state); c.save 
c = City.new(:name => 'Pescador', :zip_code => '35.114-000', :state => state); c.save 
c = City.new(:name => 'Petunia', :zip_code => '37.865-000', :state => state); c.save 
c = City.new(:name => 'Piacatuba', :zip_code => '36.708-000', :state => state); c.save 
c = City.new(:name => 'Piau', :zip_code => '36.157-000', :state => state); c.save 
c = City.new(:name => 'Piedade De Ponte Nova', :zip_code => '35.382-000', :state => state); c.save 
c = City.new(:name => 'Piedade Do Paraopeba', :zip_code => '35.464-000', :state => state); c.save 
c = City.new(:name => 'Piedade Do Rio Grande', :zip_code => '36.227-000', :state => state); c.save 
c = City.new(:name => 'Piedade Dos Gerais', :zip_code => '35.526-000', :state => state); c.save 
c = City.new(:name => 'Pimenta', :zip_code => '35.585-000', :state => state); c.save 
c = City.new(:name => 'Pindaibas', :zip_code => '38.715-000', :state => state); c.save 
c = City.new(:name => 'Pinheirinhos', :zip_code => '37.461-000', :state => state); c.save 
c = City.new(:name => 'Pinheiros Altos', :zip_code => '36.490-000', :state => state); c.save 
c = City.new(:name => 'Pinhotiba', :zip_code => '36.857-000', :state => state); c.save 
c = City.new(:name => 'Pintos Negreiros', :zip_code => '37.518-000', :state => state); c.save 
c = City.new(:name => 'Piracaiba', :zip_code => '38.452-000', :state => state); c.save 
c = City.new(:name => 'Piracema', :zip_code => '35.536-000', :state => state); c.save 
c = City.new(:name => 'Pirajuba', :zip_code => '38.210-000', :state => state); c.save 
c = City.new(:name => 'Piranga', :zip_code => '36.480-000', :state => state); c.save 
c = City.new(:name => 'Pirangucu', :zip_code => '37.511-000', :state => state); c.save 
c = City.new(:name => 'Piranguinho', :zip_code => '37.508-000', :state => state); c.save 
c = City.new(:name => 'Piranguita', :zip_code => '36.462-000', :state => state); c.save 
c = City.new(:name => 'Pirapanema', :zip_code => '36.889-000', :state => state); c.save 
c = City.new(:name => 'Pirapetinga', :zip_code => '36.730-000', :state => state); c.save 
c = City.new(:name => 'Pirapora', :zip_code => '39.270-000', :state => state); c.save 
c = City.new(:name => 'Pirauba', :zip_code => '36.170-000', :state => state); c.save 
c = City.new(:name => 'Pires E Albuquerque', :zip_code => '39.394-000', :state => state); c.save 
c = City.new(:name => 'Piscamba', :zip_code => '35.393-000', :state => state); c.save 
c = City.new(:name => 'Pitangui', :zip_code => '35.650-000', :state => state); c.save 
c = City.new(:name => 'Pitarana', :zip_code => '39.498-000', :state => state); c.save 
c = City.new(:name => 'Piui', :zip_code => '37.925-000', :state => state); c.save 
c = City.new(:name => 'Planalto De Minas', :zip_code => '39.114-000', :state => state); c.save 
c = City.new(:name => 'Planura', :zip_code => '38.220-000', :state => state); c.save 
c = City.new(:name => 'Plautino Soares', :zip_code => '35.144-000', :state => state); c.save 
c = City.new(:name => 'Poaia', :zip_code => '39.783-000', :state => state); c.save 
c = City.new(:name => 'Poco Fundo', :zip_code => '37.757-000', :state => state); c.save 
c = City.new(:name => 'Pocoes De Paineiras', :zip_code => '35.623-000', :state => state); c.save 
c = City.new(:name => 'Pocos De Caldas', :zip_code => '37.700-000', :state => state); c.save 
c = City.new(:name => 'Pocrane', :zip_code => '36.960-000', :state => state); c.save 
c = City.new(:name => 'Pompeu', :zip_code => '35.640-000', :state => state); c.save 
c = City.new(:name => 'Poncianos', :zip_code => '38.126-000', :state => state); c.save 
c = City.new(:name => 'Pontalete', :zip_code => '37.192-000', :state => state); c.save 
c = City.new(:name => 'Ponte Alta', :zip_code => '38.106-000', :state => state); c.save 
c = City.new(:name => 'Ponte Alta De Minas', :zip_code => '36.805-000', :state => state); c.save 
c = City.new(:name => 'Ponte Dos Ciganos', :zip_code => '39.343-000', :state => state); c.save 
c = City.new(:name => 'Ponte Firme', :zip_code => '38.754-000', :state => state); c.save 
c = City.new(:name => 'Ponte Nova', :zip_code => '35.430-000', :state => state); c.save 
c = City.new(:name => 'Pontevila', :zip_code => '35.577-000', :state => state); c.save 
c = City.new(:name => 'Ponto Chique', :zip_code => '39.328-000', :state => state); c.save 
c = City.new(:name => 'Ponto Do Marambaia', :zip_code => '39.812-000', :state => state); c.save 
c = City.new(:name => 'Ponto Dos Volantes', :zip_code => '39.615-000', :state => state); c.save 
c = City.new(:name => 'Porteirinha', :zip_code => '39.520-000', :state => state); c.save 
c = City.new(:name => 'Porto Agrario', :zip_code => '39.469-000', :state => state); c.save 
c = City.new(:name => 'Porto Das Flores', :zip_code => '36.128-000', :state => state); c.save 
c = City.new(:name => 'Porto Dos Mendes', :zip_code => '37.271-000', :state => state); c.save 
c = City.new(:name => 'Porto Firme', :zip_code => '36.576-000', :state => state); c.save 
c = City.new(:name => 'Pote', :zip_code => '39.827-000', :state => state); c.save 
c = City.new(:name => 'Pouso Alegre', :zip_code => '37.550-000', :state => state); c.save 
c = City.new(:name => 'Pouso Alto', :zip_code => '37.468-000', :state => state); c.save 
c = City.new(:name => 'Prados', :zip_code => '36.320-000', :state => state); c.save 
c = City.new(:name => 'Prata', :zip_code => '38.140-000', :state => state); c.save 
c = City.new(:name => 'Pratapolis', :zip_code => '37.970-000', :state => state); c.save 
c = City.new(:name => 'Pratinha', :zip_code => '38.960-000', :state => state); c.save 
c = City.new(:name => 'Presidente Bernardes', :zip_code => '36.475-000', :state => state); c.save 
c = City.new(:name => 'Presidente Juscelino', :zip_code => '35.797-000', :state => state); c.save 
c = City.new(:name => 'Presidente Kubitschek', :zip_code => '39.135-000', :state => state); c.save 
c = City.new(:name => 'Presidente Olegario', :zip_code => '38.750-000', :state => state); c.save 
c = City.new(:name => 'Presidente Pena', :zip_code => '39.865-000', :state => state); c.save 
c = City.new(:name => 'Alto Jequitiba', :zip_code => '36.976-000', :state => state); c.save 
c = City.new(:name => 'Professor Sperber', :zip_code => '36.988-000', :state => state); c.save 
c = City.new(:name => 'Providencia', :zip_code => '36.706-000', :state => state); c.save 
c = City.new(:name => 'Prudente De Morais', :zip_code => '35.715-000', :state => state); c.save 
c = City.new(:name => 'Quartel Do Sacramento', :zip_code => '35.342-000', :state => state); c.save 
c = City.new(:name => 'Quartel Geral', :zip_code => '35.625-000', :state => state); c.save 
c = City.new(:name => 'Quatituba', :zip_code => '35.222-000', :state => state); c.save 
c = City.new(:name => 'Queixada', :zip_code => '39.823-000', :state => state); c.save 
c = City.new(:name => 'Queluzita', :zip_code => '36.424-000', :state => state); c.save 
c = City.new(:name => 'Quem-quem', :zip_code => '39.443-000', :state => state); c.save 
c = City.new(:name => 'Quilombo', :zip_code => '39.753-000', :state => state); c.save 
c = City.new(:name => 'Quintinos', :zip_code => '38.845-000', :state => state); c.save 
c = City.new(:name => 'Raposos', :zip_code => '34.400-000', :state => state); c.save 
c = City.new(:name => 'Raul Soares', :zip_code => '35.350-000', :state => state); c.save 
c = City.new(:name => 'Ravena', :zip_code => '34.740-000', :state => state); c.save 
c = City.new(:name => 'Recreio', :zip_code => '36.740-000', :state => state); c.save 
c = City.new(:name => 'Reduto', :zip_code => '36.920-000', :state => state); c.save 
c = City.new(:name => 'Resende Costa', :zip_code => '36.340-000', :state => state); c.save 
c = City.new(:name => 'Resplendor', :zip_code => '35.230-000', :state => state); c.save 
c = City.new(:name => 'Ressaquinha', :zip_code => '36.270-000', :state => state); c.save 
c = City.new(:name => 'Riachinho', :zip_code => '38.640-000', :state => state); c.save 
c = City.new(:name => 'Riacho Da Cruz', :zip_code => '39.483-000', :state => state); c.save 
c = City.new(:name => 'Riacho Dos Machados', :zip_code => '39.529-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Das Neves', :zip_code => '33.800-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao De Sao Domingos', :zip_code => '36.915-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Vermelho', :zip_code => '37.264-000', :state => state); c.save 
c = City.new(:name => 'Ribeiro Junqueira', :zip_code => '36.707-000', :state => state); c.save 
c = City.new(:name => 'Ribeiros', :zip_code => '37.492-000', :state => state); c.save 
c = City.new(:name => 'Rio Acima', :zip_code => '34.300-000', :state => state); c.save 
c = City.new(:name => 'Rio Casca', :zip_code => '35.370-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Mortes', :zip_code => '36.315-000', :state => state); c.save 
c = City.new(:name => 'Rio Do Prado', :zip_code => '39.940-000', :state => state); c.save 
c = City.new(:name => 'Rio Doce', :zip_code => '35.442-000', :state => state); c.save 
c = City.new(:name => 'Rio Espera', :zip_code => '36.460-000', :state => state); c.save 
c = City.new(:name => 'Rio Manso', :zip_code => '35.525-000', :state => state); c.save 
c = City.new(:name => 'Rio Melo', :zip_code => '36.465-000', :state => state); c.save 
c = City.new(:name => 'Rio Novo', :zip_code => '36.150-000', :state => state); c.save 
c = City.new(:name => 'Rio Paranaiba', :zip_code => '38.810-000', :state => state); c.save 
c = City.new(:name => 'Rio Pardo De Minas', :zip_code => '39.530-000', :state => state); c.save 
c = City.new(:name => 'Rio Piracicaba', :zip_code => '35.940-000', :state => state); c.save 
c = City.new(:name => 'Rio Pomba', :zip_code => '36.180-000', :state => state); c.save 
c = City.new(:name => 'Rio Pretinho', :zip_code => '39.808-000', :state => state); c.save 
c = City.new(:name => 'Rio Preto', :zip_code => '36.130-000', :state => state); c.save 
c = City.new(:name => 'Rio Vermelho', :zip_code => '39.170-000', :state => state); c.save 
c = City.new(:name => 'Ritapolis', :zip_code => '36.335-000', :state => state); c.save 
c = City.new(:name => 'Roca Grande', :zip_code => '36.682-000', :state => state); c.save 
c = City.new(:name => 'Rocas Novas', :zip_code => '34.950-000', :state => state); c.save 
c = City.new(:name => 'Rochedo De Minas', :zip_code => '36.604-000', :state => state); c.save 
c = City.new(:name => 'Rodeador', :zip_code => '39.218-000', :state => state); c.save 
c = City.new(:name => 'Rodeiro', :zip_code => '36.510-000', :state => state); c.save 
c = City.new(:name => 'Rodrigo Silva', :zip_code => '35.407-000', :state => state); c.save 
c = City.new(:name => 'Romaria', :zip_code => '38.520-000', :state => state); c.save 
c = City.new(:name => 'Rosario Da Limeira', :zip_code => '36.878-000', :state => state); c.save 
c = City.new(:name => 'Rosario De Minas', :zip_code => '36.106-000', :state => state); c.save 
c = City.new(:name => 'Roseiral', :zip_code => '36.958-000', :state => state); c.save 
c = City.new(:name => 'Rubelita', :zip_code => '39.565-000', :state => state); c.save 
c = City.new(:name => 'Rubim', :zip_code => '39.950-000', :state => state); c.save 
c = City.new(:name => 'Sabara', :zip_code => '34.500-000', :state => state); c.save 
c = City.new(:name => 'Sabinopolis', :zip_code => '39.750-000', :state => state); c.save 
c = City.new(:name => 'Sacramento', :zip_code => '38.190-000', :state => state); c.save 
c = City.new(:name => 'Salinas', :zip_code => '39.560-000', :state => state); c.save 
c = City.new(:name => 'Salitre De Minas', :zip_code => '38.743-000', :state => state); c.save 
c = City.new(:name => 'Salto Da Divisa', :zip_code => '39.925-000', :state => state); c.save 
c = City.new(:name => 'Sanatorio Santa Fe', :zip_code => '37.412-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara', :zip_code => '35.960-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara Do Leste', :zip_code => '35.328-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara Do Monte Verde', :zip_code => '36.132-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara Do Tugurio', :zip_code => '36.215-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Da Aparecida', :zip_code => '37.119-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz De Botumirim', :zip_code => '39.595-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz De Minas', :zip_code => '36.328-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz De Salinas', :zip_code => '39.563-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Escalvado', :zip_code => '35.384-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Prata', :zip_code => '37.815-000', :state => state); c.save 
c = City.new(:name => 'Santa Efigenia De Minas', :zip_code => '39.725-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe De Minas', :zip_code => '39.295-000', :state => state); c.save 
c = City.new(:name => 'Santa Filomena', :zip_code => '36.945-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel', :zip_code => '32.850-000', :state => state); c.save 
c = City.new(:name => 'Santa Juliana', :zip_code => '38.175-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia', :zip_code => '33.000-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Da Serra', :zip_code => '38.774-000', :state => state); c.save 
c = City.new(:name => 'Santa Margarida', :zip_code => '36.910-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria De Itabira', :zip_code => '35.910-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Salto', :zip_code => '39.928-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Suacui', :zip_code => '39.780-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita De Minas', :zip_code => '35.326-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Da Estrela', :zip_code => '38.526-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita De Caldas', :zip_code => '37.775-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita De Jacutinga', :zip_code => '36.135-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita De Ouro Preto', :zip_code => '35.409-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Cedro', :zip_code => '35.791-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Ibitipoca', :zip_code => '36.235-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Itueto', :zip_code => '35.225-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Rio Do Peixe', :zip_code => '35.807-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Sapucai', :zip_code => '37.540-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Durao', :zip_code => '35.428-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa Da Serra', :zip_code => '38.805-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa De Lima', :zip_code => '39.412-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa Dos Dourados', :zip_code => '38.555-000', :state => state); c.save 
c = City.new(:name => 'Santa Teresa Do Bonito', :zip_code => '39.702-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha De Minas', :zip_code => '35.688-000', :state => state); c.save 
c = City.new(:name => 'Santa Vitoria', :zip_code => '38.320-000', :state => state); c.save 
c = City.new(:name => 'Santana Da Vargem', :zip_code => '37.195-000', :state => state); c.save 
c = City.new(:name => 'Santana De Caldas', :zip_code => '37.785-000', :state => state); c.save 
c = City.new(:name => 'Santana De Cataguases', :zip_code => '36.795-000', :state => state); c.save 
c = City.new(:name => 'Santana De Patos', :zip_code => '38.711-000', :state => state); c.save 
c = City.new(:name => 'Santana De Pirapama', :zip_code => '35.785-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Alfie', :zip_code => '35.997-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Aracuai', :zip_code => '39.618-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Campestre', :zip_code => '36.783-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Capivari', :zip_code => '37.469-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Deserto', :zip_code => '36.620-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Garambeu', :zip_code => '36.146-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Jacare', :zip_code => '37.278-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Manhuacu', :zip_code => '36.940-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Paraiso', :zip_code => '35.167-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Paraopeba', :zip_code => '35.475-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Riacho', :zip_code => '35.845-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Tabuleiro', :zip_code => '35.358-000', :state => state); c.save 
c = City.new(:name => 'Santana Dos Montes', :zip_code => '36.430-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Boa Vista', :zip_code => '39.434-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Fortaleza', :zip_code => '35.801-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Vargem Alegre', :zip_code => '35.522-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Amparo', :zip_code => '37.262-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Aventureiro', :zip_code => '36.670-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Boqueirao', :zip_code => '38.620-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Cruzeiro', :zip_code => '37.255-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Gloria', :zip_code => '36.897-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Grama', :zip_code => '35.388-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Itambe', :zip_code => '39.160-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Jacinto', :zip_code => '39.935-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Leite', :zip_code => '35.413-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Manhuacu', :zip_code => '35.321-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Monte', :zip_code => '35.560-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Mucuri', :zip_code => '39.691-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Norte', :zip_code => '35.863-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Pirapetinga', :zip_code => '36.485-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Retiro', :zip_code => '39.538-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Rio Abaixo', :zip_code => '35.880-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Dos Araujos', :zip_code => '39.796-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Dos Campos', :zip_code => '35.505-000', :state => state); c.save 
c = City.new(:name => 'Santo Hilario', :zip_code => '35.586-000', :state => state); c.save 
c = City.new(:name => 'Santo Hipolito', :zip_code => '39.210-000', :state => state); c.save 
c = City.new(:name => 'Santos Dumont', :zip_code => '36.240-000', :state => state); c.save 
c = City.new(:name => 'Sao Bartolomeu', :zip_code => '35.406-000', :state => state); c.save 
c = City.new(:name => 'Sao Benedito', :zip_code => '33.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento Abade', :zip_code => '37.414-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento De Caldas', :zip_code => '37.778-000', :state => state); c.save 
c = City.new(:name => 'Sao Bras Do Suacui', :zip_code => '35.495-000', :state => state); c.save 
c = City.new(:name => 'Sao Braz', :zip_code => '38.788-000', :state => state); c.save 
c = City.new(:name => 'Sao Candido', :zip_code => '35.320-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '36.675-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Da Bocaina', :zip_code => '36.142-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Das Dores', :zip_code => '35.335-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Prata', :zip_code => '35.995-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '39.300-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Paula', :zip_code => '35.543-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Sales', :zip_code => '38.260-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Gloria', :zip_code => '36.810-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Humaita', :zip_code => '36.956-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo', :zip_code => '36.530-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo', :zip_code => '39.342-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo Da Piedade', :zip_code => '39.723-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo De Tumiritinga', :zip_code => '35.126-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo Do Baguari', :zip_code => '39.704-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo De Botelhos', :zip_code => '37.723-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Abaete', :zip_code => '38.790-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Monte', :zip_code => '35.455-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Para', :zip_code => '35.516-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Rio Abaixo', :zip_code => '35.935-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Rio Das Pedras', :zip_code => '39.153-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Sapucai', :zip_code => '37.490-000', :state => state); c.save 
c = City.new(:name => 'Sao Gotardo', :zip_code => '38.800-000', :state => state); c.save 
c = City.new(:name => 'Sao Jeronimo Dos Pocoes', :zip_code => '38.975-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Batista Do Gloria', :zip_code => '37.920-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Chapada', :zip_code => '39.110-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Lagoa', :zip_code => '39.355-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Mata', :zip_code => '37.568-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Ponte', :zip_code => '39.430-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Sapucaia', :zip_code => '36.765-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Serra', :zip_code => '36.245-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Serra Negra', :zip_code => '38.748-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Vereda', :zip_code => '39.413-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Manteninha', :zip_code => '35.277-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Del Rei', :zip_code => '36.300-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Bonito', :zip_code => '39.528-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Jacutinga', :zip_code => '35.322-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Manhuacu', :zip_code => '36.918-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Oriente', :zip_code => '35.146-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Pacui', :zip_code => '39.365-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Paraiso', :zip_code => '39.540-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Evangelista', :zip_code => '39.705-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Nepomuceno', :zip_code => '36.680-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '39.348-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '39.488-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim De Bicas', :zip_code => '32.920-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Barra', :zip_code => '37.945-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Bela Vista', :zip_code => '38.804-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Lapa', :zip_code => '33.350-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Pedra Menina', :zip_code => '36.831-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Safira', :zip_code => '39.785-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Varginha', :zip_code => '35.694-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Das Tronqueiras', :zip_code => '35.108-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Alegre', :zip_code => '37.510-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Barreiro', :zip_code => '37.927-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Divino', :zip_code => '39.848-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Goiabal', :zip_code => '35.986-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Itueto', :zip_code => '35.228-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Jacuri', :zip_code => '39.707-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Mantimento', :zip_code => '36.990-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Mato Dentro', :zip_code => '37.574-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Pantano', :zip_code => '37.549-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Paraopeba', :zip_code => '35.468-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Lopes', :zip_code => '36.141-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Salgados', :zip_code => '35.512-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco', :zip_code => '37.470-000', :state => state); c.save 
c = City.new(:name => 'Sao Manoel Do Guaiacu', :zip_code => '36.787-000', :state => state); c.save 
c = City.new(:name => 'Sao Mateus De Minas', :zip_code => '37.652-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Anta', :zip_code => '36.590-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Da Garca', :zip_code => '39.411-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Da Uniao', :zip_code => '37.855-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Das Tabocas', :zip_code => '39.494-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro De Caldas', :zip_code => '37.787-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Avai', :zip_code => '36.906-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Gloria', :zip_code => '36.819-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Jequitinhonha', :zip_code => '39.961-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Suacui', :zip_code => '39.784-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Dos Ferros', :zip_code => '35.360-000', :state => state); c.save 
c = City.new(:name => 'Sao Romao', :zip_code => '39.290-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque De Minas', :zip_code => '37.928-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Anta', :zip_code => '35.334-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Barra', :zip_code => '35.192-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Bela Vista', :zip_code => '37.567-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Vala', :zip_code => '35.215-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Vargem Alegre', :zip_code => '36.793-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Vitoria', :zip_code => '36.316-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Barreado', :zip_code => '36.131-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Barreiro', :zip_code => '39.839-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Bonsucesso', :zip_code => '35.862-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Bugre', :zip_code => '39.712-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Gil', :zip_code => '35.493-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Maranhao', :zip_code => '39.795-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Oculo', :zip_code => '35.356-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Oeste', :zip_code => '35.506-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Paraiso', :zip_code => '37.950-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Pontal', :zip_code => '38.292-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Rio Preto', :zip_code => '35.815-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Rio Verde', :zip_code => '37.467-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Sacramento', :zip_code => '36.908-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Soberbo', :zip_code => '35.387-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Dos Pocoes', :zip_code => '39.497-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Dos Robertos', :zip_code => '37.592-000', :state => state); c.save 
c = City.new(:name => 'Sao Tiago', :zip_code => '36.350-000', :state => state); c.save 
c = City.new(:name => 'Sao Tomas De Aquino', :zip_code => '37.960-000', :state => state); c.save 
c = City.new(:name => 'Sao Tome Das Letras', :zip_code => '37.418-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '35.707-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente Da Estrela', :zip_code => '35.355-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente De Minas', :zip_code => '37.370-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente Do Rio Doce', :zip_code => '35.143-000', :state => state); c.save 
c = City.new(:name => 'Sapucai', :zip_code => '37.594-000', :state => state); c.save 
c = City.new(:name => 'Sapucai-mirim', :zip_code => '37.690-000', :state => state); c.save 
c = City.new(:name => 'Sapucaia', :zip_code => '35.311-000', :state => state); c.save 
c = City.new(:name => 'Sapucaia De Guanhaes', :zip_code => '39.742-000', :state => state); c.save 
c = City.new(:name => 'Sarandira', :zip_code => '36.104-000', :state => state); c.save 
c = City.new(:name => 'Sardoa', :zip_code => '39.728-000', :state => state); c.save 
c = City.new(:name => 'Sarzedo', :zip_code => '32.450-000', :state => state); c.save 
c = City.new(:name => 'Saudade', :zip_code => '36.645-000', :state => state); c.save 
c = City.new(:name => 'Senador Amaral', :zip_code => '37.615-000', :state => state); c.save 
c = City.new(:name => 'Senador Cortes', :zip_code => '36.650-000', :state => state); c.save 
c = City.new(:name => 'Senador Firmino', :zip_code => '36.540-000', :state => state); c.save 
c = City.new(:name => 'Senador Jose Bento', :zip_code => '37.558-000', :state => state); c.save 
c = City.new(:name => 'Senador Melo Viana', :zip_code => '35.170-000', :state => state); c.save 
c = City.new(:name => 'Senador Modestino Goncalves', :zip_code => '39.190-000', :state => state); c.save 
c = City.new(:name => 'Senador Mourao', :zip_code => '39.112-000', :state => state); c.save 
c = City.new(:name => 'Senhora Da Gloria', :zip_code => '39.212-000', :state => state); c.save 
c = City.new(:name => 'Senhora Da Penha', :zip_code => '35.136-000', :state => state); c.save 
c = City.new(:name => 'Senhora Das Dores', :zip_code => '36.207-000', :state => state); c.save 
c = City.new(:name => 'Senhora De Oliveira', :zip_code => '36.470-000', :state => state); c.save 
c = City.new(:name => 'Senhora Do Carmo', :zip_code => '35.907-000', :state => state); c.save 
c = City.new(:name => 'Senhora Do Porto', :zip_code => '39.745-000', :state => state); c.save 
c = City.new(:name => 'Senhora Dos Remedios', :zip_code => '36.275-000', :state => state); c.save 
c = City.new(:name => 'Sereno', :zip_code => '36.777-000', :state => state); c.save 
c = City.new(:name => 'Sericita', :zip_code => '35.368-000', :state => state); c.save 
c = City.new(:name => 'Seritinga', :zip_code => '37.454-000', :state => state); c.save 
c = City.new(:name => 'Serra Azul', :zip_code => '35.674-000', :state => state); c.save 
c = City.new(:name => 'Serra Azul De Minas', :zip_code => '39.165-000', :state => state); c.save 
c = City.new(:name => 'Serra Bonita', :zip_code => '38.665-000', :state => state); c.save 
c = City.new(:name => 'Serra Da Canastra', :zip_code => '37.929-000', :state => state); c.save 
c = City.new(:name => 'Serra Da Saudade', :zip_code => '35.617-000', :state => state); c.save 
c = City.new(:name => 'Serra Das Araras', :zip_code => '39.310-000', :state => state); c.save 
c = City.new(:name => 'Serra Do Camapua', :zip_code => '35.491-000', :state => state); c.save 
c = City.new(:name => 'Serra Do Salitre', :zip_code => '38.760-000', :state => state); c.save 
c = City.new(:name => 'Serra Dos Aimores', :zip_code => '39.868-000', :state => state); c.save 
c = City.new(:name => 'Serra Dos Lemes', :zip_code => '37.885-000', :state => state); c.save 
c = City.new(:name => 'Serra Nova', :zip_code => '39.532-000', :state => state); c.save 
c = City.new(:name => 'Serrania', :zip_code => '37.136-000', :state => state); c.save 
c = City.new(:name => 'Serranopolis De Minas', :zip_code => '39.518-000', :state => state); c.save 
c = City.new(:name => 'Serranos', :zip_code => '37.452-000', :state => state); c.save 
c = City.new(:name => 'Serro', :zip_code => '39.150-000', :state => state); c.save 
c = City.new(:name => 'Sertaozinho', :zip_code => '37.565-500', :state => state); c.save 
c = City.new(:name => 'Sete Cachoeiras', :zip_code => '35.802-000', :state => state); c.save 
c = City.new(:name => 'Sete Lagoas', :zip_code => '35.700-000', :state => state); c.save 
c = City.new(:name => 'Setubinha', :zip_code => '39.688-000', :state => state); c.save 
c = City.new(:name => 'Silvano', :zip_code => '38.744-000', :state => state); c.save 
c = City.new(:name => 'Silveira Carvalho', :zip_code => '36.873-000', :state => state); c.save 
c = City.new(:name => 'Silveirania', :zip_code => '36.185-000', :state => state); c.save 
c = City.new(:name => 'Silvestre', :zip_code => '36.572-000', :state => state); c.save 
c = City.new(:name => 'Silvianopolis', :zip_code => '37.560-000', :state => state); c.save 
c = City.new(:name => 'Simao Campos', :zip_code => '39.432-000', :state => state); c.save 
c = City.new(:name => 'Simao Pereira', :zip_code => '36.123-000', :state => state); c.save 
c = City.new(:name => 'Simonesia', :zip_code => '36.930-000', :state => state); c.save 
c = City.new(:name => 'Sobral Pinto', :zip_code => '36.782-000', :state => state); c.save 
c = City.new(:name => 'Sobralia', :zip_code => '35.145-000', :state => state); c.save 
c = City.new(:name => 'Soledade De Minas', :zip_code => '37.478-000', :state => state); c.save 
c = City.new(:name => 'Sopa', :zip_code => '39.102-000', :state => state); c.save 
c = City.new(:name => 'Tabajara', :zip_code => '35.333-000', :state => state); c.save 
c = City.new(:name => 'Tabauna', :zip_code => '35.206-000', :state => state); c.save 
c = City.new(:name => 'Tabuao', :zip_code => '37.315-000', :state => state); c.save 
c = City.new(:name => 'Tabuleiro', :zip_code => '36.165-000', :state => state); c.save 
c = City.new(:name => 'Taiobeiras', :zip_code => '39.550-000', :state => state); c.save 
c = City.new(:name => 'Taparuba', :zip_code => '36.953-000', :state => state); c.save 
c = City.new(:name => 'Tapira', :zip_code => '38.185-000', :state => state); c.save 
c = City.new(:name => 'Tapirai', :zip_code => '38.980-000', :state => state); c.save 
c = City.new(:name => 'Tapuirama', :zip_code => '38.417-000', :state => state); c.save 
c = City.new(:name => 'Taquaracu De Minas', :zip_code => '33.980-000', :state => state); c.save 
c = City.new(:name => 'Taruacu', :zip_code => '36.688-000', :state => state); c.save 
c = City.new(:name => 'Tarumirim', :zip_code => '35.140-000', :state => state); c.save 
c = City.new(:name => 'Tebas', :zip_code => '36.702-000', :state => state); c.save 
c = City.new(:name => 'Teixeiras', :zip_code => '36.580-000', :state => state); c.save 
c = City.new(:name => 'Tejuco', :zip_code => '39.484-000', :state => state); c.save 
c = City.new(:name => 'Teofilo Otoni', :zip_code => '39.800-000', :state => state); c.save 
c = City.new(:name => 'Terra Branca', :zip_code => '39.393-000', :state => state); c.save 
c = City.new(:name => 'Timoteo', :zip_code => '35.180-000', :state => state); c.save 
c = City.new(:name => 'Tiradentes', :zip_code => '36.325-000', :state => state); c.save 
c = City.new(:name => 'Tiros', :zip_code => '38.880-000', :state => state); c.save 
c = City.new(:name => 'Tobati', :zip_code => '38.953-000', :state => state); c.save 
c = City.new(:name => 'Tocandira', :zip_code => '39.523-000', :state => state); c.save 
c = City.new(:name => 'Tocantins', :zip_code => '36.512-000', :state => state); c.save 
c = City.new(:name => 'Tocos Do Moji', :zip_code => '37.563-000', :state => state); c.save 
c = City.new(:name => 'Toledo', :zip_code => '37.630-000', :state => state); c.save 
c = City.new(:name => 'Tombos', :zip_code => '36.844-000', :state => state); c.save 
c = City.new(:name => 'Topazio', :zip_code => '39.807-000', :state => state); c.save 
c = City.new(:name => 'Torreoes', :zip_code => '36.107-000', :state => state); c.save 
c = City.new(:name => 'Tres Coracoes', :zip_code => '37.410-000', :state => state); c.save 
c = City.new(:name => 'Tres Ilhas', :zip_code => '36.127-000', :state => state); c.save 
c = City.new(:name => 'Tres Marias', :zip_code => '39.205-000', :state => state); c.save 
c = City.new(:name => 'Tres Pontas', :zip_code => '37.190-000', :state => state); c.save 
c = City.new(:name => 'Trimonte', :zip_code => '36.723-000', :state => state); c.save 
c = City.new(:name => 'Tuiutinga', :zip_code => '36.528-000', :state => state); c.save 
c = City.new(:name => 'Tumiritinga', :zip_code => '35.125-000', :state => state); c.save 
c = City.new(:name => 'Tupaciguara', :zip_code => '38.430-000', :state => state); c.save 
c = City.new(:name => 'Tuparece', :zip_code => '39.623-000', :state => state); c.save 
c = City.new(:name => 'Turmalina', :zip_code => '39.660-000', :state => state); c.save 
c = City.new(:name => 'Turvolandia', :zip_code => '37.496-000', :state => state); c.save 
c = City.new(:name => 'Uba', :zip_code => '36.500-000', :state => state); c.save 
c = City.new(:name => 'Ubai', :zip_code => '39.320-000', :state => state); c.save 
c = City.new(:name => 'Ubaporanga', :zip_code => '35.338-000', :state => state); c.save 
c = City.new(:name => 'Ubari', :zip_code => '36.508-000', :state => state); c.save 
c = City.new(:name => 'Uberaba', :zip_code => '38.000-000', :state => state); c.save 
c = City.new(:name => 'Uberlandia', :zip_code => '38.400-000', :state => state); c.save 
c = City.new(:name => 'Umburatiba', :zip_code => '39.878-000', :state => state); c.save 
c = City.new(:name => 'Umbuzeiro', :zip_code => '39.439-000', :state => state); c.save 
c = City.new(:name => 'Unai', :zip_code => '38.610-000', :state => state); c.save 
c = City.new(:name => 'Uniao De Minas', :zip_code => '38.288-000', :state => state); c.save 
c = City.new(:name => 'Urucania', :zip_code => '35.380-000', :state => state); c.save 
c = City.new(:name => 'Urucuia', :zip_code => '39.315-000', :state => state); c.save 
c = City.new(:name => 'Usina Monte Alegre', :zip_code => '37.118-000', :state => state); c.save 
c = City.new(:name => 'Vai-volta', :zip_code => '35.142-000', :state => state); c.save 
c = City.new(:name => 'Valao', :zip_code => '39.829-000', :state => state); c.save 
c = City.new(:name => 'Valo Fundo', :zip_code => '39.213-000', :state => state); c.save 
c = City.new(:name => 'Vargem Alegre', :zip_code => '35.199-000', :state => state); c.save 
c = City.new(:name => 'Vargem Bonita', :zip_code => '37.922-000', :state => state); c.save 
c = City.new(:name => 'Vargem Grande Do Rio Pardo', :zip_code => '39.535-000', :state => state); c.save 
c = City.new(:name => 'Vargem Linda', :zip_code => '35.998-000', :state => state); c.save 
c = City.new(:name => 'Varginha', :zip_code => '37.000-000', :state => state); c.save 
c = City.new(:name => 'Varjao De Minas', :zip_code => '38.794-000', :state => state); c.save 
c = City.new(:name => 'Varzea Da Palma', :zip_code => '39.260-000', :state => state); c.save 
c = City.new(:name => 'Varzelandia', :zip_code => '39.450-000', :state => state); c.save 
c = City.new(:name => 'Vau-acu', :zip_code => '35.435-000', :state => state); c.save 
c = City.new(:name => 'Vazante', :zip_code => '38.780-000', :state => state); c.save 
c = City.new(:name => 'Vera Cruz De Minas', :zip_code => '33.680-000', :state => state); c.save 
c = City.new(:name => 'Verdelandia', :zip_code => '39.458-000', :state => state); c.save 
c = City.new(:name => 'Veredas', :zip_code => '38.775-000', :state => state); c.save 
c = City.new(:name => 'Veredinha', :zip_code => '39.663-000', :state => state); c.save 
c = City.new(:name => 'Verissimo', :zip_code => '38.150-000', :state => state); c.save 
c = City.new(:name => 'Vermelho', :zip_code => '36.890-000', :state => state); c.save 
c = City.new(:name => 'Vermelho Novo', :zip_code => '35.359-000', :state => state); c.save 
c = City.new(:name => 'Vermelho Velho', :zip_code => '35.354-000', :state => state); c.save 
c = City.new(:name => 'Vespasiano', :zip_code => '33.200-000', :state => state); c.save 
c = City.new(:name => 'Vicosa', :zip_code => '36.570-000', :state => state); c.save 
c = City.new(:name => 'Vieiras', :zip_code => '36.895-000', :state => state); c.save 
c = City.new(:name => 'Vila Costina', :zip_code => '35.583-000', :state => state); c.save 
c = City.new(:name => 'Dom Bosco', :zip_code => '38.654-000', :state => state); c.save 
c = City.new(:name => 'Angelandia', :zip_code => '39.685-000', :state => state); c.save 
c = City.new(:name => 'Mathias Lobato', :zip_code => '35.110-000', :state => state); c.save 
c = City.new(:name => 'Natalandia', :zip_code => '38.658-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova De Minas', :zip_code => '39.416-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova Dos Pocoes', :zip_code => '39.444-000', :state => state); c.save 
c = City.new(:name => 'Vila Pereira', :zip_code => '39.862-000', :state => state); c.save 
c = City.new(:name => 'Vilas Boas', :zip_code => '36.526-000', :state => state); c.save 
c = City.new(:name => 'Virgem Da Lapa', :zip_code => '39.630-000', :state => state); c.save 
c = City.new(:name => 'Virginia', :zip_code => '37.465-000', :state => state); c.save 
c = City.new(:name => 'Virginopolis', :zip_code => '39.730-000', :state => state); c.save 
c = City.new(:name => 'Virgolandia', :zip_code => '39.715-000', :state => state); c.save 
c = City.new(:name => 'Visconde Do Rio Branco', :zip_code => '36.520-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '36.778-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '39.385-000', :state => state); c.save 
c = City.new(:name => 'Vitorinos', :zip_code => '36.264-000', :state => state); c.save 
c = City.new(:name => 'Volta Grande', :zip_code => '36.720-000', :state => state); c.save 
c = City.new(:name => 'Wenceslau Braz', :zip_code => '37.512-000', :state => state); c.save 
c = City.new(:name => 'Zelandia', :zip_code => '38.176-000', :state => state); c.save 
c = City.new(:name => 'Zito Soares', :zip_code => '35.383-000', :state => state); c.save 
c = City.new(:name => 'Ponte Segura', :zip_code => '37.618-000', :state => state); c.save 
c = City.new(:name => 'Ascencao', :zip_code => '35.665-000', :state => state); c.save 
c = City.new(:name => 'Miragaia', :zip_code => '36.507-000', :state => state); c.save 
c = City.new(:name => 'Caetano Lopes', :zip_code => '35.499-000', :state => state); c.save 
c = City.new(:name => 'Realeza', :zip_code => '36.905-000', :state => state); c.save 
c = City.new(:name => 'Vereda Do Paraiso', :zip_code => '39.545-000', :state => state); c.save 
c = City.new(:name => 'Rosario Do Pontal', :zip_code => '35.435-500', :state => state); c.save 
c = City.new(:name => 'Campo Alegre De Minas', :zip_code => '35.238-000', :state => state); c.save 
c = City.new(:name => 'Gama', :zip_code => '35.153-000', :state => state); c.save 
c = City.new(:name => 'Martinesia', :zip_code => '38.419-000', :state => state); c.save 
c = City.new(:name => 'Hematita', :zip_code => '35.178-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Dos Peixotos', :zip_code => '38.416-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Acacio', :zip_code => '35.133-000', :state => state); c.save 
c = City.new(:name => 'Naque-nanuque', :zip_code => '35.149-000', :state => state); c.save 
c = City.new(:name => 'Felicina', :zip_code => '35.152-000', :state => state); c.save 
c = City.new(:name => 'Aramirim', :zip_code => '35.151-000', :state => state); c.save 
c = City.new(:name => 'Aldeia', :zip_code => '35.245-000', :state => state); c.save 
c = City.new(:name => 'Goiabeira', :zip_code => '35.248-000', :state => state); c.save 
c = City.new(:name => 'Pedra Corrida', :zip_code => '35.155-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Baixio', :zip_code => '35.154-000', :state => state); c.save 
c = City.new(:name => 'Sapucaia Do Norte', :zip_code => '35.255-000', :state => state); c.save 
c = City.new(:name => 'Sao Geraldo Do Baixio', :zip_code => '35.258-000', :state => state); c.save 
c = City.new(:name => 'Brejaubinha', :zip_code => '35.106-000', :state => state); c.save 
c = City.new(:name => 'Baguari', :zip_code => '35.105-000', :state => state); c.save 
c = City.new(:name => 'Sao Vitor', :zip_code => '35.104-000', :state => state); c.save 
c = City.new(:name => 'Chonim', :zip_code => '35.109-000', :state => state); c.save 
c = City.new(:name => 'Penha Do Cassiano', :zip_code => '35.107-000', :state => state); c.save 
c = City.new(:name => 'Alto De Santa Helena', :zip_code => '35.102-000', :state => state); c.save 
c = City.new(:name => 'Bacao', :zip_code => '35.453-000', :state => state); c.save 
c = City.new(:name => 'Grota', :zip_code => '35.395-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente Do Grama', :zip_code => '35.398-000', :state => state); c.save 
c = City.new(:name => 'Aguas Ferreas', :zip_code => '35.362-000', :state => state); c.save 
c = City.new(:name => 'Douradinho', :zip_code => '37.755-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Buriti', :zip_code => '35.795-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Piracicaba', :zip_code => '35.943-000', :state => state); c.save 
c = City.new(:name => 'Tomas Gonzaga', :zip_code => '35.789-000', :state => state); c.save 
c = City.new(:name => 'Itauninha', :zip_code => '35.915-000', :state => state); c.save 
c = City.new(:name => 'Borba Gato', :zip_code => '35.803-000', :state => state); c.save 
c = City.new(:name => 'Silva Xavier', :zip_code => '35.705-000', :state => state); c.save 
c = City.new(:name => 'Amanda', :zip_code => '35.708-000', :state => state); c.save 
c = City.new(:name => 'Brumal', :zip_code => '35.966-000', :state => state); c.save 
c = City.new(:name => 'Barra Feliz', :zip_code => '35.963-000', :state => state); c.save 
c = City.new(:name => 'Floralia', :zip_code => '35.961-000', :state => state); c.save 
c = City.new(:name => 'Glaura', :zip_code => '35.408-000', :state => state); c.save 
c = City.new(:name => 'Antonio Pereira', :zip_code => '35.411-000', :state => state); c.save 
c = City.new(:name => 'Sem Peixe', :zip_code => '35.441-000', :state => state); c.save 
c = City.new(:name => 'Padre Pinto', :zip_code => '35.945-000', :state => state); c.save 
c = City.new(:name => 'Quartel De Sao Joao', :zip_code => '35.626-000', :state => state); c.save 
c = City.new(:name => 'Silva Campos', :zip_code => '35.645-000', :state => state); c.save 
c = City.new(:name => 'Andiroba', :zip_code => '35.745-000', :state => state); c.save 
c = City.new(:name => 'Anguereta', :zip_code => '35.793-000', :state => state); c.save 
c = City.new(:name => 'Corrego Do Barro', :zip_code => '35.665-200', :state => state); c.save 
c = City.new(:name => 'Torneiros', :zip_code => '35.665-100', :state => state); c.save 
c = City.new(:name => 'Cuite Velho', :zip_code => '35.242-000', :state => state); c.save 
c = City.new(:name => 'Martins Guimaraes', :zip_code => '35.593-000', :state => state); c.save 
c = City.new(:name => 'Carioca', :zip_code => '35.665-300', :state => state); c.save 
c = City.new(:name => 'Independencia', :zip_code => '35.236-000', :state => state); c.save 
c = City.new(:name => 'Piao', :zip_code => '37.776-000', :state => state); c.save 
c = City.new(:name => 'Palmeirinha', :zip_code => '38.613-000', :state => state); c.save 
c = City.new(:name => 'Uruana De Minas', :zip_code => '38.630-000', :state => state); c.save 
c = City.new(:name => 'Brasilandia De Minas', :zip_code => '38.779-000', :state => state); c.save 
c = City.new(:name => 'Sao Roberto', :zip_code => '39.358-000', :state => state); c.save 
c = City.new(:name => 'Emboabas', :zip_code => '36.319-000', :state => state); c.save 
c = City.new(:name => 'Citrolandia', :zip_code => '32.800-000', :state => state); c.save 
c = City.new(:name => 'Valadares', :zip_code => '36.101-000', :state => state); c.save 
c = City.new(:name => 'Caete', :zip_code => '36.102-000', :state => state); c.save 
c = City.new(:name => 'Paula Lima', :zip_code => '36.103-000', :state => state); c.save 
c = City.new(:name => 'Delta', :zip_code => '38.108-000', :state => state); c.save 
c = City.new(:name => 'Pilar', :zip_code => '38.717-000', :state => state); c.save 
c = City.new(:name => 'Vila Bom Jesus', :zip_code => '38.688-000', :state => state); c.save 
c = City.new(:name => 'Pic Sagarana', :zip_code => '38.686-000', :state => state); c.save 
c = City.new(:name => 'Dom Modesto', :zip_code => '35.313-000', :state => state); c.save 
c = City.new(:name => 'Santa Efigenia', :zip_code => '35.319-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Batatal', :zip_code => '35.339-000', :state => state); c.save 
c = City.new(:name => 'Baixa', :zip_code => '38.101-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao De Braunas', :zip_code => '35.197-000', :state => state); c.save 
c = City.new(:name => 'Padre Julio Maria', :zip_code => '36.978-000', :state => state); c.save 
c = City.new(:name => 'Chapada Gaucha', :zip_code => '39.314-000', :state => state); c.save 
c = City.new(:name => 'Pingo-dagua', :zip_code => '35.348-000', :state => state); c.save 
c = City.new(:name => 'Macuco', :zip_code => '36.891-500', :state => state); c.save 
c = City.new(:name => 'Bom Jesus De Cardosos', :zip_code => '35.381-000', :state => state); c.save 
c = City.new(:name => 'Piedade De Caratinga', :zip_code => '35.325-000', :state => state); c.save 
c = City.new(:name => 'Pintopolis', :zip_code => '39.317-000', :state => state); c.save 
c = City.new(:name => 'Santa Da Pedra', :zip_code => '39.368-000', :state => state); c.save 
c = City.new(:name => 'Campo Alegre De Minas', :zip_code => '39.457-000', :state => state); c.save 
c = City.new(:name => 'Catuti', :zip_code => '39.526-000', :state => state); c.save 
c = City.new(:name => 'Barreiro Branco', :zip_code => '39.526-700', :state => state); c.save 
c = City.new(:name => 'Ninheira', :zip_code => '39.553-000', :state => state); c.save 
c = City.new(:name => 'Fruta De Leite', :zip_code => '39.558-000', :state => state); c.save 
c = City.new(:name => 'Novorizonte', :zip_code => '39.568-000', :state => state); c.save 
c = City.new(:name => 'Mendonca', :zip_code => '39.664-000', :state => state); c.save 
c = City.new(:name => 'Santa Helena De Minas', :zip_code => '39.874-000', :state => state); c.save 
c = City.new(:name => 'Monte Formoso', :zip_code => '39.893-000', :state => state); c.save 
c = City.new(:name => 'Barreiro', :zip_code => '30.000-000', :state => state); c.save 
c = City.new(:name => 'Costas Da Mantiqueira', :zip_code => '36.206-000', :state => state); c.save 
c = City.new(:name => 'Galego', :zip_code => '36.206-100', :state => state); c.save 
c = City.new(:name => 'Ponto Chique Do Martelo', :zip_code => '36.206-500', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Dos Torres', :zip_code => '36.206-700', :state => state); c.save 
c = City.new(:name => 'Mantiqueira Do Palmital', :zip_code => '36.206-300', :state => state); c.save 

