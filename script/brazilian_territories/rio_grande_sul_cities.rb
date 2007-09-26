#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Rio Grande do Sul')
state ||= State.create!( :name => 'Rio Grande do Sul', :code => 'RS', :country => country);

c = City.new(:name => 'Acegua', :zip_code => '96.445-000', :state => state); c.save 
c = City.new(:name => 'Afonso Rodrigues', :zip_code => '97.825-000', :state => state); c.save 
c = City.new(:name => 'Agua Santa', :zip_code => '99.965-000', :state => state); c.save 
c = City.new(:name => 'Aguas Claras', :zip_code => '94.760-000', :state => state); c.save 
c = City.new(:name => 'Agudo', :zip_code => '96.540-000', :state => state); c.save 
c = City.new(:name => 'Ajuricaba', :zip_code => '98.750-000', :state => state); c.save 
c = City.new(:name => 'Albardao', :zip_code => '96.670-000', :state => state); c.save 
c = City.new(:name => 'Alecrim', :zip_code => '98.950-000', :state => state); c.save 
c = City.new(:name => 'Alegrete', :zip_code => '97.540-000', :state => state); c.save 
c = City.new(:name => 'Alegria', :zip_code => '98.905-000', :state => state); c.save 
c = City.new(:name => 'Alfredo Brenner', :zip_code => '98.210-000', :state => state); c.save 
c = City.new(:name => 'Almirante Tamandare', :zip_code => '99.512-000', :state => state); c.save 
c = City.new(:name => 'Alpestre', :zip_code => '98.480-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre', :zip_code => '99.430-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre', :zip_code => '96.380-000', :state => state); c.save 
c = City.new(:name => 'Alto Da Uniao', :zip_code => '98.713-000', :state => state); c.save 
c = City.new(:name => 'Alto Recreio', :zip_code => '99.673-000', :state => state); c.save 
c = City.new(:name => 'Alto Uruguai', :zip_code => '98.630-000', :state => state); c.save 
c = City.new(:name => 'Alvorada', :zip_code => '94.800-000', :state => state); c.save 
c = City.new(:name => 'Amaral Ferrador', :zip_code => '96.635-000', :state => state); c.save 
c = City.new(:name => 'Andre Da Rocha', :zip_code => '95.310-000', :state => state); c.save 
c = City.new(:name => 'Anta Gorda', :zip_code => '95.980-000', :state => state); c.save 
c = City.new(:name => 'Antonio Kerpel', :zip_code => '98.583-000', :state => state); c.save 
c = City.new(:name => 'Antonio Prado', :zip_code => '95.250-000', :state => state); c.save 
c = City.new(:name => 'Arambare', :zip_code => '96.178-000', :state => state); c.save 
c = City.new(:name => 'Ararica', :zip_code => '93.880-000', :state => state); c.save 
c = City.new(:name => 'Aratiba', :zip_code => '99.770-000', :state => state); c.save 
c = City.new(:name => 'Arco Verde', :zip_code => '95.186-000', :state => state); c.save 
c = City.new(:name => 'Arco-iris', :zip_code => '98.393-000', :state => state); c.save 
c = City.new(:name => 'Imigrante', :zip_code => '95.885-000', :state => state); c.save 
c = City.new(:name => 'Arroio Do Meio', :zip_code => '95.940-000', :state => state); c.save 
c = City.new(:name => 'Arroio Do Padre', :zip_code => '96.125-000', :state => state); c.save 
c = City.new(:name => 'Arroio Do Sal', :zip_code => '95.585-000', :state => state); c.save 
c = City.new(:name => 'Arroio Do So', :zip_code => '97.165-000', :state => state); c.save 
c = City.new(:name => 'Arroio Do Tigre', :zip_code => '96.950-000', :state => state); c.save 
c = City.new(:name => 'Arroio Dos Ratos', :zip_code => '96.740-000', :state => state); c.save 
c = City.new(:name => 'Arroio Grande', :zip_code => '96.330-000', :state => state); c.save 
c = City.new(:name => 'Arroio Grande', :zip_code => '99.455-000', :state => state); c.save 
c = City.new(:name => 'Arvore So', :zip_code => '96.240-000', :state => state); c.save 
c = City.new(:name => 'Arvorezinha', :zip_code => '95.995-000', :state => state); c.save 
c = City.new(:name => 'Atiacu', :zip_code => '99.565-000', :state => state); c.save 
c = City.new(:name => 'Augusto Pestana', :zip_code => '98.740-000', :state => state); c.save 
c = City.new(:name => 'Aurea', :zip_code => '99.835-000', :state => state); c.save 
c = City.new(:name => 'Avelino Paranhos', :zip_code => '99.425-000', :state => state); c.save 
c = City.new(:name => 'Azevedo Sodre', :zip_code => '97.330-000', :state => state); c.save 
c = City.new(:name => 'Bage', :zip_code => '96.400-000', :state => state); c.save 
c = City.new(:name => 'Baliza', :zip_code => '99.833-000', :state => state); c.save 
c = City.new(:name => 'Banhado Do Colegio', :zip_code => '96.188-000', :state => state); c.save 
c = City.new(:name => 'Barao', :zip_code => '95.730-000', :state => state); c.save 
c = City.new(:name => 'Barao De Cotegipe', :zip_code => '99.740-000', :state => state); c.save 
c = City.new(:name => 'Barao Do Triunfo', :zip_code => '96.735-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Guarita', :zip_code => '98.530-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Ouro', :zip_code => '95.532-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Quarai', :zip_code => '97.538-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Ribeiro', :zip_code => '96.790-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Rio Azul', :zip_code => '99.795-000', :state => state); c.save 
c = City.new(:name => 'Barra Funda', :zip_code => '99.585-000', :state => state); c.save 
c = City.new(:name => 'Barracao', :zip_code => '95.370-000', :state => state); c.save 
c = City.new(:name => 'Barreirinho', :zip_code => '99.575-000', :state => state); c.save 
c = City.new(:name => 'Novo Barreiro', :zip_code => '98.338-000', :state => state); c.save 
c = City.new(:name => 'Barro Preto', :zip_code => '98.753-000', :state => state); c.save 
c = City.new(:name => 'Barro Vermelho', :zip_code => '96.526-000', :state => state); c.save 
c = City.new(:name => 'Barro Vermelho', :zip_code => '94.340-000', :state => state); c.save 
c = City.new(:name => 'Barros Cassal', :zip_code => '99.360-000', :state => state); c.save 
c = City.new(:name => 'Basilio', :zip_code => '96.320-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '99.885-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '99.135-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '96.912-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '98.605-000', :state => state); c.save 
c = City.new(:name => 'Beluno', :zip_code => '97.620-000', :state => state); c.save 
c = City.new(:name => 'Benjamin Constant Do Sul', :zip_code => '99.650-000', :state => state); c.save 
c = City.new(:name => 'Bento Goncalves', :zip_code => '95.700-000', :state => state); c.save 
c = City.new(:name => 'Bexiga', :zip_code => '96.680-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '95.693-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Das Missoes', :zip_code => '98.335-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '96.850-000', :state => state); c.save 
c = City.new(:name => 'Nova Boa Vista', :zip_code => '99.580-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Burica', :zip_code => '98.918-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Incra', :zip_code => '98.120-000', :state => state); c.save 
c = City.new(:name => 'Boca Do Monte', :zip_code => '97.170-000', :state => state); c.save 
c = City.new(:name => 'Boi Preto', :zip_code => '99.555-000', :state => state); c.save 
c = City.new(:name => 'Bojuru', :zip_code => '96.228-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim', :zip_code => '96.578-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus', :zip_code => '95.290-000', :state => state); c.save 
c = City.new(:name => 'Bom Principio', :zip_code => '95.765-000', :state => state); c.save 
c = City.new(:name => 'Bom Progresso', :zip_code => '98.575-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro', :zip_code => '95.495-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro Do Guaiba', :zip_code => '92.800-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro Do Sul', :zip_code => '95.870-000', :state => state); c.save 
c = City.new(:name => 'Bonito', :zip_code => '96.181-000', :state => state); c.save 
c = City.new(:name => 'Boqueirao', :zip_code => '95.830-000', :state => state); c.save 
c = City.new(:name => 'Boqueirao', :zip_code => '96.175-000', :state => state); c.save 
c = City.new(:name => 'Boqueirao Do Leao', :zip_code => '95.920-000', :state => state); c.save 
c = City.new(:name => 'Borore', :zip_code => '97.653-000', :state => state); c.save 
c = City.new(:name => 'Bossoroca', :zip_code => '97.850-000', :state => state); c.save 
c = City.new(:name => 'Botucarai', :zip_code => '96.935-000', :state => state); c.save 
c = City.new(:name => 'Braga', :zip_code => '98.560-000', :state => state); c.save 
c = City.new(:name => 'Buriti', :zip_code => '98.825-000', :state => state); c.save 
c = City.new(:name => 'Butia', :zip_code => '96.750-000', :state => state); c.save 
c = City.new(:name => 'Butias', :zip_code => '96.293-000', :state => state); c.save 
c = City.new(:name => 'Cacapava Do Sul', :zip_code => '96.570-000', :state => state); c.save 
c = City.new(:name => 'Cacequi', :zip_code => '97.450-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Sul', :zip_code => '96.500-000', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha', :zip_code => '94.900-000', :state => state); c.save 
c = City.new(:name => 'Cacique Doble', :zip_code => '99.860-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Cadeado', :zip_code => '98.118-000', :state => state); c.save 
c = City.new(:name => 'Cadorna', :zip_code => '95.987-000', :state => state); c.save 
c = City.new(:name => 'Caibate', :zip_code => '97.930-000', :state => state); c.save 
c = City.new(:name => 'Caicara', :zip_code => '98.440-000', :state => state); c.save 
c = City.new(:name => 'Camaqua', :zip_code => '96.180-000', :state => state); c.save 
c = City.new(:name => 'Camargo', :zip_code => '99.165-000', :state => state); c.save 
c = City.new(:name => 'Cambara Do Sul', :zip_code => '95.480-000', :state => state); c.save 
c = City.new(:name => 'Camobi', :zip_code => '97.000-000', :state => state); c.save 
c = City.new(:name => 'Campina Das Missoes', :zip_code => '98.975-000', :state => state); c.save 
c = City.new(:name => 'Campina Redonda', :zip_code => '99.405-000', :state => state); c.save 
c = City.new(:name => 'Campinas', :zip_code => '98.255-000', :state => state); c.save 
c = City.new(:name => 'Campinas Do Sul', :zip_code => '99.660-000', :state => state); c.save 
c = City.new(:name => 'Campo Bom', :zip_code => '93.700-000', :state => state); c.save 
c = City.new(:name => 'Campo Branco', :zip_code => '95.926-000', :state => state); c.save 
c = City.new(:name => 'Campo Do Meio', :zip_code => '99.185-000', :state => state); c.save 
c = City.new(:name => 'Campo Novo', :zip_code => '98.570-000', :state => state); c.save 
c = City.new(:name => 'Campo Novo', :zip_code => '99.372-000', :state => state); c.save 
c = City.new(:name => 'Campo Santo', :zip_code => '98.585-000', :state => state); c.save 
c = City.new(:name => 'Campo Seco', :zip_code => '97.592-000', :state => state); c.save 
c = City.new(:name => 'Campo Vicente', :zip_code => '93.893-000', :state => state); c.save 
c = City.new(:name => 'Campos Borges', :zip_code => '99.435-000', :state => state); c.save 
c = City.new(:name => 'Candelaria', :zip_code => '96.930-000', :state => state); c.save 
c = City.new(:name => 'Nova Candelaria', :zip_code => '98.919-000', :state => state); c.save 
c = City.new(:name => 'Candido Freire', :zip_code => '98.880-000', :state => state); c.save 
c = City.new(:name => 'Candido Godoi', :zip_code => '98.970-000', :state => state); c.save 
c = City.new(:name => 'Candiota', :zip_code => '96.495-000', :state => state); c.save 
c = City.new(:name => 'Canela', :zip_code => '95.680-000', :state => state); c.save 
c = City.new(:name => 'Cangucu', :zip_code => '96.600-000', :state => state); c.save 
c = City.new(:name => 'Canhembora', :zip_code => '97.270-000', :state => state); c.save 
c = City.new(:name => 'Canoas', :zip_code => '92.000-000', :state => state); c.save 
c = City.new(:name => 'Canudos', :zip_code => '95.912-000', :state => state); c.save 
c = City.new(:name => 'Capane', :zip_code => '96.524-000', :state => state); c.save 
c = City.new(:name => 'Capao Bonito', :zip_code => '95.303-000', :state => state); c.save 
c = City.new(:name => 'Capao Bonito', :zip_code => '99.447-000', :state => state); c.save 
c = City.new(:name => 'Capao Da Canoa', :zip_code => '95.555-000', :state => state); c.save 
c = City.new(:name => 'Capao Da Porteira', :zip_code => '94.770-000', :state => state); c.save 
c = City.new(:name => 'Capao Do Leao', :zip_code => '96.160-000', :state => state); c.save 
c = City.new(:name => 'Capela De Santana', :zip_code => '95.745-000', :state => state); c.save 
c = City.new(:name => 'Capela Velha', :zip_code => '96.183-000', :state => state); c.save 
c = City.new(:name => 'Capinzal', :zip_code => '99.688-000', :state => state); c.save 
c = City.new(:name => 'Capitao', :zip_code => '95.935-000', :state => state); c.save 
c = City.new(:name => 'Capivari Do Sul', :zip_code => '95.552-000', :state => state); c.save 
c = City.new(:name => 'Capivarita', :zip_code => '96.695-000', :state => state); c.save 
c = City.new(:name => 'Capo-ere', :zip_code => '99.723-000', :state => state); c.save 
c = City.new(:name => 'Capoeira Grande', :zip_code => '98.525-000', :state => state); c.save 
c = City.new(:name => 'Caraa', :zip_code => '95.515-000', :state => state); c.save 
c = City.new(:name => 'Caraja Seival', :zip_code => '96.580-000', :state => state); c.save 
c = City.new(:name => 'Carazinho', :zip_code => '99.500-000', :state => state); c.save 
c = City.new(:name => 'Carlos Barbosa', :zip_code => '95.185-000', :state => state); c.save 
c = City.new(:name => 'Carlos Gomes', :zip_code => '99.825-000', :state => state); c.save 
c = City.new(:name => 'Carovi', :zip_code => '97.733-000', :state => state); c.save 
c = City.new(:name => 'Casca', :zip_code => '99.260-000', :state => state); c.save 
c = City.new(:name => 'Cascata', :zip_code => '98.922-000', :state => state); c.save 
c = City.new(:name => 'Cascata', :zip_code => '96.140-000', :state => state); c.save 
c = City.new(:name => 'Caseiros', :zip_code => '95.315-000', :state => state); c.save 
c = City.new(:name => 'Castelinho', :zip_code => '98.405-000', :state => state); c.save 
c = City.new(:name => 'Catuipe', :zip_code => '98.770-000', :state => state); c.save 
c = City.new(:name => 'Cavajureta', :zip_code => '97.440-000', :state => state); c.save 
c = City.new(:name => 'Caxias Do Sul', :zip_code => '95.000-000', :state => state); c.save 
c = City.new(:name => 'Cazuza Ferreira', :zip_code => '95.450-000', :state => state); c.save 
c = City.new(:name => 'Cedro Marcado', :zip_code => '98.520-000', :state => state); c.save 
c = City.new(:name => 'Centenario', :zip_code => '99.838-000', :state => state); c.save 
c = City.new(:name => 'Centenario', :zip_code => '98.313-000', :state => state); c.save 
c = City.new(:name => 'Centro Linha Brasil', :zip_code => '95.808-000', :state => state); c.save 
c = City.new(:name => 'Cerrito Alegre', :zip_code => '96.105-000', :state => state); c.save 
c = City.new(:name => 'Cerrito Do Ouro Ou Vila Do Cerrito', :zip_code => '97.370-000', :state => state); c.save 
c = City.new(:name => 'Cerro Alto', :zip_code => '98.943-000', :state => state); c.save 
c = City.new(:name => 'Cerro Branco', :zip_code => '96.535-000', :state => state); c.save 
c = City.new(:name => 'Cerro Claro', :zip_code => '97.403-000', :state => state); c.save 
c = City.new(:name => 'Cerro Do Martins', :zip_code => '96.575-000', :state => state); c.save 
c = City.new(:name => 'Cerro Do Roque', :zip_code => '96.753-000', :state => state); c.save 
c = City.new(:name => 'Cerro Grande', :zip_code => '98.340-000', :state => state); c.save 
c = City.new(:name => 'Cerro Grande Do Sul', :zip_code => '96.770-000', :state => state); c.save 
c = City.new(:name => 'Cerro Largo', :zip_code => '97.900-000', :state => state); c.save 
c = City.new(:name => 'Chapada', :zip_code => '99.530-000', :state => state); c.save 
c = City.new(:name => 'Chapada', :zip_code => '95.425-000', :state => state); c.save 
c = City.new(:name => 'Vertentes', :zip_code => '97.520-000', :state => state); c.save 
c = City.new(:name => 'Charqueadas', :zip_code => '96.745-000', :state => state); c.save 
c = City.new(:name => 'Charrua', :zip_code => '99.960-000', :state => state); c.save 
c = City.new(:name => 'Chiapetta', :zip_code => '98.760-000', :state => state); c.save 
c = City.new(:name => 'Chimarrao', :zip_code => '95.312-000', :state => state); c.save 
c = City.new(:name => 'Chorao', :zip_code => '98.720-000', :state => state); c.save 
c = City.new(:name => 'Chui', :zip_code => '96.255-000', :state => state); c.save 
c = City.new(:name => 'Cidreira', :zip_code => '95.595-000', :state => state); c.save 
c = City.new(:name => 'Cinquentenario', :zip_code => '98.946-000', :state => state); c.save 
c = City.new(:name => 'Ciriaco', :zip_code => '99.970-000', :state => state); c.save 
c = City.new(:name => 'Clara', :zip_code => '97.415-000', :state => state); c.save 
c = City.new(:name => 'Clemente Argolo', :zip_code => '95.302-000', :state => state); c.save 
c = City.new(:name => 'Coimbra', :zip_code => '98.868-000', :state => state); c.save 
c = City.new(:name => 'Colonia Das Almas', :zip_code => '98.775-000', :state => state); c.save 
c = City.new(:name => 'Vila Langaro', :zip_code => '99.955-000', :state => state); c.save 
c = City.new(:name => 'Colonia Medeiros', :zip_code => '98.916-000', :state => state); c.save 
c = City.new(:name => 'Colonia Municipal', :zip_code => '98.844-000', :state => state); c.save 
c = City.new(:name => 'Colonia Nova', :zip_code => '96.439-000', :state => state); c.save 
c = City.new(:name => 'Coloninha', :zip_code => '96.980-000', :state => state); c.save 
c = City.new(:name => 'Colorado', :zip_code => '99.460-000', :state => state); c.save 
c = City.new(:name => 'Comandai', :zip_code => '98.841-000', :state => state); c.save 
c = City.new(:name => 'Condor', :zip_code => '98.290-000', :state => state); c.save 
c = City.new(:name => 'Consolata', :zip_code => '98.914-000', :state => state); c.save 
c = City.new(:name => 'Constantina', :zip_code => '99.680-000', :state => state); c.save 
c = City.new(:name => 'Coqueiro Baixo', :zip_code => '95.955-000', :state => state); c.save 
c = City.new(:name => 'Coqueiros Do Sul', :zip_code => '99.528-000', :state => state); c.save 
c = City.new(:name => 'Cordilheira', :zip_code => '96.528-000', :state => state); c.save 
c = City.new(:name => 'Coroados', :zip_code => '98.598-000', :state => state); c.save 
c = City.new(:name => 'Coronel Barros', :zip_code => '98.735-000', :state => state); c.save 
c = City.new(:name => 'Coronel Bicaco', :zip_code => '98.580-000', :state => state); c.save 
c = City.new(:name => 'Coronel Finzito', :zip_code => '98.395-000', :state => state); c.save 
c = City.new(:name => 'Coronel Pilar', :zip_code => '95.726-000', :state => state); c.save 
c = City.new(:name => 'Coronel Teixeira', :zip_code => '99.805-000', :state => state); c.save 
c = City.new(:name => 'Colinas', :zip_code => '95.895-000', :state => state); c.save 
c = City.new(:name => 'Costa Da Cadeia', :zip_code => '95.855-000', :state => state); c.save 
c = City.new(:name => 'Costao', :zip_code => '95.882-000', :state => state); c.save 
c = City.new(:name => 'Cotipora', :zip_code => '95.335-000', :state => state); c.save 
c = City.new(:name => 'Coxilha', :zip_code => '99.145-000', :state => state); c.save 
c = City.new(:name => 'Coxilha Grande', :zip_code => '95.223-000', :state => state); c.save 
c = City.new(:name => 'Crissiumal', :zip_code => '98.640-000', :state => state); c.save 
c = City.new(:name => 'Cristal', :zip_code => '96.195-000', :state => state); c.save 
c = City.new(:name => 'Criuva', :zip_code => '95.143-000', :state => state); c.save 
c = City.new(:name => 'Cruz Alta', :zip_code => '98.000-000', :state => state); c.save 
c = City.new(:name => 'Cruz Altense', :zip_code => '99.665-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Do Sul', :zip_code => '95.930-000', :state => state); c.save 
c = City.new(:name => 'Curral Alto', :zip_code => '96.245-000', :state => state); c.save 
c = City.new(:name => 'Daltro Filho', :zip_code => '95.724-000', :state => state); c.save 
c = City.new(:name => 'Daltro Filho', :zip_code => '98.515-000', :state => state); c.save 
c = City.new(:name => 'David Canabarro', :zip_code => '99.980-000', :state => state); c.save 
c = City.new(:name => 'Deodoro', :zip_code => '95.810-000', :state => state); c.save 
c = City.new(:name => 'Deposito', :zip_code => '99.420-000', :state => state); c.save 
c = City.new(:name => 'Derrubadas', :zip_code => '98.528-000', :state => state); c.save 
c = City.new(:name => 'Dezesseis De Novembro', :zip_code => '97.845-000', :state => state); c.save 
c = City.new(:name => 'Dilermando De Aguiar', :zip_code => '97.180-000', :state => state); c.save 
c = City.new(:name => 'Dois Irmaos', :zip_code => '93.950-000', :state => state); c.save 
c = City.new(:name => 'Dois Irmaos Das Missoes', :zip_code => '98.385-000', :state => state); c.save 
c = City.new(:name => 'Dois Lajeados', :zip_code => '99.220-000', :state => state); c.save 
c = City.new(:name => 'Dom Feliciano', :zip_code => '96.190-000', :state => state); c.save 
c = City.new(:name => 'Dom Feliciano', :zip_code => '94.350-000', :state => state); c.save 
c = City.new(:name => 'Dom Pedrito', :zip_code => '96.450-000', :state => state); c.save 
c = City.new(:name => 'Dona Francisca', :zip_code => '97.280-000', :state => state); c.save 
c = City.new(:name => 'Dona Otilia', :zip_code => '97.973-000', :state => state); c.save 
c = City.new(:name => 'Dourado', :zip_code => '99.775-000', :state => state); c.save 
c = City.new(:name => 'Doutor Bozano', :zip_code => '98.715-000', :state => state); c.save 
c = City.new(:name => 'Doutor Edgardo Pereira Velho', :zip_code => '96.280-000', :state => state); c.save 
c = City.new(:name => 'Doutor Mauricio Cardoso', :zip_code => '98.925-000', :state => state); c.save 
c = City.new(:name => 'Eldorado Do Sul', :zip_code => '92.990-000', :state => state); c.save 
c = City.new(:name => 'Eletra', :zip_code => '95.435-000', :state => state); c.save 
c = City.new(:name => 'Encantado', :zip_code => '95.960-000', :state => state); c.save 
c = City.new(:name => 'Encruzilhada', :zip_code => '97.665-000', :state => state); c.save 
c = City.new(:name => 'Encruzilhada Do Sul', :zip_code => '96.610-000', :state => state); c.save 
c = City.new(:name => 'Engenho Velho', :zip_code => '99.698-000', :state => state); c.save 
c = City.new(:name => 'Entre-ijuis', :zip_code => '98.855-000', :state => state); c.save 
c = City.new(:name => 'Entrepelado', :zip_code => '95.605-000', :state => state); c.save 
c = City.new(:name => 'Erebango', :zip_code => '99.920-000', :state => state); c.save 
c = City.new(:name => 'Erechim', :zip_code => '99.700-000', :state => state); c.save 
c = City.new(:name => 'Ernestina', :zip_code => '99.140-000', :state => state); c.save 
c = City.new(:name => 'Ernesto Alves', :zip_code => '97.750-000', :state => state); c.save 
c = City.new(:name => 'Erval Grande', :zip_code => '99.750-000', :state => state); c.save 
c = City.new(:name => 'Erval Seco', :zip_code => '98.390-000', :state => state); c.save 
c = City.new(:name => 'Erveiras', :zip_code => '96.868-000', :state => state); c.save 
c = City.new(:name => 'Esmeralda', :zip_code => '95.380-000', :state => state); c.save 
c = City.new(:name => 'Esperanca Do Sul', :zip_code => '98.635-000', :state => state); c.save 
c = City.new(:name => 'Espigao', :zip_code => '94.740-000', :state => state); c.save 
c = City.new(:name => 'Espigao Alto', :zip_code => '95.375-000', :state => state); c.save 
c = City.new(:name => 'Espinilho Grande', :zip_code => '98.173-000', :state => state); c.save 
c = City.new(:name => 'Espirito Santo', :zip_code => '98.907-000', :state => state); c.save 
c = City.new(:name => 'Espumoso', :zip_code => '99.400-000', :state => state); c.save 
c = City.new(:name => 'Esquina Araujo', :zip_code => '98.917-000', :state => state); c.save 
c = City.new(:name => 'Esquina Gaucha', :zip_code => '98.655-000', :state => state); c.save 
c = City.new(:name => 'Esquina Gaucha', :zip_code => '98.857-000', :state => state); c.save 
c = City.new(:name => 'Esquina Ipiranga', :zip_code => '98.885-000', :state => state); c.save 
c = City.new(:name => 'Estancia Grande', :zip_code => '94.890-000', :state => state); c.save 
c = City.new(:name => 'Estancia Velha', :zip_code => '93.600-000', :state => state); c.save 
c = City.new(:name => 'Esteio', :zip_code => '93.250-000', :state => state); c.save 
c = City.new(:name => 'Esteira', :zip_code => '95.218-000', :state => state); c.save 
c = City.new(:name => 'Estreito', :zip_code => '96.227-000', :state => state); c.save 
c = City.new(:name => 'Estrela', :zip_code => '95.880-000', :state => state); c.save 
c = City.new(:name => 'Estrela', :zip_code => '95.227-000', :state => state); c.save 
c = City.new(:name => 'Estrela Velha', :zip_code => '96.990-000', :state => state); c.save 
c = City.new(:name => 'Eugenio De Castro', :zip_code => '98.860-000', :state => state); c.save 
c = City.new(:name => 'Evangelista', :zip_code => '99.262-000', :state => state); c.save 
c = City.new(:name => 'Fagundes Varela', :zip_code => '95.333-000', :state => state); c.save 
c = City.new(:name => 'Fao', :zip_code => '95.914-000', :state => state); c.save 
c = City.new(:name => 'Faria Lemos', :zip_code => '95.713-000', :state => state); c.save 
c = City.new(:name => 'Farinhas', :zip_code => '98.490-000', :state => state); c.save 
c = City.new(:name => 'Farrapos', :zip_code => '99.872-000', :state => state); c.save 
c = City.new(:name => 'Farroupilha', :zip_code => '95.180-000', :state => state); c.save 
c = City.new(:name => 'Faxinal', :zip_code => '99.357-000', :state => state); c.save 
c = City.new(:name => 'Faxinal Do Soturno', :zip_code => '97.220-000', :state => state); c.save 
c = City.new(:name => 'Faxinalzinho', :zip_code => '99.655-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Souza', :zip_code => '95.125-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Vilanova', :zip_code => '95.875-000', :state => state); c.save 
c = City.new(:name => 'Feliz', :zip_code => '95.770-000', :state => state); c.save 
c = City.new(:name => 'Ferreira', :zip_code => '96.521-000', :state => state); c.save 
c = City.new(:name => 'Flores Da Cunha', :zip_code => '95.270-000', :state => state); c.save 
c = City.new(:name => 'Floresta', :zip_code => '98.710-000', :state => state); c.save 
c = City.new(:name => 'Floriano Peixoto', :zip_code => '99.910-000', :state => state); c.save 
c = City.new(:name => 'Florida', :zip_code => '97.725-000', :state => state); c.save 
c = City.new(:name => 'Fontoura Xavier', :zip_code => '99.370-000', :state => state); c.save 
c = City.new(:name => 'Formigueiro', :zip_code => '97.210-000', :state => state); c.save 
c = City.new(:name => 'Formosa', :zip_code => '96.871-000', :state => state); c.save 
c = City.new(:name => 'Forninho', :zip_code => '96.583-000', :state => state); c.save 
c = City.new(:name => 'Forquetinha', :zip_code => '95.907-000', :state => state); c.save 
c = City.new(:name => 'Fortaleza Dos Valos', :zip_code => '98.125-000', :state => state); c.save 
c = City.new(:name => 'Frederico Westphalen', :zip_code => '98.400-000', :state => state); c.save 
c = City.new(:name => 'Gentil', :zip_code => '99.160-000', :state => state); c.save 
c = City.new(:name => 'Freire', :zip_code => '96.390-000', :state => state); c.save 
c = City.new(:name => 'Garibaldi', :zip_code => '95.720-000', :state => state); c.save 
c = City.new(:name => 'Garibaldina', :zip_code => '95.723-000', :state => state); c.save 
c = City.new(:name => 'Garruchos', :zip_code => '97.690-000', :state => state); c.save 
c = City.new(:name => 'Gaurama', :zip_code => '99.830-000', :state => state); c.save 
c = City.new(:name => 'General Camara', :zip_code => '95.820-000', :state => state); c.save 
c = City.new(:name => 'Getulio Vargas', :zip_code => '99.900-000', :state => state); c.save 
c = City.new(:name => 'Girua', :zip_code => '98.870-000', :state => state); c.save 
c = City.new(:name => 'Gloria', :zip_code => '95.565-000', :state => state); c.save 
c = City.new(:name => 'Glorinha', :zip_code => '94.380-000', :state => state); c.save 
c = City.new(:name => 'Goio-en', :zip_code => '99.752-000', :state => state); c.save 
c = City.new(:name => 'Gramado', :zip_code => '95.670-000', :state => state); c.save 
c = City.new(:name => 'Gramado Dos Loureiros', :zip_code => '99.605-000', :state => state); c.save 
c = City.new(:name => 'Gramado Sao Pedro', :zip_code => '99.375-000', :state => state); c.save 
c = City.new(:name => 'Gramado Xavier', :zip_code => '96.875-000', :state => state); c.save 
c = City.new(:name => 'Gravatai', :zip_code => '94.000-000', :state => state); c.save 
c = City.new(:name => 'Guabiju', :zip_code => '95.355-000', :state => state); c.save 
c = City.new(:name => 'Guaiba', :zip_code => '92.500-000', :state => state); c.save 
c = City.new(:name => 'Guapore', :zip_code => '99.200-000', :state => state); c.save 
c = City.new(:name => 'Guarani Das Missoes', :zip_code => '97.950-000', :state => state); c.save 
c = City.new(:name => 'Guassupi', :zip_code => '97.408-000', :state => state); c.save 
c = City.new(:name => 'Harmonia', :zip_code => '95.785-000', :state => state); c.save 
c = City.new(:name => 'Herval', :zip_code => '96.310-000', :state => state); c.save 
c = City.new(:name => 'Hidraulica', :zip_code => '96.163-000', :state => state); c.save 
c = City.new(:name => 'Horizontina', :zip_code => '98.920-000', :state => state); c.save 
c = City.new(:name => 'Hulha Negra', :zip_code => '96.460-000', :state => state); c.save 
c = City.new(:name => 'Humaita', :zip_code => '98.670-000', :state => state); c.save 
c = City.new(:name => 'Ibarama', :zip_code => '96.925-000', :state => state); c.save 
c = City.new(:name => 'Ibare', :zip_code => '97.395-000', :state => state); c.save 
c = City.new(:name => 'Ibiaca', :zip_code => '99.940-000', :state => state); c.save 
c = City.new(:name => 'Ibiraiaras', :zip_code => '95.305-000', :state => state); c.save 
c = City.new(:name => 'Ibirapuita', :zip_code => '99.320-000', :state => state); c.save 
c = City.new(:name => 'Ibiruba', :zip_code => '98.200-000', :state => state); c.save 
c = City.new(:name => 'Igrejinha', :zip_code => '95.650-000', :state => state); c.save 
c = City.new(:name => 'Igrejinha', :zip_code => '99.515-000', :state => state); c.save 
c = City.new(:name => 'Ijucapirama', :zip_code => '97.763-000', :state => state); c.save 
c = City.new(:name => 'Ijui', :zip_code => '98.700-000', :state => state); c.save 
c = City.new(:name => 'Ilha Dos Marinheiros', :zip_code => '96.223-000', :state => state); c.save 
c = City.new(:name => 'Ilopolis', :zip_code => '95.990-000', :state => state); c.save 
c = City.new(:name => 'Independencia', :zip_code => '98.915-000', :state => state); c.save 
c = City.new(:name => 'Inhacora', :zip_code => '98.765-000', :state => state); c.save 
c = City.new(:name => 'Ipe', :zip_code => '95.240-000', :state => state); c.save 
c = City.new(:name => 'Ipiranga Do Sul', :zip_code => '99.925-000', :state => state); c.save 
c = City.new(:name => 'Ipiranga', :zip_code => '94.370-000', :state => state); c.save 
c = City.new(:name => 'Ipuacu', :zip_code => '98.445-000', :state => state); c.save 
c = City.new(:name => 'Irai', :zip_code => '98.460-000', :state => state); c.save 
c = City.new(:name => 'Irui', :zip_code => '96.655-000', :state => state); c.save 
c = City.new(:name => 'Itaara', :zip_code => '97.185-000', :state => state); c.save 
c = City.new(:name => 'Itacolomi', :zip_code => '94.330-000', :state => state); c.save 
c = City.new(:name => 'Itacurubi', :zip_code => '97.720-000', :state => state); c.save 
c = City.new(:name => 'Itacurubi', :zip_code => '97.685-000', :state => state); c.save 
c = City.new(:name => 'Itaimbezinho', :zip_code => '95.296-000', :state => state); c.save 
c = City.new(:name => 'Itao', :zip_code => '97.660-000', :state => state); c.save 
c = City.new(:name => 'Itapua', :zip_code => '94.750-000', :state => state); c.save 
c = City.new(:name => 'Itapuca', :zip_code => '95.983-000', :state => state); c.save 
c = City.new(:name => 'Itaqui', :zip_code => '97.650-000', :state => state); c.save 
c = City.new(:name => 'Itati', :zip_code => '95.538-000', :state => state); c.save 
c = City.new(:name => 'Itatiba Do Sul', :zip_code => '99.760-000', :state => state); c.save 
c = City.new(:name => 'Itauba', :zip_code => '96.960-000', :state => state); c.save 
c = City.new(:name => 'Ituim', :zip_code => '95.225-000', :state => state); c.save 
c = City.new(:name => 'Ivai', :zip_code => '97.855-000', :state => state); c.save 
c = City.new(:name => 'Ivora', :zip_code => '98.160-000', :state => state); c.save 
c = City.new(:name => 'Ivoti', :zip_code => '93.900-000', :state => state); c.save 
c = City.new(:name => 'Jaboticaba', :zip_code => '98.350-000', :state => state); c.save 
c = City.new(:name => 'Jacuizinho', :zip_code => '99.442-000', :state => state); c.save 
c = City.new(:name => 'Jacutinga', :zip_code => '99.730-000', :state => state); c.save 
c = City.new(:name => 'Jaguarao', :zip_code => '96.300-000', :state => state); c.save 
c = City.new(:name => 'Jaguarete', :zip_code => '99.715-000', :state => state); c.save 
c = City.new(:name => 'Jaguari', :zip_code => '97.760-000', :state => state); c.save 
c = City.new(:name => 'Jansen', :zip_code => '95.181-000', :state => state); c.save 
c = City.new(:name => 'Jaquirana', :zip_code => '95.420-000', :state => state); c.save 
c = City.new(:name => 'Jari', :zip_code => '98.175-000', :state => state); c.save 
c = City.new(:name => 'Jazidas Ou Capela Sao Vicente', :zip_code => '97.380-000', :state => state); c.save 
c = City.new(:name => 'Joao Arregui', :zip_code => '97.530-000', :state => state); c.save 
c = City.new(:name => 'Joao Rodrigues', :zip_code => '96.665-000', :state => state); c.save 
c = City.new(:name => 'Joca Tavares', :zip_code => '96.435-000', :state => state); c.save 
c = City.new(:name => 'Joia', :zip_code => '98.180-000', :state => state); c.save 
c = City.new(:name => 'Jose Otavio', :zip_code => '96.431-000', :state => state); c.save 
c = City.new(:name => 'Jua', :zip_code => '95.430-000', :state => state); c.save 
c = City.new(:name => 'Julio De Castilhos', :zip_code => '98.130-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Bonito', :zip_code => '95.338-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Bonita', :zip_code => '96.904-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Dos Tres Cantos', :zip_code => '99.495-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Vermelha', :zip_code => '95.300-000', :state => state); c.save 
c = City.new(:name => 'Lagoao', :zip_code => '99.340-000', :state => state); c.save 
c = City.new(:name => 'Lajeado', :zip_code => '95.900-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Bonito', :zip_code => '98.685-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Cerne', :zip_code => '98.845-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Grande', :zip_code => '98.650-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Grande', :zip_code => '95.440-000', :state => state); c.save 
c = City.new(:name => 'Lara', :zip_code => '98.603-000', :state => state); c.save 
c = City.new(:name => 'Laranjeira', :zip_code => '98.455-000', :state => state); c.save 
c = City.new(:name => 'Lavras Do Sul', :zip_code => '97.390-000', :state => state); c.save 
c = City.new(:name => 'Leonel Rocha', :zip_code => '98.333-000', :state => state); c.save 
c = City.new(:name => 'Liberato Salzano', :zip_code => '99.690-000', :state => state); c.save 
c = City.new(:name => 'Linha Vitoria', :zip_code => '99.513-000', :state => state); c.save 
c = City.new(:name => 'Loreto', :zip_code => '97.430-000', :state => state); c.save 
c = City.new(:name => 'Machadinho', :zip_code => '99.880-000', :state => state); c.save 
c = City.new(:name => 'Novo Machado', :zip_code => '98.955-000', :state => state); c.save 
c = City.new(:name => 'Manchinha', :zip_code => '98.912-000', :state => state); c.save 
c = City.new(:name => 'Mangueiras', :zip_code => '97.596-000', :state => state); c.save 
c = City.new(:name => 'Manoel Viana', :zip_code => '97.640-000', :state => state); c.save 
c = City.new(:name => 'Maquine', :zip_code => '95.530-000', :state => state); c.save 
c = City.new(:name => 'Brochier', :zip_code => '95.790-000', :state => state); c.save 
c = City.new(:name => 'Marau', :zip_code => '99.150-000', :state => state); c.save 
c = City.new(:name => 'Marcelino Ramos', :zip_code => '99.800-000', :state => state); c.save 
c = City.new(:name => 'Marcorama', :zip_code => '95.725-000', :state => state); c.save 
c = City.new(:name => 'Vila Maria', :zip_code => '99.155-000', :state => state); c.save 
c = City.new(:name => 'Mariana Pimentel', :zip_code => '92.900-000', :state => state); c.save 
c = City.new(:name => 'Mariano Moro', :zip_code => '99.790-000', :state => state); c.save 
c = City.new(:name => 'Mariante', :zip_code => '95.815-000', :state => state); c.save 
c = City.new(:name => 'Mariapolis', :zip_code => '95.527-000', :state => state); c.save 
c = City.new(:name => 'Marques De Souza', :zip_code => '95.923-000', :state => state); c.save 
c = City.new(:name => 'Macambara', :zip_code => '97.645-000', :state => state); c.save 
c = City.new(:name => 'Mata', :zip_code => '97.410-000', :state => state); c.save 
c = City.new(:name => 'Matarazzo', :zip_code => '96.370-000', :state => state); c.save 
c = City.new(:name => 'Mato Grande', :zip_code => '98.890-000', :state => state); c.save 
c = City.new(:name => 'Mato Leitao', :zip_code => '95.835-000', :state => state); c.save 
c = City.new(:name => 'Mato Queimado', :zip_code => '97.935-000', :state => state); c.save 
c = City.new(:name => 'Maua', :zip_code => '96.335-000', :state => state); c.save 
c = City.new(:name => 'Maua', :zip_code => '98.730-000', :state => state); c.save 
c = City.new(:name => 'Itapuca', :zip_code => '95.997-000', :state => state); c.save 
c = City.new(:name => 'Maximiliano De Almeida', :zip_code => '99.890-000', :state => state); c.save 
c = City.new(:name => 'Medianeira', :zip_code => '98.755-000', :state => state); c.save 
c = City.new(:name => 'Vale Verde', :zip_code => '95.833-000', :state => state); c.save 
c = City.new(:name => 'Minas Do Leao', :zip_code => '96.755-000', :state => state); c.save 
c = City.new(:name => 'Miraguai', :zip_code => '98.540-000', :state => state); c.save 
c = City.new(:name => 'Miraguaia', :zip_code => '95.510-000', :state => state); c.save 
c = City.new(:name => 'Mirim', :zip_code => '96.250-000', :state => state); c.save 
c = City.new(:name => 'Mirim', :zip_code => '99.815-000', :state => state); c.save 
c = City.new(:name => 'Montauri', :zip_code => '99.255-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre', :zip_code => '95.828-000', :state => state); c.save 
c = City.new(:name => 'Monte Alverne', :zip_code => '96.859-000', :state => state); c.save 
c = City.new(:name => 'Monte Belo Do Sul', :zip_code => '95.718-000', :state => state); c.save 
c = City.new(:name => 'Monte Bonito', :zip_code => '96.115-000', :state => state); c.save 
c = City.new(:name => 'Montenegro', :zip_code => '95.780-000', :state => state); c.save 
c = City.new(:name => 'Mormaco', :zip_code => '99.315-000', :state => state); c.save 
c = City.new(:name => 'Morrinhos', :zip_code => '96.720-000', :state => state); c.save 
c = City.new(:name => 'Morro Azul', :zip_code => '95.583-000', :state => state); c.save 
c = City.new(:name => 'Morro Redondo', :zip_code => '96.150-000', :state => state); c.save 
c = City.new(:name => 'Morro Reuter', :zip_code => '93.990-000', :state => state); c.save 
c = City.new(:name => 'Morungava', :zip_code => '94.360-000', :state => state); c.save 
c = City.new(:name => 'Mostardas', :zip_code => '96.270-000', :state => state); c.save 
c = City.new(:name => 'Mucum', :zip_code => '95.970-000', :state => state); c.save 
c = City.new(:name => 'Muitos Capoes', :zip_code => '95.230-000', :state => state); c.save 
c = City.new(:name => 'Muliterno', :zip_code => '99.990-000', :state => state); c.save 
c = City.new(:name => 'Nao-me-toque', :zip_code => '99.470-000', :state => state); c.save 
c = City.new(:name => 'Nicolau Vergueiro', :zip_code => '99.175-000', :state => state); c.save 
c = City.new(:name => 'Nonoai', :zip_code => '99.600-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Aparecida', :zip_code => '98.260-000', :state => state); c.save 
c = City.new(:name => 'Nova Alvorada', :zip_code => '95.985-000', :state => state); c.save 
c = City.new(:name => 'Nova Araca', :zip_code => '95.350-000', :state => state); c.save 
c = City.new(:name => 'Nova Bassano', :zip_code => '95.340-000', :state => state); c.save 
c = City.new(:name => 'Nova Brescia', :zip_code => '95.950-000', :state => state); c.save 
c = City.new(:name => 'Nova Esperanca Do Sul', :zip_code => '97.770-000', :state => state); c.save 
c = City.new(:name => 'Nova Milano', :zip_code => '95.182-000', :state => state); c.save 
c = City.new(:name => 'Nova Padua', :zip_code => '95.275-000', :state => state); c.save 
c = City.new(:name => 'Nova Palma', :zip_code => '97.250-000', :state => state); c.save 
c = City.new(:name => 'Nova Petropolis', :zip_code => '95.150-000', :state => state); c.save 
c = City.new(:name => 'Nova Prata', :zip_code => '95.320-000', :state => state); c.save 
c = City.new(:name => 'Nova Roma Do Sul', :zip_code => '95.260-000', :state => state); c.save 
c = City.new(:name => 'Nova Sardenha', :zip_code => '95.183-000', :state => state); c.save 
c = City.new(:name => 'Novo Hamburgo', :zip_code => '93.300-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '99.448-000', :state => state); c.save 
c = City.new(:name => 'Campestre Da Serra', :zip_code => '95.255-000', :state => state); c.save 
c = City.new(:name => 'Oliva', :zip_code => '95.135-000', :state => state); c.save 
c = City.new(:name => 'Oralina', :zip_code => '99.449-000', :state => state); c.save 
c = City.new(:name => 'Osorio', :zip_code => '95.520-000', :state => state); c.save 
c = City.new(:name => 'Osvaldo Cruz', :zip_code => '98.403-000', :state => state); c.save 
c = City.new(:name => 'Osvaldo Kroeff', :zip_code => '95.485-000', :state => state); c.save 
c = City.new(:name => 'Otavio Rocha', :zip_code => '95.272-000', :state => state); c.save 
c = City.new(:name => 'Pacheca', :zip_code => '96.185-000', :state => state); c.save 
c = City.new(:name => 'Padilha', :zip_code => '95.610-000', :state => state); c.save 
c = City.new(:name => 'Padre Gonzales', :zip_code => '98.620-000', :state => state); c.save 
c = City.new(:name => 'Paim Filho', :zip_code => '99.850-000', :state => state); c.save 
c = City.new(:name => 'Palmares Do Sul', :zip_code => '95.540-000', :state => state); c.save 
c = City.new(:name => 'Palmas', :zip_code => '96.437-000', :state => state); c.save 
c = City.new(:name => 'Palmeira Das Missoes', :zip_code => '98.300-000', :state => state); c.save 
c = City.new(:name => 'Palmitinho', :zip_code => '98.430-000', :state => state); c.save 
c = City.new(:name => 'Pampeiro', :zip_code => '97.585-000', :state => state); c.save 
c = City.new(:name => 'Panambi', :zip_code => '98.280-000', :state => state); c.save 
c = City.new(:name => 'Pantano Grande', :zip_code => '96.690-000', :state => state); c.save 
c = City.new(:name => 'Parai', :zip_code => '95.360-000', :state => state); c.save 
c = City.new(:name => 'Paraiso Do Sul', :zip_code => '96.530-000', :state => state); c.save 
c = City.new(:name => 'Pareci Novo', :zip_code => '95.783-000', :state => state); c.save 
c = City.new(:name => 'Parobe', :zip_code => '95.630-000', :state => state); c.save 
c = City.new(:name => 'Passa Sete', :zip_code => '96.908-000', :state => state); c.save 
c = City.new(:name => 'Passinhos', :zip_code => '95.525-000', :state => state); c.save 
c = City.new(:name => 'Passo Burmann', :zip_code => '98.776-000', :state => state); c.save 
c = City.new(:name => 'Passo Da Areia', :zip_code => '94.780-000', :state => state); c.save 
c = City.new(:name => 'Passo Das Pedras', :zip_code => '96.165-000', :state => state); c.save 
c = City.new(:name => 'Passo Do Adao', :zip_code => '96.675-000', :state => state); c.save 
c = City.new(:name => 'Passo Do Sabao', :zip_code => '94.730-000', :state => state); c.save 
c = City.new(:name => 'Passo Do Sobrado', :zip_code => '96.685-000', :state => state); c.save 
c = City.new(:name => 'Passo Fundo', :zip_code => '99.000-000', :state => state); c.save 
c = City.new(:name => 'Passo Novo', :zip_code => '97.555-000', :state => state); c.save 
c = City.new(:name => 'Passo Raso', :zip_code => '95.850-000', :state => state); c.save 
c = City.new(:name => 'Paulo Bento', :zip_code => '99.718-000', :state => state); c.save 
c = City.new(:name => 'Pavao', :zip_code => '96.168-000', :state => state); c.save 
c = City.new(:name => 'Paverama', :zip_code => '95.865-000', :state => state); c.save 
c = City.new(:name => 'Pedras Altas', :zip_code => '96.480-000', :state => state); c.save 
c = City.new(:name => 'Pedreiras', :zip_code => '96.340-000', :state => state); c.save 
c = City.new(:name => 'Pedro Garcia', :zip_code => '98.565-000', :state => state); c.save 
c = City.new(:name => 'Pedro Osorio', :zip_code => '96.360-000', :state => state); c.save 
c = City.new(:name => 'Pedro Paiva', :zip_code => '98.593-000', :state => state); c.save 
c = City.new(:name => 'Pejucara', :zip_code => '98.270-000', :state => state); c.save 
c = City.new(:name => 'Pelotas', :zip_code => '96.000-000', :state => state); c.save 
c = City.new(:name => 'Picada Cafe', :zip_code => '95.175-000', :state => state); c.save 
c = City.new(:name => 'Nova Hartz', :zip_code => '93.890-000', :state => state); c.save 
c = City.new(:name => 'Pinhal', :zip_code => '98.345-000', :state => state); c.save 
c = City.new(:name => 'Pinhal', :zip_code => '99.307-000', :state => state); c.save 
c = City.new(:name => 'Pinhal Alto', :zip_code => '95.160-000', :state => state); c.save 
c = City.new(:name => 'Pinhal Da Serra', :zip_code => '95.390-000', :state => state); c.save 
c = City.new(:name => 'Pinhal Grande', :zip_code => '98.150-000', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '99.754-000', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '99.695-000', :state => state); c.save 
c = City.new(:name => 'Pinheirinho Do Vale', :zip_code => '98.435-000', :state => state); c.save 
c = City.new(:name => 'Pinheiro Machado', :zip_code => '96.470-000', :state => state); c.save 
c = City.new(:name => 'Pinheiro Machado', :zip_code => '97.990-000', :state => state); c.save 
c = City.new(:name => 'Pinheiro Marcado', :zip_code => '99.520-000', :state => state); c.save 
c = City.new(:name => 'Pinto Bandeira', :zip_code => '95.712-000', :state => state); c.save 
c = City.new(:name => 'Pirai', :zip_code => '96.443-000', :state => state); c.save 
c = City.new(:name => 'Pirapo', :zip_code => '97.885-000', :state => state); c.save 
c = City.new(:name => 'Piratini', :zip_code => '96.490-000', :state => state); c.save 
c = City.new(:name => 'Pitanga', :zip_code => '98.926-000', :state => state); c.save 
c = City.new(:name => 'Planalto', :zip_code => '98.470-000', :state => state); c.save 
c = City.new(:name => 'Planalto', :zip_code => '98.645-000', :state => state); c.save 
c = City.new(:name => 'Plano Alto', :zip_code => '97.515-000', :state => state); c.save 
c = City.new(:name => 'Poco Das Antas', :zip_code => '95.740-000', :state => state); c.save 
c = City.new(:name => 'Poligono Do Erval', :zip_code => '99.353-000', :state => state); c.save 
c = City.new(:name => 'Polo Petroquimico De Triunfo', :zip_code => '95.853-000', :state => state); c.save 
c = City.new(:name => 'Pontao', :zip_code => '99.190-000', :state => state); c.save 
c = City.new(:name => 'Ponte Preta', :zip_code => '99.735-000', :state => state); c.save 
c = City.new(:name => 'Portao', :zip_code => '93.180-000', :state => state); c.save 
c = City.new(:name => 'Porto Alegre', :zip_code => '90.000-000', :state => state); c.save 
c = City.new(:name => 'Porto Batista', :zip_code => '95.845-000', :state => state); c.save 
c = City.new(:name => 'Porto Lucena', :zip_code => '98.980-000', :state => state); c.save 
c = City.new(:name => 'Porto Maua', :zip_code => '98.947-000', :state => state); c.save 
c = City.new(:name => 'Porto Xavier', :zip_code => '98.995-000', :state => state); c.save 
c = City.new(:name => 'Pouso Novo', :zip_code => '95.945-000', :state => state); c.save 
c = City.new(:name => 'Povo Novo', :zip_code => '96.224-000', :state => state); c.save 
c = City.new(:name => 'Povoado Tozzo', :zip_code => '99.763-000', :state => state); c.save 
c = City.new(:name => 'Pranchada', :zip_code => '98.928-000', :state => state); c.save 
c = City.new(:name => 'Pratos', :zip_code => '98.936-000', :state => state); c.save 
c = City.new(:name => 'Progresso', :zip_code => '96.970-000', :state => state); c.save 
c = City.new(:name => 'Progresso', :zip_code => '95.925-000', :state => state); c.save 
c = City.new(:name => 'Progresso', :zip_code => '99.678-000', :state => state); c.save 
c = City.new(:name => 'Progresso', :zip_code => '98.911-000', :state => state); c.save 
c = City.new(:name => 'Protasio Alves', :zip_code => '95.345-000', :state => state); c.save 
c = City.new(:name => 'Uniao Da Serra', :zip_code => '99.215-000', :state => state); c.save 
c = City.new(:name => 'Pulador', :zip_code => '99.130-000', :state => state); c.save 
c = City.new(:name => 'Putinga', :zip_code => '95.975-000', :state => state); c.save 
c = City.new(:name => 'Quarai', :zip_code => '97.560-000', :state => state); c.save 
c = City.new(:name => 'Quaraim', :zip_code => '98.913-000', :state => state); c.save 
c = City.new(:name => 'Quatro Irmaos', :zip_code => '99.720-000', :state => state); c.save 
c = City.new(:name => 'Quevedos', :zip_code => '98.140-000', :state => state); c.save 
c = City.new(:name => 'Quilombo', :zip_code => '96.145-000', :state => state); c.save 
c = City.new(:name => 'Quinta', :zip_code => '96.222-000', :state => state); c.save 
c = City.new(:name => 'Quinze De Novembro', :zip_code => '98.230-000', :state => state); c.save 
c = City.new(:name => 'Quiteria', :zip_code => '96.730-000', :state => state); c.save 
c = City.new(:name => 'Nova Ramada', :zip_code => '98.758-000', :state => state); c.save 
c = City.new(:name => 'Redentora', :zip_code => '98.550-000', :state => state); c.save 
c = City.new(:name => 'Refugiado', :zip_code => '95.215-000', :state => state); c.save 
c = City.new(:name => 'Relvado', :zip_code => '95.965-000', :state => state); c.save 
c = City.new(:name => 'Restinga Seca', :zip_code => '97.200-000', :state => state); c.save 
c = City.new(:name => 'Restinga Seca', :zip_code => '98.829-000', :state => state); c.save 
c = City.new(:name => 'Doutor Ricardo', :zip_code => '95.967-000', :state => state); c.save 
c = City.new(:name => 'Rincao De Sao Pedro', :zip_code => '97.815-000', :state => state); c.save 
c = City.new(:name => 'Rincao Del Rei', :zip_code => '96.660-000', :state => state); c.save 
c = City.new(:name => 'Rincao Do Cristovao Pereira', :zip_code => '96.275-000', :state => state); c.save 
c = City.new(:name => 'Rincao Do Meio', :zip_code => '97.680-000', :state => state); c.save 
c = City.new(:name => 'Rincao Do Segredo', :zip_code => '99.510-000', :state => state); c.save 
c = City.new(:name => 'Rincao Doce', :zip_code => '99.475-000', :state => state); c.save 
c = City.new(:name => 'Rincao Dos Kroeff', :zip_code => '95.410-000', :state => state); c.save 
c = City.new(:name => 'Rincao Dos Mendes', :zip_code => '98.832-000', :state => state); c.save 
c = City.new(:name => 'Rincao Vermelho', :zip_code => '97.975-000', :state => state); c.save 
c = City.new(:name => 'Rio Azul', :zip_code => '99.773-000', :state => state); c.save 
c = City.new(:name => 'Rio Branco', :zip_code => '95.322-000', :state => state); c.save 
c = City.new(:name => 'Rio Dos Indios', :zip_code => '99.610-000', :state => state); c.save 
c = City.new(:name => 'Rio Grande', :zip_code => '96.200-000', :state => state); c.save 
c = City.new(:name => 'Rio Pardinho', :zip_code => '96.856-000', :state => state); c.save 
c = City.new(:name => 'Rio Pardo', :zip_code => '96.640-000', :state => state); c.save 
c = City.new(:name => 'Rio Tigre', :zip_code => '99.845-000', :state => state); c.save 
c = City.new(:name => 'Rio Toldo', :zip_code => '99.904-000', :state => state); c.save 
c = City.new(:name => 'Riozinho', :zip_code => '95.695-000', :state => state); c.save 
c = City.new(:name => 'Roca Sales', :zip_code => '95.735-000', :state => state); c.save 
c = City.new(:name => 'Rodeio Bonito', :zip_code => '98.360-000', :state => state); c.save 
c = City.new(:name => 'Rolador', :zip_code => '97.805-000', :state => state); c.save 
c = City.new(:name => 'Rolante', :zip_code => '95.690-000', :state => state); c.save 
c = City.new(:name => 'Rolantinho Da Figueira', :zip_code => '95.692-000', :state => state); c.save 
c = City.new(:name => 'Ronda Alta', :zip_code => '99.670-000', :state => state); c.save 
c = City.new(:name => 'Rondinha', :zip_code => '99.590-000', :state => state); c.save 
c = City.new(:name => 'Roque Gonzales', :zip_code => '97.970-000', :state => state); c.save 
c = City.new(:name => 'Rosario', :zip_code => '98.745-000', :state => state); c.save 
c = City.new(:name => 'Rosario Do Sul', :zip_code => '97.590-000', :state => state); c.save 
c = City.new(:name => 'Mampituba', :zip_code => '95.572-000', :state => state); c.save 
c = City.new(:name => 'Sagrada Familia', :zip_code => '98.330-000', :state => state); c.save 
c = City.new(:name => 'Saica', :zip_code => '97.455-000', :state => state); c.save 
c = City.new(:name => 'Saldanha Marinho', :zip_code => '98.250-000', :state => state); c.save 
c = City.new(:name => 'Senador Salgado Filho', :zip_code => '98.895-000', :state => state); c.save 
c = City.new(:name => 'Saltinho', :zip_code => '99.765-000', :state => state); c.save 
c = City.new(:name => 'Saltinho', :zip_code => '98.365-000', :state => state); c.save 
c = City.new(:name => 'Salto', :zip_code => '98.725-000', :state => state); c.save 
c = City.new(:name => 'Salto Do Jacui', :zip_code => '99.440-000', :state => state); c.save 
c = City.new(:name => 'Salvador Das Missoes', :zip_code => '97.940-000', :state => state); c.save 
c = City.new(:name => 'Salvador Do Sul', :zip_code => '95.750-000', :state => state); c.save 
c = City.new(:name => 'Sananduva', :zip_code => '99.840-000', :state => state); c.save 
c = City.new(:name => 'Sant Auta', :zip_code => '96.186-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara', :zip_code => '96.585-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara', :zip_code => '99.245-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara Do Sul', :zip_code => '98.240-000', :state => state); c.save 
c = City.new(:name => 'Santa Cecilia', :zip_code => '99.952-000', :state => state); c.save 
c = City.new(:name => 'Santa Clara Do Ingai', :zip_code => '98.234-000', :state => state); c.save 
c = City.new(:name => 'Santa Clara Do Sul', :zip_code => '95.915-000', :state => state); c.save 
c = City.new(:name => 'Santa Cristina', :zip_code => '95.640-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Da Concordia', :zip_code => '95.620-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Sul', :zip_code => '96.800-000', :state => state); c.save 
c = City.new(:name => 'Santa Flora', :zip_code => '97.160-000', :state => state); c.save 
c = City.new(:name => 'Santa Ines', :zip_code => '97.820-000', :state => state); c.save 
c = City.new(:name => 'Santa Izabel Do Sul', :zip_code => '96.350-000', :state => state); c.save 
c = City.new(:name => 'Santa Lucia Do Piai', :zip_code => '95.130-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia', :zip_code => '95.301-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '97.000-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Herval', :zip_code => '93.995-000', :state => state); c.save 
c = City.new(:name => 'Nova Santa Rita', :zip_code => '92.480-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Sul', :zip_code => '96.187-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa', :zip_code => '98.900-000', :state => state); c.save 
c = City.new(:name => 'Santa Silvana', :zip_code => '96.110-000', :state => state); c.save 
c = City.new(:name => 'Santa Tereza', :zip_code => '95.715-000', :state => state); c.save 
c = City.new(:name => 'Santa Teresinha', :zip_code => '98.319-000', :state => state); c.save 
c = City.new(:name => 'Santa Tereza', :zip_code => '98.778-000', :state => state); c.save 
c = City.new(:name => 'Santa Vitoria Do Palmar', :zip_code => '96.230-000', :state => state); c.save 
c = City.new(:name => 'Santana', :zip_code => '99.550-000', :state => state); c.save 
c = City.new(:name => 'Santana', :zip_code => '99.756-000', :state => state); c.save 
c = City.new(:name => 'Santana Da Boa Vista', :zip_code => '96.590-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Livramento', :zip_code => '97.570-000', :state => state); c.save 
c = City.new(:name => 'Santiago', :zip_code => '97.700-000', :state => state); c.save 
c = City.new(:name => 'Santo Amaro Do Sul', :zip_code => '95.823-000', :state => state); c.save 
c = City.new(:name => 'Santo Angelo', :zip_code => '98.800-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Planalto', :zip_code => '99.525-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Palma', :zip_code => '99.265-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '98.718-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Do Bugre', :zip_code => '98.320-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '98.594-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Patrulha', :zip_code => '95.500-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Das Missoes', :zip_code => '97.870-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Bom Retiro', :zip_code => '98.220-000', :state => state); c.save 
c = City.new(:name => 'Santo Augusto', :zip_code => '98.590-000', :state => state); c.save 
c = City.new(:name => 'Santo Cristo', :zip_code => '98.960-000', :state => state); c.save 
c = City.new(:name => 'Santo Expedito Do Sul', :zip_code => '99.895-000', :state => state); c.save 
c = City.new(:name => 'Santo Inacio', :zip_code => '95.298-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento', :zip_code => '99.518-000', :state => state); c.save 
c = City.new(:name => 'Sao Bom Jesus', :zip_code => '98.394-000', :state => state); c.save 
c = City.new(:name => 'Sao Borja', :zip_code => '97.670-000', :state => state); c.save 
c = City.new(:name => 'Chuvisca', :zip_code => '96.193-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos Do Sul', :zip_code => '99.270-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Assis', :zip_code => '97.610-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Paula', :zip_code => '95.400-000', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel', :zip_code => '97.300-000', :state => state); c.save 
c = City.new(:name => 'Ametista Do Sul', :zip_code => '98.465-000', :state => state); c.save 
c = City.new(:name => 'Sao Jeronimo', :zip_code => '96.700-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao', :zip_code => '98.555-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Batista', :zip_code => '98.853-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Bosco', :zip_code => '99.975-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Urtiga', :zip_code => '99.855-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Polesine', :zip_code => '97.230-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge', :zip_code => '95.365-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Das Missoes', :zip_code => '98.325-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '97.875-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Gloria', :zip_code => '99.355-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Centro', :zip_code => '99.480-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Herval', :zip_code => '99.380-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Hortencio', :zip_code => '95.755-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Inhacora', :zip_code => '98.958-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Norte', :zip_code => '96.225-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Ouro', :zip_code => '99.870-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Ausentes', :zip_code => '95.280-000', :state => state); c.save 
c = City.new(:name => 'Sao Leopoldo', :zip_code => '93.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco Das Missoes', :zip_code => '97.840-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco Do Sul', :zip_code => '96.170-000', :state => state); c.save 
c = City.new(:name => 'Sao Luis Rei', :zip_code => '99.865-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz Gonzaga', :zip_code => '97.800-000', :state => state); c.save 
c = City.new(:name => 'Sao Manuel', :zip_code => '95.220-000', :state => state); c.save 
c = City.new(:name => 'Sao Marcos', :zip_code => '95.190-000', :state => state); c.save 
c = City.new(:name => 'Sao Marcos', :zip_code => '97.535-000', :state => state); c.save 
c = City.new(:name => 'Sao Martinho', :zip_code => '98.690-000', :state => state); c.save 
c = City.new(:name => 'Sao Martinho Da Serra', :zip_code => '97.190-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel', :zip_code => '99.540-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Das Missoes', :zip_code => '98.865-000', :state => state); c.save 
c = City.new(:name => 'Sao Nicolau', :zip_code => '97.880-000', :state => state); c.save 
c = City.new(:name => 'Sao Paulo', :zip_code => '95.244-000', :state => state); c.save 
c = City.new(:name => 'Sao Paulo Das Missoes', :zip_code => '97.980-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '98.316-000', :state => state); c.save 
c = City.new(:name => 'Dom Pedro De Alcantara', :zip_code => '95.568-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Butia', :zip_code => '97.920-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Iraxim', :zip_code => '99.875-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Sul', :zip_code => '97.400-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque', :zip_code => '99.125-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '95.385-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Cai', :zip_code => '95.760-000', :state => state); c.save 
c = City.new(:name => 'Sao Sepe', :zip_code => '97.340-000', :state => state); c.save 
c = City.new(:name => 'Sao Simao', :zip_code => '96.285-000', :state => state); c.save 
c = City.new(:name => 'Sao Valentim', :zip_code => '99.640-000', :state => state); c.save 
c = City.new(:name => 'Sao Valentim Do Sul', :zip_code => '99.240-000', :state => state); c.save 
c = City.new(:name => 'Sao Valentim', :zip_code => '98.917-500', :state => state); c.save 
c = City.new(:name => 'Sao Valerio Do Sul', :zip_code => '98.595-000', :state => state); c.save 
c = City.new(:name => 'Sao Vendelino', :zip_code => '95.795-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente Do Sul', :zip_code => '97.420-000', :state => state); c.save 
c = City.new(:name => 'Sapiranga', :zip_code => '93.800-000', :state => state); c.save 
c = City.new(:name => 'Sapucaia Do Sul', :zip_code => '93.200-000', :state => state); c.save 
c = City.new(:name => 'Sarandi', :zip_code => '99.560-000', :state => state); c.save 
c = City.new(:name => 'Seberi', :zip_code => '98.380-000', :state => state); c.save 
c = City.new(:name => 'Seca', :zip_code => '95.140-000', :state => state); c.save 
c = City.new(:name => 'Sede Aurora', :zip_code => '98.232-000', :state => state); c.save 
c = City.new(:name => 'Sede Nova', :zip_code => '98.675-000', :state => state); c.save 
c = City.new(:name => 'Segredo', :zip_code => '96.910-000', :state => state); c.save 
c = City.new(:name => 'Segredo', :zip_code => '95.242-000', :state => state); c.save 
c = City.new(:name => 'Seival', :zip_code => '96.441-000', :state => state); c.save 
c = City.new(:name => 'Selbach', :zip_code => '99.450-000', :state => state); c.save 
c = City.new(:name => 'Serafim Schmidt', :zip_code => '96.894-000', :state => state); c.save 
c = City.new(:name => 'Serafina Correa', :zip_code => '99.250-000', :state => state); c.save 
c = City.new(:name => 'Serio', :zip_code => '95.918-000', :state => state); c.save 
c = City.new(:name => 'Serra Dos Gregorios', :zip_code => '95.395-000', :state => state); c.save 
c = City.new(:name => 'Serrinha', :zip_code => '97.810-000', :state => state); c.save 
c = City.new(:name => 'Sertao', :zip_code => '99.170-000', :state => state); c.save 
c = City.new(:name => 'Sertao Santana', :zip_code => '92.850-000', :state => state); c.save 
c = City.new(:name => 'Sertaozinho', :zip_code => '98.485-000', :state => state); c.save 
c = City.new(:name => 'Sete De Setembro', :zip_code => '99.758-000', :state => state); c.save 
c = City.new(:name => 'Sete De Setembro', :zip_code => '97.960-000', :state => state); c.save 
c = City.new(:name => 'Sete De Setembro', :zip_code => '98.903-000', :state => state); c.save 
c = City.new(:name => 'Sete Lagoas', :zip_code => '99.768-000', :state => state); c.save 
c = City.new(:name => 'Severiano De Almeida', :zip_code => '99.810-000', :state => state); c.save 
c = City.new(:name => 'Silveira', :zip_code => '95.285-000', :state => state); c.save 
c = City.new(:name => 'Silveira Martins', :zip_code => '97.195-000', :state => state); c.save 
c = City.new(:name => 'Sinimbu', :zip_code => '96.890-000', :state => state); c.save 
c = City.new(:name => 'Sirio', :zip_code => '98.962-000', :state => state); c.save 
c = City.new(:name => 'Sitio Gabriel', :zip_code => '98.543-000', :state => state); c.save 
c = City.new(:name => 'Sobradinho', :zip_code => '96.900-000', :state => state); c.save 
c = City.new(:name => 'Soledade', :zip_code => '99.300-000', :state => state); c.save 
c = City.new(:name => 'Souza Ramos', :zip_code => '99.908-000', :state => state); c.save 
c = City.new(:name => 'Suspiro', :zip_code => '97.320-000', :state => state); c.save 
c = City.new(:name => 'Tabai', :zip_code => '95.863-000', :state => state); c.save 
c = City.new(:name => 'Tabajara', :zip_code => '99.445-000', :state => state); c.save 
c = City.new(:name => 'Taim', :zip_code => '96.221-000', :state => state); c.save 
c = City.new(:name => 'Tainhas', :zip_code => '95.405-000', :state => state); c.save 
c = City.new(:name => 'Tamandua', :zip_code => '96.915-000', :state => state); c.save 
c = City.new(:name => 'Tanque', :zip_code => '99.876-000', :state => state); c.save 
c = City.new(:name => 'Tapejara', :zip_code => '99.950-000', :state => state); c.save 
c = City.new(:name => 'Tapera', :zip_code => '99.490-000', :state => state); c.save 
c = City.new(:name => 'Tapera', :zip_code => '96.297-000', :state => state); c.save 
c = City.new(:name => 'Tapes', :zip_code => '96.760-000', :state => state); c.save 
c = City.new(:name => 'Taquara', :zip_code => '95.600-000', :state => state); c.save 
c = City.new(:name => 'Taquarucu Do Sul', :zip_code => '98.410-000', :state => state); c.save 
c = City.new(:name => 'Taquari', :zip_code => '95.860-000', :state => state); c.save 
c = City.new(:name => 'Taquarichim', :zip_code => '97.765-000', :state => state); c.save 
c = City.new(:name => 'Tavares', :zip_code => '96.290-000', :state => state); c.save 
c = City.new(:name => 'Tenente Portela', :zip_code => '98.500-000', :state => state); c.save 
c = City.new(:name => 'Terra De Areia', :zip_code => '95.535-000', :state => state); c.save 
c = City.new(:name => 'Tesouras', :zip_code => '99.535-000', :state => state); c.save 
c = City.new(:name => 'Teutonia', :zip_code => '95.890-000', :state => state); c.save 
c = City.new(:name => 'Tiaraju', :zip_code => '97.310-000', :state => state); c.save 
c = City.new(:name => 'Timbauva', :zip_code => '97.860-000', :state => state); c.save 
c = City.new(:name => 'Novo Tiradentes', :zip_code => '98.370-000', :state => state); c.save 
c = City.new(:name => 'Tiradentes Do Sul', :zip_code => '98.680-000', :state => state); c.save 
c = City.new(:name => 'Toropi', :zip_code => '97.418-000', :state => state); c.save 
c = City.new(:name => 'Toroqua', :zip_code => '97.630-000', :state => state); c.save 
c = City.new(:name => 'Torquato Severo', :zip_code => '96.455-000', :state => state); c.save 
c = City.new(:name => 'Torres', :zip_code => '95.560-000', :state => state); c.save 
c = City.new(:name => 'Torrinhas', :zip_code => '96.485-000', :state => state); c.save 
c = City.new(:name => 'Touro Passo', :zip_code => '97.595-000', :state => state); c.save 
c = City.new(:name => 'Tramandai', :zip_code => '95.590-000', :state => state); c.save 
c = City.new(:name => 'Travesseiro', :zip_code => '95.948-000', :state => state); c.save 
c = City.new(:name => 'Trentin', :zip_code => '98.355-000', :state => state); c.save 
c = City.new(:name => 'Tres Arroios', :zip_code => '99.725-000', :state => state); c.save 
c = City.new(:name => 'Tres Barras', :zip_code => '99.778-000', :state => state); c.save 
c = City.new(:name => 'Tres Cachoeiras', :zip_code => '95.580-000', :state => state); c.save 
c = City.new(:name => 'Tres Coroas', :zip_code => '95.660-000', :state => state); c.save 
c = City.new(:name => 'Tres De Maio', :zip_code => '98.910-000', :state => state); c.save 
c = City.new(:name => 'Tres Forquilhas', :zip_code => '95.575-000', :state => state); c.save 
c = City.new(:name => 'Tres Palmeiras', :zip_code => '99.675-000', :state => state); c.save 
c = City.new(:name => 'Tres Passos', :zip_code => '98.600-000', :state => state); c.save 
c = City.new(:name => 'Tres Vendas', :zip_code => '96.511-000', :state => state); c.save 
c = City.new(:name => 'Trindade Do Sul', :zip_code => '99.615-000', :state => state); c.save 
c = City.new(:name => 'Triunfo', :zip_code => '95.840-000', :state => state); c.save 
c = City.new(:name => 'Vale Do Sol', :zip_code => '96.878-000', :state => state); c.save 
c = City.new(:name => 'Tronqueiras', :zip_code => '98.545-000', :state => state); c.save 
c = City.new(:name => 'Tucunduva', :zip_code => '98.930-000', :state => state); c.save 
c = City.new(:name => 'Tuiuti', :zip_code => '95.710-000', :state => state); c.save 
c = City.new(:name => 'Tunas', :zip_code => '99.330-000', :state => state); c.save 
c = City.new(:name => 'Tupanci Do Sul', :zip_code => '99.878-000', :state => state); c.save 
c = City.new(:name => 'Tupancireta', :zip_code => '98.170-000', :state => state); c.save 
c = City.new(:name => 'Tupandi', :zip_code => '95.775-000', :state => state); c.save 
c = City.new(:name => 'Tupantuba', :zip_code => '97.743-000', :state => state); c.save 
c = City.new(:name => 'Tuparendi', :zip_code => '98.940-000', :state => state); c.save 
c = City.new(:name => 'Tupi Silveira', :zip_code => '96.465-000', :state => state); c.save 
c = City.new(:name => 'Tupinamba', :zip_code => '95.304-000', :state => state); c.save 
c = City.new(:name => 'Turvinho', :zip_code => '98.588-000', :state => state); c.save 
c = City.new(:name => 'Ubiretama', :zip_code => '98.898-000', :state => state); c.save 
c = City.new(:name => 'Umbu', :zip_code => '97.460-000', :state => state); c.save 
c = City.new(:name => 'Unistalda', :zip_code => '97.755-000', :state => state); c.save 
c = City.new(:name => 'Uruguaiana', :zip_code => '97.500-000', :state => state); c.save 
c = City.new(:name => 'Vacacai', :zip_code => '97.305-000', :state => state); c.save 
c = City.new(:name => 'Vacaria', :zip_code => '95.200-000', :state => state); c.save 
c = City.new(:name => 'Vale Do Rio Cai', :zip_code => '95.170-000', :state => state); c.save 
c = City.new(:name => 'Vale Veneto', :zip_code => '97.235-000', :state => state); c.save 
c = City.new(:name => 'Vanini', :zip_code => '99.290-000', :state => state); c.save 
c = City.new(:name => 'Sentinela Do Sul', :zip_code => '96.765-000', :state => state); c.save 
c = City.new(:name => 'Venancio Aires', :zip_code => '95.800-000', :state => state); c.save 
c = City.new(:name => 'Vera Cruz', :zip_code => '96.880-000', :state => state); c.save 
c = City.new(:name => 'Porto Vera Cruz', :zip_code => '98.985-000', :state => state); c.save 
c = City.new(:name => 'Veranopolis', :zip_code => '95.330-000', :state => state); c.save 
c = City.new(:name => 'Vespasiano Correa', :zip_code => '95.972-000', :state => state); c.save 
c = City.new(:name => 'Viadutos', :zip_code => '99.820-000', :state => state); c.save 
c = City.new(:name => 'Viamao', :zip_code => '94.400-000', :state => state); c.save 
c = City.new(:name => 'Vicente Dutra', :zip_code => '98.450-000', :state => state); c.save 
c = City.new(:name => 'Victor Graeff', :zip_code => '99.350-000', :state => state); c.save 
c = City.new(:name => 'Entre Rios Do Sul', :zip_code => '99.645-000', :state => state); c.save 
c = City.new(:name => 'Cristal Do Sul', :zip_code => '98.368-000', :state => state); c.save 
c = City.new(:name => 'Vila Cruz', :zip_code => '97.260-000', :state => state); c.save 
c = City.new(:name => 'Vila Flores', :zip_code => '95.334-000', :state => state); c.save 
c = City.new(:name => 'Vila Laranjeira', :zip_code => '98.968-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova Do Sul', :zip_code => '97.385-000', :state => state); c.save 
c = City.new(:name => 'Vila Rica', :zip_code => '99.545-000', :state => state); c.save 
c = City.new(:name => 'Vila Turvo', :zip_code => '98.573-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '99.465-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '98.415-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre Do Prata', :zip_code => '95.325-000', :state => state); c.save 
c = City.new(:name => 'Vista Gaucha', :zip_code => '98.535-000', :state => state); c.save 
c = City.new(:name => 'Vitoria', :zip_code => '99.945-000', :state => state); c.save 
c = City.new(:name => 'Vitoria Das Missoes', :zip_code => '98.850-000', :state => state); c.save 
c = City.new(:name => 'Volta Alegre', :zip_code => '99.410-000', :state => state); c.save 
c = City.new(:name => 'Volta Fechada', :zip_code => '99.785-000', :state => state); c.save 
c = City.new(:name => 'Volta Grande', :zip_code => '98.495-000', :state => state); c.save 
c = City.new(:name => 'Xadrez', :zip_code => '99.522-000', :state => state); c.save 
c = City.new(:name => 'Xingu', :zip_code => '99.685-000', :state => state); c.save 
c = City.new(:name => 'Capao Comprido', :zip_code => '96.295-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Sul', :zip_code => '95.727-000', :state => state); c.save 
c = City.new(:name => 'Scharlau', :zip_code => '93.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '95.714-000', :state => state); c.save 
c = City.new(:name => 'Rio Telha', :zip_code => '99.943-000', :state => state); c.save 
c = City.new(:name => 'Cavera', :zip_code => '97.594-000', :state => state); c.save 
c = City.new(:name => 'Esquina Piratini', :zip_code => '97.865-000', :state => state); c.save 
c = City.new(:name => 'Sao Carlos', :zip_code => '97.598-000', :state => state); c.save 
c = City.new(:name => 'Tupancy Ou Vila Block', :zip_code => '97.350-000', :state => state); c.save 
c = City.new(:name => 'Colonia Sao Joao', :zip_code => '98.122-000', :state => state); c.save 
c = City.new(:name => 'Magisterio', :zip_code => '95.597-000', :state => state); c.save 
c = City.new(:name => 'Daltro Filho', :zip_code => '95.888-000', :state => state); c.save 
c = City.new(:name => 'Arroio Canoas', :zip_code => '95.733-000', :state => state); c.save 
c = City.new(:name => 'Imbe', :zip_code => '95.625-000', :state => state); c.save 
c = City.new(:name => 'Estacao', :zip_code => '99.930-000', :state => state); c.save 
c = City.new(:name => 'Curumim', :zip_code => '95.558-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Fialho', :zip_code => '95.608-000', :state => state); c.save 
c = City.new(:name => 'Quintao', :zip_code => '95.548-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa', :zip_code => '95.544-000', :state => state); c.save 
c = City.new(:name => 'Cr-1', :zip_code => '95.547-000', :state => state); c.save 
c = City.new(:name => 'Bacupari', :zip_code => '95.549-000', :state => state); c.save 
c = City.new(:name => 'Frei Sebastiao', :zip_code => '95.551-000', :state => state); c.save 
c = City.new(:name => 'Capao Do Cedro', :zip_code => '95.304-500', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '95.307-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio De Castro', :zip_code => '95.188-000', :state => state); c.save 
c = City.new(:name => 'Santa Luiza', :zip_code => '95.187-000', :state => state); c.save 
c = City.new(:name => 'Chicoloma', :zip_code => '95.508-000', :state => state); c.save 
c = City.new(:name => 'Morro Alto', :zip_code => '95.534-000', :state => state); c.save 
c = City.new(:name => 'Turucu', :zip_code => '96.148-000', :state => state); c.save 
c = City.new(:name => 'Colonia Z-3', :zip_code => '96.130-000', :state => state); c.save 
c = City.new(:name => 'Linha Comprida', :zip_code => '95.754-000', :state => state); c.save 
c = City.new(:name => 'Dom Diogo', :zip_code => '95.753-000', :state => state); c.save 
c = City.new(:name => 'Campestre Baixo', :zip_code => '95.752-000', :state => state); c.save 
c = City.new(:name => 'Delfina', :zip_code => '95.884-000', :state => state); c.save 
c = City.new(:name => 'Pinhal', :zip_code => '95.873-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Conceicao', :zip_code => '95.763-000', :state => state); c.save 
c = City.new(:name => 'Rio Da Ilha', :zip_code => '95.614-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '95.751-000', :state => state); c.save 
c = City.new(:name => 'Silva Jardim', :zip_code => '99.253-000', :state => state); c.save 
c = City.new(:name => 'Mato Castelhano', :zip_code => '99.180-000', :state => state); c.save 
c = City.new(:name => 'Pinhal', :zip_code => '96.898-000', :state => state); c.save 
c = City.new(:name => 'Alto Paredao', :zip_code => '96.853-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '97.913-000', :state => state); c.save 
c = City.new(:name => 'Floresta', :zip_code => '98.613-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '97.915-000', :state => state); c.save 
c = City.new(:name => 'Santa Catarina', :zip_code => '97.945-000', :state => state); c.save 
c = City.new(:name => 'Itai', :zip_code => '98.717-000', :state => state); c.save 
c = City.new(:name => 'Barreiro', :zip_code => '98.712-000', :state => state); c.save 
c = City.new(:name => 'Novo Planalto', :zip_code => '98.688-000', :state => state); c.save 
c = City.new(:name => 'Vila Seca', :zip_code => '98.847-000', :state => state); c.save 
c = City.new(:name => 'Santana', :zip_code => '98.728-000', :state => state); c.save 
c = City.new(:name => 'Santa Lucia', :zip_code => '98.722-000', :state => state); c.save 
c = City.new(:name => 'Rancho Velho', :zip_code => '95.543-000', :state => state); c.save 
c = City.new(:name => 'Cortado', :zip_code => '96.533-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '98.472-000', :state => state); c.save 
c = City.new(:name => 'Vila Bender', :zip_code => '98.660-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Castro', :zip_code => '95.722-000', :state => state); c.save 
c = City.new(:name => 'Nazare', :zip_code => '97.745-000', :state => state); c.save 
c = City.new(:name => 'Capao Do Cipo', :zip_code => '97.740-000', :state => state); c.save 
c = City.new(:name => 'Lava-pes', :zip_code => '97.735-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre', :zip_code => '97.730-000', :state => state); c.save 
c = City.new(:name => 'Esquina Bom Sucesso', :zip_code => '98.777-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '98.477-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro', :zip_code => '98.478-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz', :zip_code => '98.476-000', :state => state); c.save 
c = City.new(:name => 'Divino', :zip_code => '98.474-000', :state => state); c.save 
c = City.new(:name => 'Atafona', :zip_code => '98.830-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '96.177-000', :state => state); c.save 
c = City.new(:name => 'Dario Lassance', :zip_code => '96.444-000', :state => state); c.save 
c = City.new(:name => 'Guajuviras', :zip_code => '92.455-000', :state => state); c.save 
c = City.new(:name => 'Passo Da Caveira', :zip_code => '94.335-000', :state => state); c.save 
c = City.new(:name => 'Arroio Grande', :zip_code => '97.120-000', :state => state); c.save 
c = City.new(:name => 'Lindolfo Collor', :zip_code => '93.940-000', :state => state); c.save 
c = City.new(:name => 'Presidente Lucena', :zip_code => '93.945-000', :state => state); c.save 
c = City.new(:name => 'Morrinhos Do Sul', :zip_code => '95.577-000', :state => state); c.save 
c = City.new(:name => 'Xangri-la', :zip_code => '95.588-000', :state => state); c.save 
c = City.new(:name => 'Vale Real', :zip_code => '95.778-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Da Serra', :zip_code => '95.758-000', :state => state); c.save 
c = City.new(:name => 'Alto Feliz', :zip_code => '95.773-000', :state => state); c.save 
c = City.new(:name => 'Linha Nova', :zip_code => '95.768-000', :state => state); c.save 
c = City.new(:name => 'Marata', :zip_code => '95.793-000', :state => state); c.save 
c = City.new(:name => 'Valdastico', :zip_code => '95.964-000', :state => state); c.save 
c = City.new(:name => 'Balneario Pinhal', :zip_code => '95.599-000', :state => state); c.save 
c = City.new(:name => 'Tunel Verde', :zip_code => '95.598-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre Dos Campos', :zip_code => '95.236-000', :state => state); c.save 
c = City.new(:name => 'Cerrito', :zip_code => '96.395-000', :state => state); c.save 
c = City.new(:name => 'Novo Cabrais', :zip_code => '96.545-000', :state => state); c.save 
c = City.new(:name => 'Herveiras', :zip_code => '96.888-000', :state => state); c.save 

