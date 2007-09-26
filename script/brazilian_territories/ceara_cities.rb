#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Ceará')
state ||= State.create!( :name => 'Ceará', :code => 'CE', :country => country);

c = City.new(:name => 'Abaiara', :zip_code => '63.240-000', :state => state); c.save 
c = City.new(:name => 'Abilio Martins', :zip_code => '62.252-000', :state => state); c.save 
c = City.new(:name => 'Acarape', :zip_code => '62.785-000', :state => state); c.save 
c = City.new(:name => 'Acarau', :zip_code => '62.580-000', :state => state); c.save 
c = City.new(:name => 'Acopiara', :zip_code => '63.560-000', :state => state); c.save 
c = City.new(:name => 'Adrianopolis', :zip_code => '62.435-000', :state => state); c.save 
c = City.new(:name => 'Aiua', :zip_code => '62.143-000', :state => state); c.save 
c = City.new(:name => 'Aiuaba', :zip_code => '63.575-000', :state => state); c.save 
c = City.new(:name => 'Alagoinha', :zip_code => '63.174-000', :state => state); c.save 
c = City.new(:name => 'Alcantaras', :zip_code => '62.120-000', :state => state); c.save 
c = City.new(:name => 'Algodoes', :zip_code => '63.655-000', :state => state); c.save 
c = City.new(:name => 'Altaneira', :zip_code => '63.195-000', :state => state); c.save 
c = City.new(:name => 'Alto Santo', :zip_code => '62.970-000', :state => state); c.save 
c = City.new(:name => 'Amanaiara', :zip_code => '62.263-000', :state => state); c.save 
c = City.new(:name => 'Amanari', :zip_code => '61.965-000', :state => state); c.save 
c = City.new(:name => 'Amaniutuba', :zip_code => '63.306-000', :state => state); c.save 
c = City.new(:name => 'Amarelas', :zip_code => '62.405-000', :state => state); c.save 
c = City.new(:name => 'Amaro', :zip_code => '63.144-000', :state => state); c.save 
c = City.new(:name => 'America', :zip_code => '62.240-000', :state => state); c.save 
c = City.new(:name => 'Amontada', :zip_code => '62.540-000', :state => state); c.save 
c = City.new(:name => 'Anaua', :zip_code => '63.217-000', :state => state); c.save 
c = City.new(:name => 'Anjinhos', :zip_code => '63.193-000', :state => state); c.save 
c = City.new(:name => 'Antonina Do Norte', :zip_code => '63.570-000', :state => state); c.save 
c = City.new(:name => 'Antonio Bezerra', :zip_code => '60.000-000', :state => state); c.save 
c = City.new(:name => 'Antonio Diogo', :zip_code => '62.791-000', :state => state); c.save 
c = City.new(:name => 'Antonio Marques', :zip_code => '61.990-000', :state => state); c.save 
c = City.new(:name => 'Apuiares', :zip_code => '62.630-000', :state => state); c.save 
c = City.new(:name => 'Aquinopolis', :zip_code => '63.479-000', :state => state); c.save 
c = City.new(:name => 'Aquiraz', :zip_code => '61.700-000', :state => state); c.save 
c = City.new(:name => 'Aracati', :zip_code => '62.800-000', :state => state); c.save 
c = City.new(:name => 'Aracatiacu', :zip_code => '62.111-000', :state => state); c.save 
c = City.new(:name => 'Aracatiara', :zip_code => '62.548-000', :state => state); c.save 
c = City.new(:name => 'Aracoiaba', :zip_code => '62.750-000', :state => state); c.save 
c = City.new(:name => 'Arajara', :zip_code => '63.183-000', :state => state); c.save 
c = City.new(:name => 'Aranau', :zip_code => '62.585-000', :state => state); c.save 
c = City.new(:name => 'Arapa', :zip_code => '62.328-000', :state => state); c.save 
c = City.new(:name => 'Arapari', :zip_code => '62.508-000', :state => state); c.save 
c = City.new(:name => 'Araporanga', :zip_code => '63.194-000', :state => state); c.save 
c = City.new(:name => 'Araquem', :zip_code => '62.165-000', :state => state); c.save 
c = City.new(:name => 'Ararenda', :zip_code => '62.210-000', :state => state); c.save 
c = City.new(:name => 'Araripe', :zip_code => '63.170-000', :state => state); c.save 
c = City.new(:name => 'Ararius', :zip_code => '62.186-000', :state => state); c.save 
c = City.new(:name => 'Aratama', :zip_code => '63.143-000', :state => state); c.save 
c = City.new(:name => 'Araticum', :zip_code => '62.352-000', :state => state); c.save 
c = City.new(:name => 'Aratuba', :zip_code => '62.762-000', :state => state); c.save 
c = City.new(:name => 'Areial', :zip_code => '62.290-000', :state => state); c.save 
c = City.new(:name => 'Arneiroz', :zip_code => '63.670-000', :state => state); c.save 
c = City.new(:name => 'Aroeiras', :zip_code => '62.163-000', :state => state); c.save 
c = City.new(:name => 'Arrojado', :zip_code => '63.305-000', :state => state); c.save 
c = City.new(:name => 'Aruaru', :zip_code => '62.951-000', :state => state); c.save 
c = City.new(:name => 'Assare', :zip_code => '63.140-000', :state => state); c.save 
c = City.new(:name => 'Assuncao', :zip_code => '62.505-000', :state => state); c.save 
c = City.new(:name => 'Assuncao', :zip_code => '63.625-000', :state => state); c.save 
c = City.new(:name => 'Aurora', :zip_code => '63.360-000', :state => state); c.save 
c = City.new(:name => 'Baixa Grande', :zip_code => '62.605-000', :state => state); c.save 
c = City.new(:name => 'Baixio', :zip_code => '63.320-000', :state => state); c.save 
c = City.new(:name => 'Baixio Da Donana', :zip_code => '63.582-000', :state => state); c.save 
c = City.new(:name => 'Banabuiu', :zip_code => '63.960-000', :state => state); c.save 
c = City.new(:name => 'Bandeira', :zip_code => '62.723-000', :state => state); c.save 
c = City.new(:name => 'Barao De Aquiraz', :zip_code => '63.153-000', :state => state); c.save 
c = City.new(:name => 'Barbalha', :zip_code => '63.180-000', :state => state); c.save 
c = City.new(:name => 'Barra', :zip_code => '63.578-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Sotero', :zip_code => '62.393-000', :state => state); c.save 
c = City.new(:name => 'Barra Nova', :zip_code => '63.667-000', :state => state); c.save 
c = City.new(:name => 'Barreira', :zip_code => '62.795-000', :state => state); c.save 
c = City.new(:name => 'Barreiras', :zip_code => '63.508-000', :state => state); c.save 
c = City.new(:name => 'Barreiros', :zip_code => '63.785-000', :state => state); c.save 
c = City.new(:name => 'Barreiros', :zip_code => '63.163-000', :state => state); c.save 
c = City.new(:name => 'Barrento', :zip_code => '62.515-000', :state => state); c.save 
c = City.new(:name => 'Barro', :zip_code => '63.380-000', :state => state); c.save 
c = City.new(:name => 'Barroquinha', :zip_code => '62.410-000', :state => state); c.save 
c = City.new(:name => 'Baturite', :zip_code => '62.760-000', :state => state); c.save 
c = City.new(:name => 'Bau', :zip_code => '63.512-000', :state => state); c.save 
c = City.new(:name => 'Beberibe', :zip_code => '62.840-000', :state => state); c.save 
c = City.new(:name => 'Bela Cruz', :zip_code => '62.570-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '62.510-000', :state => state); c.save 
c = City.new(:name => 'Betania', :zip_code => '62.273-000', :state => state); c.save 
c = City.new(:name => 'Bitupita', :zip_code => '62.414-000', :state => state); c.save 
c = City.new(:name => 'Bixopa', :zip_code => '62.935-000', :state => state); c.save 
c = City.new(:name => 'Boa Agua', :zip_code => '62.953-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '63.770-000', :state => state); c.save 
c = City.new(:name => 'Boa Viagem', :zip_code => '63.870-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '63.615-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Do Caxitore', :zip_code => '62.623-000', :state => state); c.save 
c = City.new(:name => 'Bonfim', :zip_code => '62.102-000', :state => state); c.save 
c = City.new(:name => 'Bonhu', :zip_code => '62.905-000', :state => state); c.save 
c = City.new(:name => 'Bonito', :zip_code => '62.705-000', :state => state); c.save 
c = City.new(:name => 'Borges', :zip_code => '62.835-000', :state => state); c.save 
c = City.new(:name => 'Brejinho', :zip_code => '63.176-000', :state => state); c.save 
c = City.new(:name => 'Brejo Grande', :zip_code => '63.192-000', :state => state); c.save 
c = City.new(:name => 'Brejo Santo', :zip_code => '63.260-000', :state => state); c.save 
c = City.new(:name => 'Cabreiro', :zip_code => '62.806-000', :state => state); c.save 
c = City.new(:name => 'Caicarinha', :zip_code => '63.957-000', :state => state); c.save 
c = City.new(:name => 'Caio Prado', :zip_code => '62.742-000', :state => state); c.save 
c = City.new(:name => 'Caioca', :zip_code => '62.109-000', :state => state); c.save 
c = City.new(:name => 'Caipu', :zip_code => '63.538-000', :state => state); c.save 
c = City.new(:name => 'Calabaca', :zip_code => '63.545-000', :state => state); c.save 
c = City.new(:name => 'Camilos', :zip_code => '62.132-000', :state => state); c.save 
c = City.new(:name => 'Camocim', :zip_code => '62.400-000', :state => state); c.save 
c = City.new(:name => 'Campanario', :zip_code => '62.468-000', :state => state); c.save 
c = City.new(:name => 'Campos Sales', :zip_code => '63.150-000', :state => state); c.save 
c = City.new(:name => 'Canafistula', :zip_code => '62.638-000', :state => state); c.save 
c = City.new(:name => 'Canafistula', :zip_code => '63.583-000', :state => state); c.save 
c = City.new(:name => 'Cangati', :zip_code => '63.612-000', :state => state); c.save 
c = City.new(:name => 'Cangati', :zip_code => '63.624-000', :state => state); c.save 
c = City.new(:name => 'Caninde', :zip_code => '62.700-000', :state => state); c.save 
c = City.new(:name => 'Canindezinho', :zip_code => '62.995-000', :state => state); c.save 
c = City.new(:name => 'Canindezinho', :zip_code => '62.203-000', :state => state); c.save 
c = City.new(:name => 'Canindezinho', :zip_code => '63.555-000', :state => state); c.save 
c = City.new(:name => 'Capistrano', :zip_code => '62.748-000', :state => state); c.save 
c = City.new(:name => 'Caponga', :zip_code => '62.852-000', :state => state); c.save 
c = City.new(:name => 'Caracara', :zip_code => '62.112-000', :state => state); c.save 
c = City.new(:name => 'Caridade', :zip_code => '62.730-000', :state => state); c.save 
c = City.new(:name => 'Carire', :zip_code => '62.184-000', :state => state); c.save 
c = City.new(:name => 'Caririacu', :zip_code => '63.220-000', :state => state); c.save 
c = City.new(:name => 'Carius', :zip_code => '63.530-000', :state => state); c.save 
c = City.new(:name => 'Cariutaba', :zip_code => '63.189-000', :state => state); c.save 
c = City.new(:name => 'Carmelopolis', :zip_code => '63.151-000', :state => state); c.save 
c = City.new(:name => 'Carnaubal', :zip_code => '62.375-000', :state => state); c.save 
c = City.new(:name => 'Carnaubas', :zip_code => '63.616-000', :state => state); c.save 
c = City.new(:name => 'Carnaubinha', :zip_code => '63.637-000', :state => state); c.save 
c = City.new(:name => 'Carquejo', :zip_code => '62.175-000', :state => state); c.save 
c = City.new(:name => 'Carrapateiras', :zip_code => '63.662-000', :state => state); c.save 
c = City.new(:name => 'Caruatai', :zip_code => '62.325-000', :state => state); c.save 
c = City.new(:name => 'Carvalho', :zip_code => '63.768-000', :state => state); c.save 
c = City.new(:name => 'Cascavel', :zip_code => '62.850-000', :state => state); c.save 
c = City.new(:name => 'Castanhao', :zip_code => '62.975-000', :state => state); c.save 
c = City.new(:name => 'Catarina', :zip_code => '63.595-000', :state => state); c.save 
c = City.new(:name => 'Catole', :zip_code => '63.613-000', :state => state); c.save 
c = City.new(:name => 'Catuana', :zip_code => '61.680-000', :state => state); c.save 
c = City.new(:name => 'Catunda', :zip_code => '62.297-000', :state => state); c.save 
c = City.new(:name => 'Caucaia', :zip_code => '61.600-000', :state => state); c.save 
c = City.new(:name => 'Caxitore', :zip_code => '62.614-000', :state => state); c.save 
c = City.new(:name => 'Cedro', :zip_code => '63.400-000', :state => state); c.save 
c = City.new(:name => 'Cemoaba', :zip_code => '62.657-000', :state => state); c.save 
c = City.new(:name => 'Chaval', :zip_code => '62.420-000', :state => state); c.save 
c = City.new(:name => 'Choro', :zip_code => '63.950-000', :state => state); c.save 
c = City.new(:name => 'Chorozinho', :zip_code => '62.875-000', :state => state); c.save 
c = City.new(:name => 'Cipo Dos Anjos', :zip_code => '63.925-000', :state => state); c.save 
c = City.new(:name => 'Cococi', :zip_code => '63.685-000', :state => state); c.save 
c = City.new(:name => 'Coite', :zip_code => '63.212-000', :state => state); c.save 
c = City.new(:name => 'Colina', :zip_code => '62.774-000', :state => state); c.save 
c = City.new(:name => 'Conceicao', :zip_code => '62.275-000', :state => state); c.save 
c = City.new(:name => 'Coreau', :zip_code => '62.160-000', :state => state); c.save 
c = City.new(:name => 'Quiterianopolis', :zip_code => '63.650-000', :state => state); c.save 
c = City.new(:name => 'Crateus', :zip_code => '63.700-000', :state => state); c.save 
c = City.new(:name => 'Crato', :zip_code => '63.100-000', :state => state); c.save 
c = City.new(:name => 'Crioulos', :zip_code => '63.465-000', :state => state); c.save 
c = City.new(:name => 'Croata', :zip_code => '62.390-000', :state => state); c.save 
c = City.new(:name => 'Croata', :zip_code => '62.676-000', :state => state); c.save 
c = City.new(:name => 'Cruxati', :zip_code => '62.525-000', :state => state); c.save 
c = City.new(:name => 'Cruz', :zip_code => '62.595-000', :state => state); c.save 
c = City.new(:name => 'Cruz', :zip_code => '62.603-000', :state => state); c.save 
c = City.new(:name => 'Cruz De Pedra', :zip_code => '63.513-000', :state => state); c.save 
c = City.new(:name => 'Cruzeirinho', :zip_code => '63.440-000', :state => state); c.save 
c = City.new(:name => 'Cuncas', :zip_code => '63.395-000', :state => state); c.save 
c = City.new(:name => 'Curatis', :zip_code => '63.755-000', :state => state); c.save 
c = City.new(:name => 'Curupira', :zip_code => '62.758-000', :state => state); c.save 
c = City.new(:name => 'Custodio', :zip_code => '63.915-000', :state => state); c.save 
c = City.new(:name => 'Daniel De Queiros', :zip_code => '63.930-000', :state => state); c.save 
c = City.new(:name => 'Delmiro Gouveia', :zip_code => '62.258-000', :state => state); c.save 
c = City.new(:name => 'Dom Mauricio', :zip_code => '63.945-000', :state => state); c.save 
c = City.new(:name => 'Dom Quintino', :zip_code => '63.137-000', :state => state); c.save 
c = City.new(:name => 'Domingos Da Costa', :zip_code => '63.880-000', :state => state); c.save 
c = City.new(:name => 'Ebron', :zip_code => '63.567-000', :state => state); c.save 
c = City.new(:name => 'Ema', :zip_code => '62.988-000', :state => state); c.save 
c = City.new(:name => 'Ematuba', :zip_code => '63.641-000', :state => state); c.save 
c = City.new(:name => 'Encantado', :zip_code => '63.810-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Joao Tome', :zip_code => '62.233-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Jose Lopes', :zip_code => '63.602-000', :state => state); c.save 
c = City.new(:name => 'Erere', :zip_code => '63.470-000', :state => state); c.save 
c = City.new(:name => 'Esperanca', :zip_code => '62.708-000', :state => state); c.save 
c = City.new(:name => 'Espinho', :zip_code => '62.388-000', :state => state); c.save 
c = City.new(:name => 'Eusebio', :zip_code => '61.760-000', :state => state); c.save 
c = City.new(:name => 'Farias Brito', :zip_code => '63.185-000', :state => state); c.save 
c = City.new(:name => 'Fatima', :zip_code => '62.772-000', :state => state); c.save 
c = City.new(:name => 'Feiticeiro', :zip_code => '63.477-000', :state => state); c.save 
c = City.new(:name => 'Feitosa', :zip_code => '63.225-000', :state => state); c.save 
c = City.new(:name => 'Felizardo', :zip_code => '63.345-000', :state => state); c.save 
c = City.new(:name => 'Flamengo', :zip_code => '63.592-000', :state => state); c.save 
c = City.new(:name => 'Flores', :zip_code => '62.253-000', :state => state); c.save 
c = City.new(:name => 'Flores', :zip_code => '62.903-000', :state => state); c.save 
c = City.new(:name => 'Forquilha', :zip_code => '62.115-000', :state => state); c.save 
c = City.new(:name => 'Fortaleza', :zip_code => '60.000-000', :state => state); c.save 
c = City.new(:name => 'Fortim', :zip_code => '62.815-000', :state => state); c.save 
c = City.new(:name => 'Frecheirinha', :zip_code => '62.340-000', :state => state); c.save 
c = City.new(:name => 'Gado', :zip_code => '62.782-000', :state => state); c.save 
c = City.new(:name => 'Gameleira De Sao Sebastiao', :zip_code => '63.208-000', :state => state); c.save 
c = City.new(:name => 'Gazea', :zip_code => '62.235-000', :state => state); c.save 
c = City.new(:name => 'General Sampaio', :zip_code => '62.738-000', :state => state); c.save 
c = City.new(:name => 'General Tiburcio', :zip_code => '62.305-000', :state => state); c.save 
c = City.new(:name => 'Gererau', :zip_code => '61.887-000', :state => state); c.save 
c = City.new(:name => 'Giqui', :zip_code => '62.830-000', :state => state); c.save 
c = City.new(:name => 'Graca', :zip_code => '62.365-000', :state => state); c.save 
c = City.new(:name => 'Granja', :zip_code => '62.430-000', :state => state); c.save 
c = City.new(:name => 'Granjeiro', :zip_code => '63.230-000', :state => state); c.save 
c = City.new(:name => 'Groairas', :zip_code => '62.190-000', :state => state); c.save 
c = City.new(:name => 'Guaiuba', :zip_code => '61.890-000', :state => state); c.save 
c = City.new(:name => 'Guanaces', :zip_code => '62.856-000', :state => state); c.save 
c = City.new(:name => 'Guaraciaba Do Norte', :zip_code => '62.380-000', :state => state); c.save 
c = City.new(:name => 'Guaramiranga', :zip_code => '62.766-000', :state => state); c.save 
c = City.new(:name => 'Guararu', :zip_code => '61.690-000', :state => state); c.save 
c = City.new(:name => 'Guassi', :zip_code => '62.794-000', :state => state); c.save 
c = City.new(:name => 'Guassosse', :zip_code => '63.527-000', :state => state); c.save 
c = City.new(:name => 'Guia', :zip_code => '63.885-000', :state => state); c.save 
c = City.new(:name => 'Guriu', :zip_code => '62.408-000', :state => state); c.save 
c = City.new(:name => 'Hidrolandia', :zip_code => '62.270-000', :state => state); c.save 
c = City.new(:name => 'Holanda', :zip_code => '63.760-000', :state => state); c.save 
c = City.new(:name => 'Horizonte', :zip_code => '62.880-000', :state => state); c.save 
c = City.new(:name => 'Iapi', :zip_code => '63.643-000', :state => state); c.save 
c = City.new(:name => 'Iara', :zip_code => '63.390-000', :state => state); c.save 
c = City.new(:name => 'Ibaretama', :zip_code => '63.970-000', :state => state); c.save 
c = City.new(:name => 'Ibiapaba', :zip_code => '63.725-000', :state => state); c.save 
c = City.new(:name => 'Ibiapina', :zip_code => '62.360-000', :state => state); c.save 
c = City.new(:name => 'Ibicatu', :zip_code => '63.558-000', :state => state); c.save 
c = City.new(:name => 'Ibicua', :zip_code => '63.608-000', :state => state); c.save 
c = City.new(:name => 'Ibicuitaba', :zip_code => '62.813-000', :state => state); c.save 
c = City.new(:name => 'Ibicuitinga', :zip_code => '62.955-000', :state => state); c.save 
c = City.new(:name => 'Iborepi', :zip_code => '63.303-000', :state => state); c.save 
c = City.new(:name => 'Ibuacu', :zip_code => '63.890-000', :state => state); c.save 
c = City.new(:name => 'Ibuguacu', :zip_code => '62.448-000', :state => state); c.save 
c = City.new(:name => 'Icapui', :zip_code => '62.810-000', :state => state); c.save 
c = City.new(:name => 'Icarai', :zip_code => '62.545-000', :state => state); c.save 
c = City.new(:name => 'Ico', :zip_code => '63.430-000', :state => state); c.save 
c = City.new(:name => 'Icozinho', :zip_code => '63.445-000', :state => state); c.save 
c = City.new(:name => 'Ideal', :zip_code => '62.754-000', :state => state); c.save 
c = City.new(:name => 'Igaroi', :zip_code => '63.528-000', :state => state); c.save 
c = City.new(:name => 'Iguatu', :zip_code => '63.500-000', :state => state); c.save 
c = City.new(:name => 'Independencia', :zip_code => '63.640-000', :state => state); c.save 
c = City.new(:name => 'Ingazeiras', :zip_code => '63.370-000', :state => state); c.save 
c = City.new(:name => 'Inhamuns', :zip_code => '63.666-000', :state => state); c.save 
c = City.new(:name => 'Inhucu', :zip_code => '62.373-000', :state => state); c.save 
c = City.new(:name => 'Inhuporanga', :zip_code => '62.734-000', :state => state); c.save 
c = City.new(:name => 'Ipaporanga', :zip_code => '62.215-000', :state => state); c.save 
c = City.new(:name => 'Ipaumirim', :zip_code => '63.340-000', :state => state); c.save 
c = City.new(:name => 'Ipu', :zip_code => '62.250-000', :state => state); c.save 
c = City.new(:name => 'Ipueiras', :zip_code => '62.230-000', :state => state); c.save 
c = City.new(:name => 'Ipueiras Dos Gomes', :zip_code => '62.715-000', :state => state); c.save 
c = City.new(:name => 'Iracema', :zip_code => '62.980-000', :state => state); c.save 
c = City.new(:name => 'Iraja', :zip_code => '62.278-000', :state => state); c.save 
c = City.new(:name => 'Irapua', :zip_code => '63.728-000', :state => state); c.save 
c = City.new(:name => 'Iratinga', :zip_code => '62.608-000', :state => state); c.save 
c = City.new(:name => 'Iraucuba', :zip_code => '62.620-000', :state => state); c.save 
c = City.new(:name => 'Isidoro', :zip_code => '63.563-000', :state => state); c.save 
c = City.new(:name => 'Itacima', :zip_code => '61.893-000', :state => state); c.save 
c = City.new(:name => 'Itagua', :zip_code => '63.152-000', :state => state); c.save 
c = City.new(:name => 'Itaicaba', :zip_code => '62.820-000', :state => state); c.save 
c = City.new(:name => 'Itaipaba', :zip_code => '62.872-000', :state => state); c.save 
c = City.new(:name => 'Itaitinga', :zip_code => '61.880-000', :state => state); c.save 
c = City.new(:name => 'Itans', :zip_code => '62.746-000', :state => state); c.save 
c = City.new(:name => 'Itapage', :zip_code => '62.600-000', :state => state); c.save 
c = City.new(:name => 'Itapebussu', :zip_code => '61.980-000', :state => state); c.save 
c = City.new(:name => 'Itapeim', :zip_code => '62.843-000', :state => state); c.save 
c = City.new(:name => 'Itapipoca', :zip_code => '62.500-000', :state => state); c.save 
c = City.new(:name => 'Itapiuna', :zip_code => '62.740-000', :state => state); c.save 
c = City.new(:name => 'Itapo', :zip_code => '61.877-000', :state => state); c.save 
c = City.new(:name => 'Itarema', :zip_code => '62.590-000', :state => state); c.save 
c = City.new(:name => 'Itatira', :zip_code => '62.720-000', :state => state); c.save 
c = City.new(:name => 'Jaburuna', :zip_code => '62.354-000', :state => state); c.save 
c = City.new(:name => 'Jacampari', :zip_code => '63.895-000', :state => state); c.save 
c = City.new(:name => 'Jacarecoara', :zip_code => '62.855-000', :state => state); c.save 
c = City.new(:name => 'Jacauna', :zip_code => '61.752-000', :state => state); c.save 
c = City.new(:name => 'Jaguaretama', :zip_code => '63.480-000', :state => state); c.save 
c = City.new(:name => 'Jaguaribara', :zip_code => '63.490-000', :state => state); c.save 
c = City.new(:name => 'Jaguaribe', :zip_code => '63.475-000', :state => state); c.save 
c = City.new(:name => 'Jaguaruana', :zip_code => '62.823-000', :state => state); c.save 
c = City.new(:name => 'Jaibaras', :zip_code => '62.107-000', :state => state); c.save 
c = City.new(:name => 'Jamacaru', :zip_code => '63.207-000', :state => state); c.save 
c = City.new(:name => 'Jandrangoeira', :zip_code => '63.642-000', :state => state); c.save 
c = City.new(:name => 'Jardim', :zip_code => '63.290-000', :state => state); c.save 
c = City.new(:name => 'Jardim', :zip_code => '62.684-000', :state => state); c.save 
c = City.new(:name => 'Jardimirim', :zip_code => '63.295-000', :state => state); c.save 
c = City.new(:name => 'Jati', :zip_code => '63.275-000', :state => state); c.save 
c = City.new(:name => 'Jijoca De Jericoacoara', :zip_code => '62.598-000', :state => state); c.save 
c = City.new(:name => 'Joao Cordeiro', :zip_code => '62.158-000', :state => state); c.save 
c = City.new(:name => 'Jordao', :zip_code => '62.108-000', :state => state); c.save 
c = City.new(:name => 'Jose De Alencar', :zip_code => '63.505-000', :state => state); c.save 
c = City.new(:name => 'Jua', :zip_code => '62.628-000', :state => state); c.save 
c = City.new(:name => 'Juatama', :zip_code => '63.910-000', :state => state); c.save 
c = City.new(:name => 'Juazeiro De Baixo', :zip_code => '62.945-000', :state => state); c.save 
c = City.new(:name => 'Juazeiro Do Norte', :zip_code => '63.000-000', :state => state); c.save 
c = City.new(:name => 'Jubaia', :zip_code => '61.955-000', :state => state); c.save 
c = City.new(:name => 'Jucas', :zip_code => '63.580-000', :state => state); c.save 
c = City.new(:name => 'Justiniano Serpa', :zip_code => '61.751-000', :state => state); c.save 
c = City.new(:name => 'Lacerda', :zip_code => '63.820-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Mato', :zip_code => '62.725-000', :state => state); c.save 
c = City.new(:name => 'Lambedouro', :zip_code => '62.308-000', :state => state); c.save 
c = City.new(:name => 'Lameiro', :zip_code => '63.134-000', :state => state); c.save 
c = City.new(:name => 'Lavras Da Mangabeira', :zip_code => '63.300-000', :state => state); c.save 
c = City.new(:name => 'Lima Campos', :zip_code => '63.435-000', :state => state); c.save 
c = City.new(:name => 'Limoeiro Do Norte', :zip_code => '62.930-000', :state => state); c.save 
c = City.new(:name => 'Livramento', :zip_code => '62.238-000', :state => state); c.save 
c = City.new(:name => 'Logradouro', :zip_code => '62.292-000', :state => state); c.save 
c = City.new(:name => 'Macambira', :zip_code => '62.225-000', :state => state); c.save 
c = City.new(:name => 'Macaoca', :zip_code => '63.865-000', :state => state); c.save 
c = City.new(:name => 'Macarau', :zip_code => '62.285-000', :state => state); c.save 
c = City.new(:name => 'Madalena', :zip_code => '63.860-000', :state => state); c.save 
c = City.new(:name => 'Major Simplicio', :zip_code => '62.208-000', :state => state); c.save 
c = City.new(:name => 'Malhada Grande', :zip_code => '62.294-000', :state => state); c.save 
c = City.new(:name => 'Mangabeira', :zip_code => '63.307-000', :state => state); c.save 
c = City.new(:name => 'Manibu', :zip_code => '62.814-000', :state => state); c.save 
c = City.new(:name => 'Manituba', :zip_code => '63.830-000', :state => state); c.save 
c = City.new(:name => 'Mapua', :zip_code => '63.476-000', :state => state); c.save 
c = City.new(:name => 'Maracanau', :zip_code => '61.900-000', :state => state); c.save 
c = City.new(:name => 'Maragua', :zip_code => '63.218-000', :state => state); c.save 
c = City.new(:name => 'Maranguape', :zip_code => '61.940-000', :state => state); c.save 
c = City.new(:name => 'Mararupa', :zip_code => '63.216-000', :state => state); c.save 
c = City.new(:name => 'Marco', :zip_code => '62.560-000', :state => state); c.save 
c = City.new(:name => 'Marinheiros', :zip_code => '62.520-000', :state => state); c.save 
c = City.new(:name => 'Marrecas', :zip_code => '63.664-000', :state => state); c.save 
c = City.new(:name => 'Marrocos', :zip_code => '63.084-000', :state => state); c.save 
c = City.new(:name => 'Marruas', :zip_code => '63.665-000', :state => state); c.save 
c = City.new(:name => 'Martinopole', :zip_code => '62.450-000', :state => state); c.save 
c = City.new(:name => 'Massape', :zip_code => '62.140-000', :state => state); c.save 
c = City.new(:name => 'Mata Fresca', :zip_code => '62.808-000', :state => state); c.save 
c = City.new(:name => 'Matias', :zip_code => '62.645-000', :state => state); c.save 
c = City.new(:name => 'Matriz', :zip_code => '62.232-000', :state => state); c.save 
c = City.new(:name => 'Mauriti', :zip_code => '63.210-000', :state => state); c.save 
c = City.new(:name => 'Mel', :zip_code => '63.587-000', :state => state); c.save 
c = City.new(:name => 'Meruoca', :zip_code => '62.130-000', :state => state); c.save 
c = City.new(:name => 'Messejana', :zip_code => '60.000-000', :state => state); c.save 
c = City.new(:name => 'Miguel Xavier', :zip_code => '63.228-000', :state => state); c.save 
c = City.new(:name => 'Milagres', :zip_code => '63.250-000', :state => state); c.save 
c = City.new(:name => 'Milha', :zip_code => '63.635-000', :state => state); c.save 
c = City.new(:name => 'Mineirolandia', :zip_code => '63.632-000', :state => state); c.save 
c = City.new(:name => 'Miragem', :zip_code => '63.223-000', :state => state); c.save 
c = City.new(:name => 'Miraima', :zip_code => '62.530-000', :state => state); c.save 
c = City.new(:name => 'Mirambe', :zip_code => '61.685-000', :state => state); c.save 
c = City.new(:name => 'Missao Nova', :zip_code => '63.203-000', :state => state); c.save 
c = City.new(:name => 'Missao Velha', :zip_code => '63.200-000', :state => state); c.save 
c = City.new(:name => 'Missi', :zip_code => '62.625-000', :state => state); c.save 
c = City.new(:name => 'Mombaca', :zip_code => '63.610-000', :state => state); c.save 
c = City.new(:name => 'Mondubim', :zip_code => '60.000-000', :state => state); c.save 
c = City.new(:name => 'Monsenhor Tabosa', :zip_code => '63.780-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre', :zip_code => '62.703-000', :state => state); c.save 
c = City.new(:name => 'Monte Sion', :zip_code => '63.695-000', :state => state); c.save 
c = City.new(:name => 'Montenebo', :zip_code => '63.715-000', :state => state); c.save 
c = City.new(:name => 'Morada Nova', :zip_code => '62.940-000', :state => state); c.save 
c = City.new(:name => 'Moraujo', :zip_code => '62.480-000', :state => state); c.save 
c = City.new(:name => 'Morrinhos', :zip_code => '62.550-000', :state => state); c.save 
c = City.new(:name => 'Morrinhos Novos', :zip_code => '62.386-000', :state => state); c.save 
c = City.new(:name => 'Mucambo', :zip_code => '62.170-000', :state => state); c.save 
c = City.new(:name => 'Mulungu', :zip_code => '62.764-000', :state => state); c.save 
c = City.new(:name => 'Mumbaba', :zip_code => '62.142-000', :state => state); c.save 
c = City.new(:name => 'Mundau', :zip_code => '62.695-000', :state => state); c.save 
c = City.new(:name => 'Muribeca', :zip_code => '62.296-000', :state => state); c.save 
c = City.new(:name => 'Muriti', :zip_code => '63.100-000', :state => state); c.save 
c = City.new(:name => 'Mutambeiras', :zip_code => '62.154-000', :state => state); c.save 
c = City.new(:name => 'Naraniu', :zip_code => '63.550-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Livramento', :zip_code => '63.790-000', :state => state); c.save 
c = City.new(:name => 'Nova Betania', :zip_code => '63.187-000', :state => state); c.save 
c = City.new(:name => 'Nova Betania', :zip_code => '62.205-000', :state => state); c.save 
c = City.new(:name => 'Nova Fatima', :zip_code => '62.245-000', :state => state); c.save 
c = City.new(:name => 'Nova Floresta', :zip_code => '63.478-000', :state => state); c.save 
c = City.new(:name => 'Nova Olinda', :zip_code => '63.165-000', :state => state); c.save 
c = City.new(:name => 'Nova Russas', :zip_code => '62.200-000', :state => state); c.save 
c = City.new(:name => 'Novo Assis', :zip_code => '63.690-000', :state => state); c.save 
c = City.new(:name => 'Novo Oriente', :zip_code => '63.740-000', :state => state); c.save 
c = City.new(:name => 'Ocara', :zip_code => '62.755-000', :state => state); c.save 
c = City.new(:name => 'Oiticica', :zip_code => '63.730-000', :state => state); c.save 
c = City.new(:name => 'Olho-dagua', :zip_code => '62.113-000', :state => state); c.save 
c = City.new(:name => 'Olho-dagua Da Bica', :zip_code => '62.964-000', :state => state); c.save 
c = City.new(:name => 'Oliveiras', :zip_code => '63.775-000', :state => state); c.save 
c = City.new(:name => 'Oros', :zip_code => '63.520-000', :state => state); c.save 
c = City.new(:name => 'Pacajus', :zip_code => '62.870-000', :state => state); c.save 
c = City.new(:name => 'Pacatuba', :zip_code => '61.800-000', :state => state); c.save 
c = City.new(:name => 'Pacoti', :zip_code => '62.770-000', :state => state); c.save 
c = City.new(:name => 'Pacuja', :zip_code => '62.180-000', :state => state); c.save 
c = City.new(:name => 'Padre Cicero', :zip_code => '63.082-000', :state => state); c.save 
c = City.new(:name => 'Padre Linhares', :zip_code => '62.146-000', :state => state); c.save 
c = City.new(:name => 'Padre Vieira', :zip_code => '62.315-000', :state => state); c.save 
c = City.new(:name => 'Pajeu', :zip_code => '63.172-000', :state => state); c.save 
c = City.new(:name => 'Pajucara', :zip_code => '61.900-000', :state => state); c.save 
c = City.new(:name => 'Palestina', :zip_code => '63.525-000', :state => state); c.save 
c = City.new(:name => 'Palestina Do Norte', :zip_code => '62.134-000', :state => state); c.save 
c = City.new(:name => 'Palhano', :zip_code => '62.910-000', :state => state); c.save 
c = City.new(:name => 'Palmacia', :zip_code => '62.780-000', :state => state); c.save 
c = City.new(:name => 'Palmatoria', :zip_code => '62.744-000', :state => state); c.save 
c = City.new(:name => 'Panacui', :zip_code => '62.565-000', :state => state); c.save 
c = City.new(:name => 'Paracua', :zip_code => '62.465-000', :state => state); c.save 
c = City.new(:name => 'Paracuru', :zip_code => '62.680-000', :state => state); c.save 
c = City.new(:name => 'Paraipaba', :zip_code => '62.685-000', :state => state); c.save 
c = City.new(:name => 'Parajuru', :zip_code => '62.848-000', :state => state); c.save 
c = City.new(:name => 'Parambu', :zip_code => '63.680-000', :state => state); c.save 
c = City.new(:name => 'Paramoti', :zip_code => '62.736-000', :state => state); c.save 
c = City.new(:name => 'Parangaba', :zip_code => '60.000-000', :state => state); c.save 
c = City.new(:name => 'Parapui', :zip_code => '62.156-000', :state => state); c.save 
c = City.new(:name => 'Parazinho', :zip_code => '62.437-000', :state => state); c.save 
c = City.new(:name => 'Paripueira', :zip_code => '62.844-000', :state => state); c.save 
c = City.new(:name => 'Passagem', :zip_code => '62.425-000', :state => state); c.save 
c = City.new(:name => 'Passagem', :zip_code => '63.835-000', :state => state); c.save 
c = City.new(:name => 'Pasta', :zip_code => '63.622-000', :state => state); c.save 
c = City.new(:name => 'Patriarca', :zip_code => '62.104-000', :state => state); c.save 
c = City.new(:name => 'Pavuna', :zip_code => '61.870-000', :state => state); c.save 
c = City.new(:name => 'Pecem', :zip_code => '62.674-000', :state => state); c.save 
c = City.new(:name => 'Pedra Branca', :zip_code => '63.630-000', :state => state); c.save 
c = City.new(:name => 'Pedras', :zip_code => '62.943-000', :state => state); c.save 
c = City.new(:name => 'Pedrinhas', :zip_code => '63.455-000', :state => state); c.save 
c = City.new(:name => 'Peixe Gordo', :zip_code => '62.962-000', :state => state); c.save 
c = City.new(:name => 'Penaforte', :zip_code => '63.280-000', :state => state); c.save 
c = City.new(:name => 'Pentecoste', :zip_code => '62.640-000', :state => state); c.save 
c = City.new(:name => 'Pereiro', :zip_code => '63.460-000', :state => state); c.save 
c = City.new(:name => 'Pernambuquinho', :zip_code => '62.768-000', :state => state); c.save 
c = City.new(:name => 'Pessoa Anta', :zip_code => '62.445-000', :state => state); c.save 
c = City.new(:name => 'Pindoguaba', :zip_code => '62.330-000', :state => state); c.save 
c = City.new(:name => 'Pindoretama', :zip_code => '62.860-000', :state => state); c.save 
c = City.new(:name => 'Piquet Carneiro', :zip_code => '63.605-000', :state => state); c.save 
c = City.new(:name => 'Pirabibu', :zip_code => '63.802-000', :state => state); c.save 
c = City.new(:name => 'Pires Ferreira', :zip_code => '62.255-000', :state => state); c.save 
c = City.new(:name => 'Pitombeira', :zip_code => '62.606-000', :state => state); c.save 
c = City.new(:name => 'Pitombeiras', :zip_code => '62.858-000', :state => state); c.save 
c = City.new(:name => 'Poco', :zip_code => '63.268-000', :state => state); c.save 
c = City.new(:name => 'Poco Comprido', :zip_code => '63.495-000', :state => state); c.save 
c = City.new(:name => 'Poco Grande', :zip_code => '63.588-000', :state => state); c.save 
c = City.new(:name => 'Podimirim', :zip_code => '63.255-000', :state => state); c.save 
c = City.new(:name => 'Ponta Da Serra', :zip_code => '63.138-000', :state => state); c.save 
c = City.new(:name => 'Poranga', :zip_code => '62.220-000', :state => state); c.save 
c = City.new(:name => 'Porfirio Sampaio', :zip_code => '62.648-000', :state => state); c.save 
c = City.new(:name => 'Porteiras', :zip_code => '63.270-000', :state => state); c.save 
c = City.new(:name => 'Potengi', :zip_code => '63.160-000', :state => state); c.save 
c = City.new(:name => 'Poti', :zip_code => '63.720-000', :state => state); c.save 
c = City.new(:name => 'Potiretama', :zip_code => '62.990-000', :state => state); c.save 
c = City.new(:name => 'Prata', :zip_code => '62.575-000', :state => state); c.save 
c = City.new(:name => 'Quatiguaba', :zip_code => '62.310-000', :state => state); c.save 
c = City.new(:name => 'Quimami', :zip_code => '63.205-000', :state => state); c.save 
c = City.new(:name => 'Quincoe', :zip_code => '63.562-000', :state => state); c.save 
c = City.new(:name => 'Quincunca', :zip_code => '63.188-000', :state => state); c.save 
c = City.new(:name => 'Quitaius', :zip_code => '63.308-000', :state => state); c.save 
c = City.new(:name => 'Quixada', :zip_code => '63.900-000', :state => state); c.save 
c = City.new(:name => 'Quixariu', :zip_code => '63.154-000', :state => state); c.save 
c = City.new(:name => 'Quixelo', :zip_code => '63.515-000', :state => state); c.save 
c = City.new(:name => 'Quixeramobim', :zip_code => '63.800-000', :state => state); c.save 
c = City.new(:name => 'Quixere', :zip_code => '62.920-000', :state => state); c.save 
c = City.new(:name => 'Quixoa', :zip_code => '63.502-000', :state => state); c.save 
c = City.new(:name => 'Raimundo Martins', :zip_code => '62.295-000', :state => state); c.save 
c = City.new(:name => 'Redencao', :zip_code => '62.790-000', :state => state); c.save 
c = City.new(:name => 'Reriutaba', :zip_code => '62.260-000', :state => state); c.save 
c = City.new(:name => 'Riachao Do Banabuiu', :zip_code => '63.631-000', :state => state); c.save 
c = City.new(:name => 'Riacho Grande', :zip_code => '63.178-000', :state => state); c.save 
c = City.new(:name => 'Riacho Verde', :zip_code => '63.548-000', :state => state); c.save 
c = City.new(:name => 'Rinare', :zip_code => '63.965-000', :state => state); c.save 
c = City.new(:name => 'Roldao', :zip_code => '62.948-000', :state => state); c.save 
c = City.new(:name => 'Russas', :zip_code => '62.900-000', :state => state); c.save 
c = City.new(:name => 'Saboeiro', :zip_code => '63.590-000', :state => state); c.save 
c = City.new(:name => 'Sacramento', :zip_code => '62.218-000', :state => state); c.save 
c = City.new(:name => 'Salao', :zip_code => '62.475-000', :state => state); c.save 
c = City.new(:name => 'Salitre', :zip_code => '63.155-000', :state => state); c.save 
c = City.new(:name => 'Sambaiba', :zip_code => '62.433-000', :state => state); c.save 
c = City.new(:name => 'Santa Ana', :zip_code => '62.776-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe', :zip_code => '63.136-000', :state => state); c.save 
c = City.new(:name => 'Santa Felicia', :zip_code => '63.565-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia', :zip_code => '62.652-000', :state => state); c.save 
c = City.new(:name => 'Santa Quiteria', :zip_code => '62.280-000', :state => state); c.save 
c = City.new(:name => 'Santa Tereza', :zip_code => '63.668-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Acarau', :zip_code => '62.150-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Cariri', :zip_code => '63.190-000', :state => state); c.save 
c = City.new(:name => 'Santarem', :zip_code => '63.523-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '63.561-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '63.385-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '63.705-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '62.213-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Pindoba', :zip_code => '62.363-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Dos Fernandes', :zip_code => '62.138-000', :state => state); c.save 
c = City.new(:name => 'Sao Bartolomeu', :zip_code => '63.533-000', :state => state); c.save 
c = City.new(:name => 'Sao Benedito', :zip_code => '62.370-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '62.732-000', :state => state); c.save 
c = City.new(:name => 'Sao Felipe', :zip_code => '63.265-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '63.652-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '62.136-000', :state => state); c.save 
c = City.new(:name => 'Sao Gerardo', :zip_code => '62.792-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Amarante', :zip_code => '62.670-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Umari', :zip_code => '63.617-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Deus', :zip_code => '62.908-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Jaguaribe', :zip_code => '62.965-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '62.663-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim Do Salgado', :zip_code => '63.604-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '62.984-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '62.825-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Das Lontras', :zip_code => '62.248-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Solonopole', :zip_code => '63.621-000', :state => state); c.save 
c = City.new(:name => 'Sao Luis Do Curu', :zip_code => '62.665-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel', :zip_code => '63.825-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '63.585-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '62.209-000', :state => state); c.save 
c = City.new(:name => 'Sao Romao', :zip_code => '63.198-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '63.535-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '63.450-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '63.618-000', :state => state); c.save 
c = City.new(:name => 'Sapo', :zip_code => '62.152-000', :state => state); c.save 
c = City.new(:name => 'Sapupara', :zip_code => '61.950-000', :state => state); c.save 
c = City.new(:name => 'Sebastiao De Abreu', :zip_code => '62.642-000', :state => state); c.save 
c = City.new(:name => 'Senador Pompeu', :zip_code => '63.600-000', :state => state); c.save 
c = City.new(:name => 'Senador Sa', :zip_code => '62.470-000', :state => state); c.save 
c = City.new(:name => 'Serra Do Felix', :zip_code => '62.846-000', :state => state); c.save 
c = City.new(:name => 'Serrota', :zip_code => '62.477-000', :state => state); c.save 
c = City.new(:name => 'Serrote', :zip_code => '62.678-000', :state => state); c.save 
c = City.new(:name => 'Sitia', :zip_code => '63.962-000', :state => state); c.save 
c = City.new(:name => 'Sitios Novos', :zip_code => '61.695-000', :state => state); c.save 
c = City.new(:name => 'Siupe', :zip_code => '62.675-000', :state => state); c.save 
c = City.new(:name => 'Sobral', :zip_code => '62.000-000', :state => state); c.save 
c = City.new(:name => 'Soledade', :zip_code => '62.607-000', :state => state); c.save 
c = City.new(:name => 'Solonopole', :zip_code => '63.620-000', :state => state); c.save 
c = City.new(:name => 'Suassurana', :zip_code => '63.510-000', :state => state); c.save 
c = City.new(:name => 'Sucatinga', :zip_code => '62.842-000', :state => state); c.save 
c = City.new(:name => 'Sucesso', :zip_code => '63.765-000', :state => state); c.save 
c = City.new(:name => 'Sussuanha', :zip_code => '62.385-000', :state => state); c.save 
c = City.new(:name => 'Tabainha', :zip_code => '62.335-000', :state => state); c.save 
c = City.new(:name => 'Taboleiro', :zip_code => '63.573-000', :state => state); c.save 
c = City.new(:name => 'Tabuleiro Do Norte', :zip_code => '62.960-000', :state => state); c.save 
c = City.new(:name => 'Tamboril', :zip_code => '63.750-000', :state => state); c.save 
c = City.new(:name => 'Tanques', :zip_code => '61.960-000', :state => state); c.save 
c = City.new(:name => 'Taperuaba', :zip_code => '62.106-000', :state => state); c.save 
c = City.new(:name => 'Tapuiara', :zip_code => '63.935-000', :state => state); c.save 
c = City.new(:name => 'Targinos', :zip_code => '62.713-000', :state => state); c.save 
c = City.new(:name => 'Tarrafas', :zip_code => '63.145-000', :state => state); c.save 
c = City.new(:name => 'Deputado Irapuan Pinheiro', :zip_code => '63.645-000', :state => state); c.save 
c = City.new(:name => 'Taua', :zip_code => '63.660-000', :state => state); c.save 
c = City.new(:name => 'Tejucuoca', :zip_code => '62.610-000', :state => state); c.save 
c = City.new(:name => 'Tiangua', :zip_code => '62.320-000', :state => state); c.save 
c = City.new(:name => 'Timonha', :zip_code => '62.440-000', :state => state); c.save 
c = City.new(:name => 'Tipi', :zip_code => '63.365-000', :state => state); c.save 
c = City.new(:name => 'Trairi', :zip_code => '62.690-000', :state => state); c.save 
c = City.new(:name => 'Trapia', :zip_code => '62.283-000', :state => state); c.save 
c = City.new(:name => 'Trapia', :zip_code => '62.110-000', :state => state); c.save 
c = City.new(:name => 'Trici', :zip_code => '63.663-000', :state => state); c.save 
c = City.new(:name => 'Troia', :zip_code => '63.633-000', :state => state); c.save 
c = City.new(:name => 'Trussu', :zip_code => '63.564-000', :state => state); c.save 
c = City.new(:name => 'Tucunduba', :zip_code => '61.688-000', :state => state); c.save 
c = City.new(:name => 'Tucuns', :zip_code => '63.710-000', :state => state); c.save 
c = City.new(:name => 'Tuina', :zip_code => '62.141-000', :state => state); c.save 
c = City.new(:name => 'Tururu', :zip_code => '62.655-000', :state => state); c.save 
c = City.new(:name => 'Ubajara', :zip_code => '62.350-000', :state => state); c.save 
c = City.new(:name => 'Ubauna', :zip_code => '62.168-000', :state => state); c.save 
c = City.new(:name => 'Ubiracu', :zip_code => '62.710-000', :state => state); c.save 
c = City.new(:name => 'Uiraponga', :zip_code => '62.950-000', :state => state); c.save 
c = City.new(:name => 'Umari', :zip_code => '63.310-000', :state => state); c.save 
c = City.new(:name => 'Umarituba', :zip_code => '62.672-000', :state => state); c.save 
c = City.new(:name => 'Umburanas', :zip_code => '63.214-000', :state => state); c.save 
c = City.new(:name => 'Umirim', :zip_code => '62.660-000', :state => state); c.save 
c = City.new(:name => 'Uruburetama', :zip_code => '62.650-000', :state => state); c.save 
c = City.new(:name => 'Uruoca', :zip_code => '62.460-000', :state => state); c.save 
c = City.new(:name => 'Uruque', :zip_code => '63.805-000', :state => state); c.save 
c = City.new(:name => 'Varjota', :zip_code => '62.265-000', :state => state); c.save 
c = City.new(:name => 'Varzea', :zip_code => '63.405-000', :state => state); c.save 
c = City.new(:name => 'Varzea Alegre', :zip_code => '63.540-000', :state => state); c.save 
c = City.new(:name => 'Varzea Da Volta', :zip_code => '62.485-000', :state => state); c.save 
c = City.new(:name => 'Varzea Do Gilo', :zip_code => '62.254-000', :state => state); c.save 
c = City.new(:name => 'Vazantes', :zip_code => '62.752-000', :state => state); c.save 
c = City.new(:name => 'Ventura', :zip_code => '62.125-000', :state => state); c.save 
c = City.new(:name => 'Vertentes Do Lagedo', :zip_code => '61.970-000', :state => state); c.save 
c = City.new(:name => 'Vicosa Do Ceara', :zip_code => '62.300-000', :state => state); c.save 
c = City.new(:name => 'Vila Soares', :zip_code => '62.635-000', :state => state); c.save 
c = City.new(:name => 'Agua Verde', :zip_code => '61.895-000', :state => state); c.save 
c = City.new(:name => 'Betania', :zip_code => '62.382-000', :state => state); c.save 
c = City.new(:name => 'Tapera', :zip_code => '61.758-000', :state => state); c.save 
c = City.new(:name => 'Patacas', :zip_code => '61.756-000', :state => state); c.save 
c = City.new(:name => 'Caponga Da Bernarda', :zip_code => '61.754-000', :state => state); c.save 
c = City.new(:name => 'Camara', :zip_code => '61.753-000', :state => state); c.save 
c = City.new(:name => 'Taiba', :zip_code => '62.677-000', :state => state); c.save 
c = City.new(:name => 'Camboas', :zip_code => '62.688-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '62.687-000', :state => state); c.save 
c = City.new(:name => 'Alagoinha', :zip_code => '62.686-000', :state => state); c.save 
c = City.new(:name => 'Gado Dos Rodrigues', :zip_code => '62.784-000', :state => state); c.save 
c = City.new(:name => 'Canaan', :zip_code => '62.692-000', :state => state); c.save 
c = City.new(:name => 'Barreira Dos Vianas', :zip_code => '62.802-000', :state => state); c.save 
c = City.new(:name => 'Aningas', :zip_code => '62.882-000', :state => state); c.save 
c = City.new(:name => 'Queimadas', :zip_code => '62.886-000', :state => state); c.save 
c = City.new(:name => 'Dourados', :zip_code => '62.884-000', :state => state); c.save 
c = City.new(:name => 'Brotas', :zip_code => '62.533-000', :state => state); c.save 
c = City.new(:name => 'Moitas', :zip_code => '62.543-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Grande', :zip_code => '62.542-000', :state => state); c.save 
c = City.new(:name => 'Garcas', :zip_code => '62.541-000', :state => state); c.save 
c = City.new(:name => 'Carvoeiro', :zip_code => '62.594-000', :state => state); c.save 
c = City.new(:name => 'Aguai', :zip_code => '62.602-000', :state => state); c.save 
c = City.new(:name => 'Caicara', :zip_code => '62.597-000', :state => state); c.save 
c = City.new(:name => 'Almofala', :zip_code => '62.592-000', :state => state); c.save 
c = City.new(:name => 'Sabiaguaba', :zip_code => '62.547-000', :state => state); c.save 
c = City.new(:name => 'Poco Comprido', :zip_code => '62.546-000', :state => state); c.save 
c = City.new(:name => 'Nascente', :zip_code => '62.544-000', :state => state); c.save 
c = City.new(:name => 'Deserto', :zip_code => '62.502-000', :state => state); c.save 
c = City.new(:name => 'Tome', :zip_code => '62.924-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Grande', :zip_code => '62.942-000', :state => state); c.save 
c = City.new(:name => 'Lagoinha', :zip_code => '62.922-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '62.913-000', :state => state); c.save 
c = City.new(:name => 'Peixe', :zip_code => '62.907-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Grande', :zip_code => '62.902-000', :state => state); c.save 
c = City.new(:name => 'Serrota', :zip_code => '63.392-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre', :zip_code => '63.389-000', :state => state); c.save 
c = City.new(:name => 'Engenho Velho', :zip_code => '63.383-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel', :zip_code => '63.219-000', :state => state); c.save 
c = City.new(:name => 'Codia', :zip_code => '63.603-000', :state => state); c.save 
c = City.new(:name => 'Bonfim', :zip_code => '63.601-000', :state => state); c.save 
c = City.new(:name => 'Palestina', :zip_code => '63.215-000', :state => state); c.save 
c = City.new(:name => 'Buritizinho', :zip_code => '63.213-000', :state => state); c.save 
c = City.new(:name => 'Dom Leme', :zip_code => '63.191-000', :state => state); c.save 
c = City.new(:name => 'Monte Grave', :zip_code => '63.639-000', :state => state); c.save 
c = City.new(:name => 'Betania', :zip_code => '63.623-000', :state => state); c.save 
c = City.new(:name => 'Mulungu', :zip_code => '63.606-000', :state => state); c.save 
c = City.new(:name => 'Jurema', :zip_code => '61.650-000', :state => state); c.save 
c = City.new(:name => 'Monguba', :zip_code => '61.860-000', :state => state); c.save 
c = City.new(:name => 'Senador Carlos Jereissati', :zip_code => '61.865-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Juvenal', :zip_code => '61.975-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Torto', :zip_code => '62.105-000', :state => state); c.save 
c = City.new(:name => 'Aprazivel', :zip_code => '62.114-000', :state => state); c.save 
c = City.new(:name => 'Buritizal', :zip_code => '62.227-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Grande', :zip_code => '62.228-000', :state => state); c.save 
c = City.new(:name => 'Donato', :zip_code => '62.259-000', :state => state); c.save 
c = City.new(:name => 'Croata', :zip_code => '62.269-000', :state => state); c.save 
c = City.new(:name => 'Barreiros', :zip_code => '62.374-000', :state => state); c.save 
c = City.new(:name => 'Caxitore', :zip_code => '62.664-000', :state => state); c.save 
c = City.new(:name => 'Aracas', :zip_code => '62.682-000', :state => state); c.save 
c = City.new(:name => 'Morro Branco', :zip_code => '62.727-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira', :zip_code => '62.728-000', :state => state); c.save 
c = City.new(:name => 'Jaguarao', :zip_code => '62.754-050', :state => state); c.save 
c = City.new(:name => 'Genipapeiro', :zip_code => '62.754-100', :state => state); c.save 
c = City.new(:name => 'Lagoa De Sao Jose', :zip_code => '62.754-150', :state => state); c.save 
c = City.new(:name => 'Milton Belo', :zip_code => '62.754-200', :state => state); c.save 
c = City.new(:name => 'Pedra Branca', :zip_code => '62.754-250', :state => state); c.save 
c = City.new(:name => 'Placido Martins', :zip_code => '62.754-300', :state => state); c.save 
c = City.new(:name => 'Passagem Funda', :zip_code => '62.754-350', :state => state); c.save 
c = City.new(:name => 'Ariscos Dos Marianos', :zip_code => '62.759-000', :state => state); c.save 
c = City.new(:name => 'Novo Oriente', :zip_code => '62.759-100', :state => state); c.save 
c = City.new(:name => 'Sereno De Cima', :zip_code => '62.759-200', :state => state); c.save 
c = City.new(:name => 'Serragem', :zip_code => '62.759-300', :state => state); c.save 
c = City.new(:name => 'Majorlandia', :zip_code => '62.809-000', :state => state); c.save 
c = City.new(:name => 'Monte Castelo', :zip_code => '63.154-100', :state => state); c.save 
c = City.new(:name => 'Caldeirao', :zip_code => '63.157-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Dos Crioulos', :zip_code => '63.158-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '63.245-000', :state => state); c.save 
c = City.new(:name => 'Pio X', :zip_code => '63.315-000', :state => state); c.save 
c = City.new(:name => 'Barra', :zip_code => '63.506-000', :state => state); c.save 
c = City.new(:name => 'Serrote', :zip_code => '63.507-000', :state => state); c.save 
c = City.new(:name => 'Barro Alto', :zip_code => '63.509-000', :state => state); c.save 
c = City.new(:name => 'Riacho Vermelho', :zip_code => '63.511-000', :state => state); c.save 
c = City.new(:name => 'Sao Paulo', :zip_code => '63.568-000', :state => state); c.save 
c = City.new(:name => 'Santana', :zip_code => '63.735-000', :state => state); c.save 
c = City.new(:name => 'Nenenlandia', :zip_code => '63.814-000', :state => state); c.save 
c = City.new(:name => 'Prudente De Morais', :zip_code => '63.815-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Dos Queiroz', :zip_code => '63.948-000', :state => state); c.save 
c = City.new(:name => 'Nova Vida', :zip_code => '63.980-000', :state => state); c.save 
c = City.new(:name => 'Pirangi', :zip_code => '63.982-000', :state => state); c.save 
c = City.new(:name => 'Oiticica', :zip_code => '63.984-000', :state => state); c.save 
c = City.new(:name => 'Ladeira Grande', :zip_code => '61.985-000', :state => state); c.save 
c = City.new(:name => 'Lisieux', :zip_code => '62.293-000', :state => state); c.save 
c = City.new(:name => 'Corrego Dos Fernandes', :zip_code => '62.807-000', :state => state); c.save 
c = City.new(:name => 'Girau', :zip_code => '62.807-500', :state => state); c.save 
c = City.new(:name => 'Santa Tereza', :zip_code => '62.808-500', :state => state); c.save 
c = City.new(:name => 'Barra', :zip_code => '62.816-000', :state => state); c.save 
c = City.new(:name => 'Campestre', :zip_code => '62.817-000', :state => state); c.save 
c = City.new(:name => 'Guajiru', :zip_code => '62.818-000', :state => state); c.save 
c = City.new(:name => 'Maceio', :zip_code => '62.819-000', :state => state); c.save 
c = City.new(:name => 'Vicosa', :zip_code => '62.819-500', :state => state); c.save 
c = City.new(:name => 'Cristais', :zip_code => '62.859-000', :state => state); c.save 
c = City.new(:name => 'Espacinha', :zip_code => '62.207-000', :state => state); c.save 
c = City.new(:name => 'California', :zip_code => '63.920-000', :state => state); c.save 
c = City.new(:name => 'Jua', :zip_code => '63.940-000', :state => state); c.save 

