#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Goiás')
state ||= State.create!( :name => 'Goiás', :code => 'GO', :country => country);

c = City.new(:name => 'Abadiania', :zip_code => '72.940-000', :state => state); c.save 
c = City.new(:name => 'Acreuna', :zip_code => '75.960-000', :state => state); c.save 
c = City.new(:name => 'Adelandia', :zip_code => '76.155-000', :state => state); c.save 
c = City.new(:name => 'Agua Limpa', :zip_code => '75.665-000', :state => state); c.save 
c = City.new(:name => 'Alexania', :zip_code => '72.920-000', :state => state); c.save 
c = City.new(:name => 'Aloandia', :zip_code => '75.615-000', :state => state); c.save 
c = City.new(:name => 'Alto Alvorada', :zip_code => '75.283-000', :state => state); c.save 
c = City.new(:name => 'Alto Paraiso De Goias', :zip_code => '73.770-000', :state => state); c.save 
c = City.new(:name => 'Alvorada Do Norte', :zip_code => '73.950-000', :state => state); c.save 
c = City.new(:name => 'Americano Do Brasil', :zip_code => '76.165-000', :state => state); c.save 
c = City.new(:name => 'Amorinopolis', :zip_code => '76.140-000', :state => state); c.save 
c = City.new(:name => 'Anapolis', :zip_code => '75.000-000', :state => state); c.save 
c = City.new(:name => 'Anhanguera', :zip_code => '75.770-000', :state => state); c.save 
c = City.new(:name => 'Anicuns', :zip_code => '76.170-000', :state => state); c.save 
c = City.new(:name => 'Aparecida De Goiania', :zip_code => '74.900-000', :state => state); c.save 
c = City.new(:name => 'Aparecida De Goias', :zip_code => '76.363-000', :state => state); c.save 
c = City.new(:name => 'Aparecida Do Rio Claro', :zip_code => '76.256-000', :state => state); c.save 
c = City.new(:name => 'Aparecida Do Rio Doce', :zip_code => '75.827-000', :state => state); c.save 
c = City.new(:name => 'Apore', :zip_code => '75.825-000', :state => state); c.save 
c = City.new(:name => 'Aracu', :zip_code => '75.410-000', :state => state); c.save 
c = City.new(:name => 'Aragarcas', :zip_code => '76.240-000', :state => state); c.save 
c = City.new(:name => 'Aragoiania', :zip_code => '75.360-000', :state => state); c.save 
c = City.new(:name => 'Araguapaz', :zip_code => '76.720-000', :state => state); c.save 
c = City.new(:name => 'Arenopolis', :zip_code => '76.235-000', :state => state); c.save 
c = City.new(:name => 'Aruana', :zip_code => '76.710-000', :state => state); c.save 
c = City.new(:name => 'Aurilandia', :zip_code => '76.120-000', :state => state); c.save 
c = City.new(:name => 'Avelinopolis', :zip_code => '75.395-000', :state => state); c.save 
c = City.new(:name => 'Bacilandia', :zip_code => '76.222-000', :state => state); c.save 
c = City.new(:name => 'Baliza', :zip_code => '76.250-000', :state => state); c.save 
c = City.new(:name => 'Bandeirantes', :zip_code => '76.523-000', :state => state); c.save 
c = City.new(:name => 'Barro Alto', :zip_code => '76.390-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim De Goias', :zip_code => '76.245-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus De Goias', :zip_code => '75.570-000', :state => state); c.save 
c = City.new(:name => 'Bonfinopolis', :zip_code => '75.195-000', :state => state); c.save 
c = City.new(:name => 'Brazabrantes', :zip_code => '75.440-000', :state => state); c.save 
c = City.new(:name => 'Britania', :zip_code => '76.280-000', :state => state); c.save 
c = City.new(:name => 'Buenolandia', :zip_code => '76.606-000', :state => state); c.save 
c = City.new(:name => 'Buriti Alegre', :zip_code => '75.660-000', :state => state); c.save 
c = City.new(:name => 'Cabeceiras', :zip_code => '73.870-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Alta', :zip_code => '75.870-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Goias', :zip_code => '76.125-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Dourada', :zip_code => '75.560-000', :state => state); c.save 
c = City.new(:name => 'Cacu', :zip_code => '75.813-000', :state => state); c.save 
c = City.new(:name => 'Caiaponia', :zip_code => '75.850-000', :state => state); c.save 
c = City.new(:name => 'Caicara', :zip_code => '76.742-000', :state => state); c.save 
c = City.new(:name => 'Calcilandia', :zip_code => '76.604-000', :state => state); c.save 
c = City.new(:name => 'Caldas Novas', :zip_code => '75.690-000', :state => state); c.save 
c = City.new(:name => 'Caldazinha', :zip_code => '75.245-000', :state => state); c.save 
c = City.new(:name => 'Campestre De Goias', :zip_code => '75.385-000', :state => state); c.save 
c = City.new(:name => 'Campinacu', :zip_code => '76.440-000', :state => state); c.save 
c = City.new(:name => 'Campinorte', :zip_code => '76.410-000', :state => state); c.save 
c = City.new(:name => 'Campo Alegre De Goias', :zip_code => '75.795-000', :state => state); c.save 
c = City.new(:name => 'Buriti De Goias', :zip_code => '76.152-000', :state => state); c.save 
c = City.new(:name => 'Campolandia', :zip_code => '76.133-000', :state => state); c.save 
c = City.new(:name => 'Campos Belos', :zip_code => '73.840-000', :state => state); c.save 
c = City.new(:name => 'Canada', :zip_code => '76.274-000', :state => state); c.save 
c = City.new(:name => 'Auriverde', :zip_code => '76.513-000', :state => state); c.save 
c = City.new(:name => 'Capelinha', :zip_code => '76.174-000', :state => state); c.save 
c = City.new(:name => 'Caraiba', :zip_code => '75.263-000', :state => state); c.save 
c = City.new(:name => 'Carmo Do Rio Verde', :zip_code => '76.340-000', :state => state); c.save 
c = City.new(:name => 'Castelandia', :zip_code => '75.925-000', :state => state); c.save 
c = City.new(:name => 'Castrinopolis', :zip_code => '76.313-000', :state => state); c.save 
c = City.new(:name => 'Catalao', :zip_code => '75.700-000', :state => state); c.save 
c = City.new(:name => 'Caturai', :zip_code => '75.430-000', :state => state); c.save 
c = City.new(:name => 'Cavalcante', :zip_code => '73.790-000', :state => state); c.save 
c = City.new(:name => 'Cavalheiro', :zip_code => '75.783-000', :state => state); c.save 
c = City.new(:name => 'Ceres', :zip_code => '76.300-000', :state => state); c.save 
c = City.new(:name => 'Cezarina', :zip_code => '76.195-000', :state => state); c.save 
c = City.new(:name => 'Choupana', :zip_code => '76.172-000', :state => state); c.save 
c = City.new(:name => 'Cibele', :zip_code => '76.682-000', :state => state); c.save 
c = City.new(:name => 'Cidade Ocidental', :zip_code => '72.880-000', :state => state); c.save 
c = City.new(:name => 'Cirilandia', :zip_code => '76.323-000', :state => state); c.save 
c = City.new(:name => 'Cocalzinho De Goias', :zip_code => '72.975-000', :state => state); c.save 
c = City.new(:name => 'Colinas Do Sul', :zip_code => '73.740-000', :state => state); c.save 
c = City.new(:name => 'Corrego Do Ouro', :zip_code => '76.145-000', :state => state); c.save 
c = City.new(:name => 'Corrego Rico', :zip_code => '73.759-000', :state => state); c.save 
c = City.new(:name => 'Corumba De Goias', :zip_code => '72.960-000', :state => state); c.save 
c = City.new(:name => 'Corumbaiba', :zip_code => '75.680-000', :state => state); c.save 
c = City.new(:name => 'Cristalina', :zip_code => '73.850-000', :state => state); c.save 
c = City.new(:name => 'Cristianopolis', :zip_code => '75.230-000', :state => state); c.save 
c = City.new(:name => 'Crixas', :zip_code => '76.510-000', :state => state); c.save 
c = City.new(:name => 'Crominia', :zip_code => '75.635-000', :state => state); c.save 
c = City.new(:name => 'Cumari', :zip_code => '75.760-000', :state => state); c.save 
c = City.new(:name => 'Damianopolis', :zip_code => '73.980-000', :state => state); c.save 
c = City.new(:name => 'Damolandia', :zip_code => '75.420-000', :state => state); c.save 
c = City.new(:name => 'Davidopolis', :zip_code => '76.602-000', :state => state); c.save 
c = City.new(:name => 'Davinopolis', :zip_code => '75.730-000', :state => state); c.save 
c = City.new(:name => 'Diolandia', :zip_code => '76.683-000', :state => state); c.save 
c = City.new(:name => 'Diorama', :zip_code => '76.260-000', :state => state); c.save 
c = City.new(:name => 'Domiciano Ribeiro', :zip_code => '75.784-000', :state => state); c.save 
c = City.new(:name => 'Doverlandia', :zip_code => '75.855-000', :state => state); c.save 
c = City.new(:name => 'Edealina', :zip_code => '75.945-000', :state => state); c.save 
c = City.new(:name => 'Edeia', :zip_code => '75.940-000', :state => state); c.save 
c = City.new(:name => 'Estrela Do Norte', :zip_code => '76.485-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Nova', :zip_code => '76.220-000', :state => state); c.save 
c = City.new(:name => 'Firminopolis', :zip_code => '76.105-000', :state => state); c.save 
c = City.new(:name => 'Flores De Goias', :zip_code => '73.890-000', :state => state); c.save 
c = City.new(:name => 'Formosa', :zip_code => '73.800-000', :state => state); c.save 
c = City.new(:name => 'Formoso', :zip_code => '76.470-000', :state => state); c.save 
c = City.new(:name => 'Forte', :zip_code => '73.764-000', :state => state); c.save 
c = City.new(:name => 'Divinopolis De Goias', :zip_code => '73.865-000', :state => state); c.save 
c = City.new(:name => 'Geriacu', :zip_code => '76.402-000', :state => state); c.save 
c = City.new(:name => 'Goialandia', :zip_code => '75.151-000', :state => state); c.save 
c = City.new(:name => 'Goianapolis', :zip_code => '75.170-000', :state => state); c.save 
c = City.new(:name => 'Goiandira', :zip_code => '75.740-000', :state => state); c.save 
c = City.new(:name => 'Goianesia', :zip_code => '76.380-000', :state => state); c.save 
c = City.new(:name => 'Goiania', :zip_code => '74.000-000', :state => state); c.save 
c = City.new(:name => 'Goianira', :zip_code => '75.370-000', :state => state); c.save 
c = City.new(:name => 'Goias', :zip_code => '76.600-000', :state => state); c.save 
c = City.new(:name => 'Goiatuba', :zip_code => '75.600-000', :state => state); c.save 
c = City.new(:name => 'Gouvelandia', :zip_code => '75.865-000', :state => state); c.save 
c = City.new(:name => 'Guapo', :zip_code => '75.350-000', :state => state); c.save 
c = City.new(:name => 'Guaraita', :zip_code => '76.690-000', :state => state); c.save 
c = City.new(:name => 'Guarani De Goias', :zip_code => '73.910-000', :state => state); c.save 
c = City.new(:name => 'Heitorai', :zip_code => '76.670-000', :state => state); c.save 
c = City.new(:name => 'Hidrolandia', :zip_code => '75.340-000', :state => state); c.save 
c = City.new(:name => 'Hidrolina', :zip_code => '76.375-000', :state => state); c.save 
c = City.new(:name => 'Iaciara', :zip_code => '73.920-000', :state => state); c.save 
c = City.new(:name => 'Inaciolandia', :zip_code => '75.550-000', :state => state); c.save 
c = City.new(:name => 'Indiara', :zip_code => '75.955-000', :state => state); c.save 
c = City.new(:name => 'Inhumas', :zip_code => '75.400-000', :state => state); c.save 
c = City.new(:name => 'Interlandia', :zip_code => '75.152-000', :state => state); c.save 
c = City.new(:name => 'Ipameri', :zip_code => '75.780-000', :state => state); c.save 
c = City.new(:name => 'Ipora', :zip_code => '76.200-000', :state => state); c.save 
c = City.new(:name => 'Israelandia', :zip_code => '76.205-000', :state => state); c.save 
c = City.new(:name => 'Itaberai', :zip_code => '76.630-000', :state => state); c.save 
c = City.new(:name => 'Itaguacu', :zip_code => '75.893-000', :state => state); c.save 
c = City.new(:name => 'Itaguari', :zip_code => '76.650-000', :state => state); c.save 
c = City.new(:name => 'Itaguaru', :zip_code => '76.660-000', :state => state); c.save 
c = City.new(:name => 'Itaja', :zip_code => '75.815-000', :state => state); c.save 
c = City.new(:name => 'Itapaci', :zip_code => '76.360-000', :state => state); c.save 
c = City.new(:name => 'Itapirapua', :zip_code => '76.290-000', :state => state); c.save 
c = City.new(:name => 'Itapuranga', :zip_code => '76.680-000', :state => state); c.save 
c = City.new(:name => 'Itaruma', :zip_code => '75.810-000', :state => state); c.save 
c = City.new(:name => 'Itaucu', :zip_code => '75.450-000', :state => state); c.save 
c = City.new(:name => 'Itumbiara', :zip_code => '75.500-000', :state => state); c.save 
c = City.new(:name => 'Ivolandia', :zip_code => '76.130-000', :state => state); c.save 
c = City.new(:name => 'Jacilandia', :zip_code => '76.293-000', :state => state); c.save 
c = City.new(:name => 'Jandaia', :zip_code => '75.950-000', :state => state); c.save 
c = City.new(:name => 'Jaragua', :zip_code => '76.330-000', :state => state); c.save 
c = City.new(:name => 'Jatai', :zip_code => '75.800-000', :state => state); c.save 
c = City.new(:name => 'Jaupaci', :zip_code => '76.210-000', :state => state); c.save 
c = City.new(:name => 'Jeroaquara', :zip_code => '76.744-000', :state => state); c.save 
c = City.new(:name => 'Joanapolis', :zip_code => '75.157-000', :state => state); c.save 
c = City.new(:name => 'Joviania', :zip_code => '75.610-000', :state => state); c.save 
c = City.new(:name => 'Juscelandia', :zip_code => '76.276-000', :state => state); c.save 
c = City.new(:name => 'Jussara', :zip_code => '76.270-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Bauzinho', :zip_code => '75.912-000', :state => state); c.save 
c = City.new(:name => 'Lagolandia', :zip_code => '72.984-000', :state => state); c.save 
c = City.new(:name => 'Leopoldo De Bulhoes', :zip_code => '75.190-000', :state => state); c.save 
c = City.new(:name => 'Lucilandia', :zip_code => '76.257-000', :state => state); c.save 
c = City.new(:name => 'Luziania', :zip_code => '72.800-000', :state => state); c.save 
c = City.new(:name => 'Mairipotaba', :zip_code => '75.630-000', :state => state); c.save 
c = City.new(:name => 'Mambai', :zip_code => '73.970-000', :state => state); c.save 
c = City.new(:name => 'Mara Rosa', :zip_code => '76.490-000', :state => state); c.save 
c = City.new(:name => 'Marcianopolis', :zip_code => '75.574-000', :state => state); c.save 
c = City.new(:name => 'Buritinopolis', :zip_code => '73.975-000', :state => state); c.save 
c = City.new(:name => 'Marzagao', :zip_code => '75.670-000', :state => state); c.save 
c = City.new(:name => 'Maurilandia', :zip_code => '75.930-000', :state => state); c.save 
c = City.new(:name => 'Messianopolis', :zip_code => '76.138-000', :state => state); c.save 
c = City.new(:name => 'Mimoso De Goias', :zip_code => '73.730-000', :state => state); c.save 
c = City.new(:name => 'Minacu', :zip_code => '76.450-000', :state => state); c.save 
c = City.new(:name => 'Mineiros', :zip_code => '75.830-000', :state => state); c.save 
c = City.new(:name => 'Moipora', :zip_code => '76.135-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre De Goias', :zip_code => '73.830-000', :state => state); c.save 
c = City.new(:name => 'Montes Claros De Goias', :zip_code => '76.255-000', :state => state); c.save 
c = City.new(:name => 'Montividiu', :zip_code => '75.915-000', :state => state); c.save 
c = City.new(:name => 'Morrinhos', :zip_code => '75.650-000', :state => state); c.save 
c = City.new(:name => 'Morro Agudo De Goias', :zip_code => '76.355-000', :state => state); c.save 
c = City.new(:name => 'Mossamedes', :zip_code => '76.150-000', :state => state); c.save 
c = City.new(:name => 'Mozarlandia', :zip_code => '76.700-000', :state => state); c.save 
c = City.new(:name => 'Mundo Novo', :zip_code => '76.530-000', :state => state); c.save 
c = City.new(:name => 'Mutunopolis', :zip_code => '76.540-000', :state => state); c.save 
c = City.new(:name => 'Natinopolis', :zip_code => '76.383-000', :state => state); c.save 
c = City.new(:name => 'Nazario', :zip_code => '76.180-000', :state => state); c.save 
c = City.new(:name => 'Neropolis', :zip_code => '75.460-000', :state => state); c.save 
c = City.new(:name => 'Niquelandia', :zip_code => '76.420-000', :state => state); c.save 
c = City.new(:name => 'Nova America', :zip_code => '76.345-000', :state => state); c.save 
c = City.new(:name => 'Nova Aurora', :zip_code => '75.750-000', :state => state); c.save 
c = City.new(:name => 'Nova Crixas', :zip_code => '76.520-000', :state => state); c.save 
c = City.new(:name => 'Nova Gloria', :zip_code => '76.305-000', :state => state); c.save 
c = City.new(:name => 'Nova Roma', :zip_code => '73.820-000', :state => state); c.save 
c = City.new(:name => 'Nova Veneza', :zip_code => '75.470-000', :state => state); c.save 
c = City.new(:name => 'Novo Brasil', :zip_code => '76.285-000', :state => state); c.save 
c = City.new(:name => 'Novo Gama', :zip_code => '72.860-000', :state => state); c.save 
c = City.new(:name => 'Novo Planalto', :zip_code => '76.580-000', :state => state); c.save 
c = City.new(:name => 'Orizona', :zip_code => '75.280-000', :state => state); c.save 
c = City.new(:name => 'Ouro Verde De Goias', :zip_code => '75.165-000', :state => state); c.save 
c = City.new(:name => 'Ouroana', :zip_code => '75.911-000', :state => state); c.save 
c = City.new(:name => 'Ouvidor', :zip_code => '75.715-000', :state => state); c.save 
c = City.new(:name => 'Padre Bernardo', :zip_code => '73.700-000', :state => state); c.save 
c = City.new(:name => 'Palestina De Goias', :zip_code => '75.845-000', :state => state); c.save 
c = City.new(:name => 'Palmeiras De Goias', :zip_code => '76.190-000', :state => state); c.save 
c = City.new(:name => 'Palmelo', :zip_code => '75.210-000', :state => state); c.save 
c = City.new(:name => 'Palminopolis', :zip_code => '75.990-000', :state => state); c.save 
c = City.new(:name => 'Panama', :zip_code => '75.580-000', :state => state); c.save 
c = City.new(:name => 'Paranaiguara', :zip_code => '75.880-000', :state => state); c.save 
c = City.new(:name => 'Parauna', :zip_code => '75.980-000', :state => state); c.save 
c = City.new(:name => 'Perolandia', :zip_code => '75.823-000', :state => state); c.save 
c = City.new(:name => 'Petrolina De Goias', :zip_code => '75.480-000', :state => state); c.save 
c = City.new(:name => 'Pilar De Goias', :zip_code => '76.370-000', :state => state); c.save 
c = City.new(:name => 'Piloandia', :zip_code => '76.208-000', :state => state); c.save 
c = City.new(:name => 'Piracanjuba', :zip_code => '75.640-000', :state => state); c.save 
c = City.new(:name => 'Piranhas', :zip_code => '76.230-000', :state => state); c.save 
c = City.new(:name => 'Pirenopolis', :zip_code => '72.980-000', :state => state); c.save 
c = City.new(:name => 'Pires Do Rio', :zip_code => '75.200-000', :state => state); c.save 
c = City.new(:name => 'Planaltina', :zip_code => '73.750-000', :state => state); c.save 
c = City.new(:name => 'Pontalina', :zip_code => '75.620-000', :state => state); c.save 
c = City.new(:name => 'Porangatu', :zip_code => '76.550-000', :state => state); c.save 
c = City.new(:name => 'Porteirao', :zip_code => '75.603-000', :state => state); c.save 
c = City.new(:name => 'Portelandia', :zip_code => '75.835-000', :state => state); c.save 
c = City.new(:name => 'Posse', :zip_code => '73.900-000', :state => state); c.save 
c = City.new(:name => 'Posse Dabadia', :zip_code => '72.944-000', :state => state); c.save 
c = City.new(:name => 'Rio Quente', :zip_code => '75.695-000', :state => state); c.save 
c = City.new(:name => 'Professor Jamil', :zip_code => '75.645-000', :state => state); c.save 
c = City.new(:name => 'Quirinopolis', :zip_code => '75.860-000', :state => state); c.save 
c = City.new(:name => 'Registro Do Araguaia', :zip_code => '76.258-000', :state => state); c.save 
c = City.new(:name => 'Rialma', :zip_code => '76.310-000', :state => state); c.save 
c = City.new(:name => 'Rianapolis', :zip_code => '76.315-000', :state => state); c.save 
c = City.new(:name => 'Rio Verde', :zip_code => '75.900-000', :state => state); c.save 
c = City.new(:name => 'Riverlandia', :zip_code => '75.914-000', :state => state); c.save 
c = City.new(:name => 'Rodrigues Nascimento', :zip_code => '75.153-000', :state => state); c.save 
c = City.new(:name => 'Rosalandia', :zip_code => '76.103-000', :state => state); c.save 
c = City.new(:name => 'Rubiataba', :zip_code => '76.350-000', :state => state); c.save 
c = City.new(:name => 'Sanclerlandia', :zip_code => '76.160-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara De Goias', :zip_code => '75.390-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz De Goias', :zip_code => '75.220-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe De Goias', :zip_code => '76.265-000', :state => state); c.save 
c = City.new(:name => 'Santa Helena De Goias', :zip_code => '75.920-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel', :zip_code => '76.320-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Araguaia', :zip_code => '75.840-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa', :zip_code => '73.817-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa De Goias', :zip_code => '75.455-000', :state => state); c.save 
c = City.new(:name => 'Santa Tereza De Goias', :zip_code => '76.480-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha De Goias', :zip_code => '76.500-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Barra', :zip_code => '75.935-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Descoberto', :zip_code => '72.900-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Rio Verde', :zip_code => '75.714-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '73.860-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Goias', :zip_code => '75.490-000', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel De Goias', :zip_code => '73.758-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao', :zip_code => '76.610-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Parauna', :zip_code => '75.985-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Dalianca', :zip_code => '73.760-000', :state => state); c.save 
c = City.new(:name => 'Sao Luis De Montes Belos', :zip_code => '76.100-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz Do Tocantins', :zip_code => '76.422-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Passa Quatro', :zip_code => '75.185-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Araguaia', :zip_code => '76.590-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Rio Claro', :zip_code => '76.278-000', :state => state); c.save 
c = City.new(:name => 'Sao Simao', :zip_code => '75.890-000', :state => state); c.save 
c = City.new(:name => 'Senador Canedo', :zip_code => '75.250-000', :state => state); c.save 
c = City.new(:name => 'Serra Dourada', :zip_code => '76.224-000', :state => state); c.save 
c = City.new(:name => 'Serranopolis', :zip_code => '75.820-000', :state => state); c.save 
c = City.new(:name => 'Silvania', :zip_code => '75.180-000', :state => state); c.save 
c = City.new(:name => 'Sitio Dabadia', :zip_code => '73.990-000', :state => state); c.save 
c = City.new(:name => 'Sousania', :zip_code => '75.154-000', :state => state); c.save 
c = City.new(:name => 'Taquaral De Goias', :zip_code => '76.640-000', :state => state); c.save 
c = City.new(:name => 'Taveira', :zip_code => '76.423-000', :state => state); c.save 
c = City.new(:name => 'Teresina De Goias', :zip_code => '73.795-000', :state => state); c.save 
c = City.new(:name => 'Tres Ranchos', :zip_code => '75.720-000', :state => state); c.save 
c = City.new(:name => 'Trindade', :zip_code => '75.380-000', :state => state); c.save 
c = City.new(:name => 'Tupiracaba', :zip_code => '76.424-000', :state => state); c.save 
c = City.new(:name => 'Turvania', :zip_code => '76.110-000', :state => state); c.save 
c = City.new(:name => 'Turvelandia', :zip_code => '75.970-000', :state => state); c.save 
c = City.new(:name => 'Uruacu', :zip_code => '76.400-000', :state => state); c.save 
c = City.new(:name => 'Uruana', :zip_code => '76.335-000', :state => state); c.save 
c = City.new(:name => 'Uruita', :zip_code => '76.338-000', :state => state); c.save 
c = City.new(:name => 'Urutai', :zip_code => '75.790-000', :state => state); c.save 
c = City.new(:name => 'Uva', :zip_code => '76.608-000', :state => state); c.save 
c = City.new(:name => 'Valdelandia', :zip_code => '76.352-000', :state => state); c.save 
c = City.new(:name => 'Valparaiso De Goias', :zip_code => '72.870-000', :state => state); c.save 
c = City.new(:name => 'Varjao', :zip_code => '75.355-000', :state => state); c.save 
c = City.new(:name => 'Vianopolis', :zip_code => '75.260-000', :state => state); c.save 
c = City.new(:name => 'Vicentinopolis', :zip_code => '75.555-000', :state => state); c.save 
c = City.new(:name => 'Vila Brasilia', :zip_code => '74.900-000', :state => state); c.save 
c = City.new(:name => 'Trombas', :zip_code => '76.460-000', :state => state); c.save 
c = City.new(:name => 'Vila Propicio', :zip_code => '72.990-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista De Goias', :zip_code => '75.240-000', :state => state); c.save 
c = City.new(:name => 'Pau-terra', :zip_code => '76.412-000', :state => state); c.save 
c = City.new(:name => 'Simolandia', :zip_code => '73.930-000', :state => state); c.save 
c = City.new(:name => 'Faina', :zip_code => '76.740-000', :state => state); c.save 
c = City.new(:name => 'Matrincha', :zip_code => '76.730-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz Do Norte', :zip_code => '76.365-000', :state => state); c.save 
c = City.new(:name => 'Campos Verdes', :zip_code => '76.515-000', :state => state); c.save 
c = City.new(:name => 'Guarinos', :zip_code => '76.385-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Do Norte', :zip_code => '76.554-000', :state => state); c.save 
c = City.new(:name => 'Bonopolis', :zip_code => '76.555-000', :state => state); c.save 
c = City.new(:name => 'Aparecida', :zip_code => '76.163-000', :state => state); c.save 
c = City.new(:name => 'Termas Do Itaja', :zip_code => '75.819-000', :state => state); c.save 
c = City.new(:name => 'Barbosilandia', :zip_code => '73.907-000', :state => state); c.save 
c = City.new(:name => 'Agua Fria De Goias', :zip_code => '73.780-000', :state => state); c.save 
c = City.new(:name => 'Vila Boa', :zip_code => '73.825-000', :state => state); c.save 
c = City.new(:name => 'Terezopolis De Goias', :zip_code => '75.175-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio De Goias', :zip_code => '75.375-000', :state => state); c.save 
c = City.new(:name => 'Jesupolis', :zip_code => '75.495-000', :state => state); c.save 
c = City.new(:name => 'Chapadao Do Ceu', :zip_code => '75.828-000', :state => state); c.save 
c = City.new(:name => 'Montividiu Do Norte', :zip_code => '76.465-000', :state => state); c.save 
c = City.new(:name => 'Nova Iguacu De Goias', :zip_code => '76.495-000', :state => state); c.save 
c = City.new(:name => 'Alto Horizonte', :zip_code => '76.560-000', :state => state); c.save 
c = City.new(:name => 'Uirapuru', :zip_code => '76.525-000', :state => state); c.save 
c = City.new(:name => 'Olhos Dagua', :zip_code => '75.714-100', :state => state); c.save 
c = City.new(:name => 'Pedra Branca', :zip_code => '75.714-200', :state => state); c.save 
c = City.new(:name => 'Pires Belo', :zip_code => '75.714-300', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Das Lajes', :zip_code => '75.913-000', :state => state); c.save 
c = City.new(:name => 'Campo Limpo', :zip_code => '75.545-000', :state => state); c.save 
c = City.new(:name => 'Meia Ponte', :zip_code => '75.547-000', :state => state); c.save 
c = City.new(:name => 'Sarandi', :zip_code => '75.549-000', :state => state); c.save 
c = City.new(:name => 'Cebrasa', :zip_code => '75.156-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '75.159-000', :state => state); c.save 
c = City.new(:name => 'Calixto', :zip_code => '75.161-000', :state => state); c.save 
c = City.new(:name => 'Abadia De Goias', :zip_code => '75.345-000', :state => state); c.save 
c = City.new(:name => 'Cana Brava', :zip_code => '76.458-000', :state => state); c.save 
c = City.new(:name => 'Juscelino Kubitschek', :zip_code => '76.478-000', :state => state); c.save 
c = City.new(:name => 'Vila Sertaneja', :zip_code => '76.528-000', :state => state); c.save 
c = City.new(:name => 'Sao Patricio', :zip_code => '76.343-000', :state => state); c.save 
c = City.new(:name => 'Olaria Do Angico', :zip_code => '75.812-000', :state => state); c.save 
c = City.new(:name => 'Gameleira De Goias', :zip_code => '75.184-000', :state => state); c.save 
c = City.new(:name => 'Aguas Lindas De Goias', :zip_code => '72.910-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Novo Destino', :zip_code => '76.395-000', :state => state); c.save 
c = City.new(:name => 'Amaralina', :zip_code => '76.493-000', :state => state); c.save 

