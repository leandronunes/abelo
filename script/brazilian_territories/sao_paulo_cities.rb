#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('São Paulo')
state ||= State.create!( :name => 'São Paulo', :code => 'SP', :country => country);

c = City.new(:name => 'Adamantina', :zip_code => '17.800-000', :state => state); c.save 
c = City.new(:name => 'Adolfo', :zip_code => '15.230-000', :state => state); c.save 
c = City.new(:name => 'Agisse', :zip_code => '19.610-000', :state => state); c.save 
c = City.new(:name => 'Agua Vermelha', :zip_code => '13.578-000', :state => state); c.save 
c = City.new(:name => 'Aguai', :zip_code => '13.860-000', :state => state); c.save 
c = City.new(:name => 'Aguas Da Prata', :zip_code => '13.890-000', :state => state); c.save 
c = City.new(:name => 'Aguas De Lindoia', :zip_code => '13.940-000', :state => state); c.save 
c = City.new(:name => 'Aguas De Santa Barbara', :zip_code => '18.770-000', :state => state); c.save 
c = City.new(:name => 'Aguas De Sao Pedro', :zip_code => '13.525-000', :state => state); c.save 
c = City.new(:name => 'Agudos', :zip_code => '17.120-000', :state => state); c.save 
c = City.new(:name => 'Agulha', :zip_code => '15.945-000', :state => state); c.save 
c = City.new(:name => 'Ajapi', :zip_code => '13.508-000', :state => state); c.save 
c = City.new(:name => 'Alambari', :zip_code => '18.220-000', :state => state); c.save 
c = City.new(:name => 'Alberto Moreira', :zip_code => '14.788-000', :state => state); c.save 
c = City.new(:name => 'Aldeia', :zip_code => '06.400-000', :state => state); c.save 
c = City.new(:name => 'Alfredo Guedes', :zip_code => '18.688-000', :state => state); c.save 
c = City.new(:name => 'Alfredo Marcondes', :zip_code => '19.180-000', :state => state); c.save 
c = City.new(:name => 'Altair', :zip_code => '15.430-000', :state => state); c.save 
c = City.new(:name => 'Altinopolis', :zip_code => '14.350-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre', :zip_code => '16.310-000', :state => state); c.save 
c = City.new(:name => 'Alto Pora', :zip_code => '14.480-000', :state => state); c.save 
c = City.new(:name => 'Aluminio', :zip_code => '18.125-000', :state => state); c.save 
c = City.new(:name => 'Alvares Florence', :zip_code => '15.540-000', :state => state); c.save 
c = City.new(:name => 'Alvares Machado', :zip_code => '19.160-000', :state => state); c.save 
c = City.new(:name => 'Alvaro De Carvalho', :zip_code => '17.410-000', :state => state); c.save 
c = City.new(:name => 'Alvinlandia', :zip_code => '17.430-000', :state => state); c.save 
c = City.new(:name => 'Amadeu Amaral', :zip_code => '17.530-000', :state => state); c.save 
c = City.new(:name => 'Amandaba', :zip_code => '16.820-000', :state => state); c.save 
c = City.new(:name => 'Ameliopolis', :zip_code => '19.140-000', :state => state); c.save 
c = City.new(:name => 'Americana', :zip_code => '13.465-000', :state => state); c.save 
c = City.new(:name => 'Americo Brasiliense', :zip_code => '14.820-000', :state => state); c.save 
c = City.new(:name => 'Americo De Campos', :zip_code => '15.550-000', :state => state); c.save 
c = City.new(:name => 'Amparo', :zip_code => '13.900-000', :state => state); c.save 
c = City.new(:name => 'Ana Dias', :zip_code => '11.770-000', :state => state); c.save 
c = City.new(:name => 'Analandia', :zip_code => '13.550-000', :state => state); c.save 
c = City.new(:name => 'Anapolis', :zip_code => '17.685-000', :state => state); c.save 
c = City.new(:name => 'Andradina', :zip_code => '16.900-000', :state => state); c.save 
c = City.new(:name => 'Angatuba', :zip_code => '18.240-000', :state => state); c.save 
c = City.new(:name => 'Anhembi', :zip_code => '18.620-000', :state => state); c.save 
c = City.new(:name => 'Anhumas', :zip_code => '19.580-000', :state => state); c.save 
c = City.new(:name => 'Aparecida', :zip_code => '12.570-000', :state => state); c.save 
c = City.new(:name => 'Aparecida Doeste', :zip_code => '15.735-000', :state => state); c.save 
c = City.new(:name => 'Aparecida De Sao Manuel', :zip_code => '18.655-000', :state => state); c.save 
c = City.new(:name => 'Aparecida Do Bonito', :zip_code => '15.783-000', :state => state); c.save 
c = City.new(:name => 'Apiai', :zip_code => '18.320-000', :state => state); c.save 
c = City.new(:name => 'Arabela', :zip_code => '17.925-000', :state => state); c.save 
c = City.new(:name => 'Aracacu', :zip_code => '18.295-000', :state => state); c.save 
c = City.new(:name => 'Aracaiba', :zip_code => '18.323-000', :state => state); c.save 
c = City.new(:name => 'Aracariguama', :zip_code => '18.147-000', :state => state); c.save 
c = City.new(:name => 'Aracatuba', :zip_code => '16.000-000', :state => state); c.save 
c = City.new(:name => 'Aracoiaba Da Serra', :zip_code => '18.190-000', :state => state); c.save 
c = City.new(:name => 'Aramina', :zip_code => '14.550-000', :state => state); c.save 
c = City.new(:name => 'Arandu', :zip_code => '18.710-000', :state => state); c.save 
c = City.new(:name => 'Arapei', :zip_code => '12.870-000', :state => state); c.save 
c = City.new(:name => 'Araraquara', :zip_code => '14.800-000', :state => state); c.save 
c = City.new(:name => 'Araras', :zip_code => '13.600-000', :state => state); c.save 
c = City.new(:name => 'Araxas', :zip_code => '19.310-000', :state => state); c.save 
c = City.new(:name => 'Arcadas', :zip_code => '13.900-000', :state => state); c.save 
c = City.new(:name => 'Arco-iris', :zip_code => '17.630-000', :state => state); c.save 
c = City.new(:name => 'Arealva', :zip_code => '17.160-000', :state => state); c.save 
c = City.new(:name => 'Areias', :zip_code => '12.820-000', :state => state); c.save 
c = City.new(:name => 'Areiopolis', :zip_code => '18.670-000', :state => state); c.save 
c = City.new(:name => 'Ariranha', :zip_code => '15.960-000', :state => state); c.save 
c = City.new(:name => 'Ariri', :zip_code => '11.995-000', :state => state); c.save 
c = City.new(:name => 'Artemis', :zip_code => '13.432-000', :state => state); c.save 
c = City.new(:name => 'Artur Nogueira', :zip_code => '13.160-000', :state => state); c.save 
c = City.new(:name => 'Aruja', :zip_code => '07.400-000', :state => state); c.save 
c = City.new(:name => 'Aspasia', :zip_code => '15.763-000', :state => state); c.save 
c = City.new(:name => 'Assis', :zip_code => '19.800-000', :state => state); c.save 
c = City.new(:name => 'Assistencia', :zip_code => '13.509-000', :state => state); c.save 
c = City.new(:name => 'Atibaia', :zip_code => '12.940-000', :state => state); c.save 
c = City.new(:name => 'Atlantida', :zip_code => '17.840-000', :state => state); c.save 
c = City.new(:name => 'Auriflama', :zip_code => '15.350-000', :state => state); c.save 
c = City.new(:name => 'Avai', :zip_code => '16.680-000', :state => state); c.save 
c = City.new(:name => 'Avanhandava', :zip_code => '16.360-000', :state => state); c.save 
c = City.new(:name => 'Avare', :zip_code => '18.700-000', :state => state); c.save 
c = City.new(:name => 'Avencas', :zip_code => '17.532-000', :state => state); c.save 
c = City.new(:name => 'Bacaetava', :zip_code => '18.565-000', :state => state); c.save 
c = City.new(:name => 'Bacuriti', :zip_code => '16.520-000', :state => state); c.save 
c = City.new(:name => 'Bady Bassitt', :zip_code => '15.115-000', :state => state); c.save 
c = City.new(:name => 'Baguacu', :zip_code => '15.405-000', :state => state); c.save 
c = City.new(:name => 'Bairro Alto', :zip_code => '12.190-000', :state => state); c.save 
c = City.new(:name => 'Balbinos', :zip_code => '16.640-000', :state => state); c.save 
c = City.new(:name => 'Balsamo', :zip_code => '15.140-000', :state => state); c.save 
c = City.new(:name => 'Bananal', :zip_code => '12.850-000', :state => state); c.save 
c = City.new(:name => 'Barao Ataliba Nogueira', :zip_code => '13.986-000', :state => state); c.save 
c = City.new(:name => 'Barao De Antonina', :zip_code => '18.490-000', :state => state); c.save 
c = City.new(:name => 'Barbosa', :zip_code => '16.350-000', :state => state); c.save 
c = City.new(:name => 'Bariri', :zip_code => '17.250-000', :state => state); c.save 
c = City.new(:name => 'Barra Bonita', :zip_code => '17.340-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Chapeu', :zip_code => '18.325-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Turvo', :zip_code => '11.955-000', :state => state); c.save 
c = City.new(:name => 'Barra Dourada', :zip_code => '15.125-000', :state => state); c.save 
c = City.new(:name => 'Barrania', :zip_code => '13.775-000', :state => state); c.save 
c = City.new(:name => 'Barretos', :zip_code => '14.780-000', :state => state); c.save 
c = City.new(:name => 'Barrinha', :zip_code => '14.860-000', :state => state); c.save 
c = City.new(:name => 'Barueri', :zip_code => '06.400-000', :state => state); c.save 
c = City.new(:name => 'Bastos', :zip_code => '17.690-000', :state => state); c.save 
c = City.new(:name => 'Batatais', :zip_code => '14.300-000', :state => state); c.save 
c = City.new(:name => 'Batatuba', :zip_code => '12.975-000', :state => state); c.save 
c = City.new(:name => 'Batista Botelho', :zip_code => '18.794-000', :state => state); c.save 
c = City.new(:name => 'Bauru', :zip_code => '17.000-000', :state => state); c.save 
c = City.new(:name => 'Bebedouro', :zip_code => '14.700-000', :state => state); c.save 
c = City.new(:name => 'Bela Floresta', :zip_code => '15.374-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Sao-carlense', :zip_code => '13.560-000', :state => state); c.save 
c = City.new(:name => 'Bento De Abreu', :zip_code => '16.790-000', :state => state); c.save 
c = City.new(:name => 'Bernardino De Campos', :zip_code => '18.960-000', :state => state); c.save 
c = City.new(:name => 'Bertioga', :zip_code => '11.250-000', :state => state); c.save 
c = City.new(:name => 'Bilac', :zip_code => '16.210-000', :state => state); c.save 
c = City.new(:name => 'Birigui', :zip_code => '16.200-000', :state => state); c.save 
c = City.new(:name => 'Biritiba-mirim', :zip_code => '08.940-000', :state => state); c.save 
c = City.new(:name => 'Biritiba-ussu', :zip_code => '08.890-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca Do Sul', :zip_code => '14.930-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Dos Andradas', :zip_code => '15.545-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Paulista', :zip_code => '08.600-000', :state => state); c.save 
c = City.new(:name => 'Bocaina', :zip_code => '17.240-000', :state => state); c.save 
c = City.new(:name => 'Bofete', :zip_code => '18.590-000', :state => state); c.save 
c = City.new(:name => 'Boituva', :zip_code => '18.550-000', :state => state); c.save 
c = City.new(:name => 'Bom Fim Do Bom Jesus', :zip_code => '13.319-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Dos Perdoes', :zip_code => '12.955-000', :state => state); c.save 
c = City.new(:name => 'Bonfim Paulista', :zip_code => '14.110-000', :state => state); c.save 
c = City.new(:name => 'Bora', :zip_code => '19.740-000', :state => state); c.save 
c = City.new(:name => 'Boraceia', :zip_code => '17.270-000', :state => state); c.save 
c = City.new(:name => 'Borborema', :zip_code => '14.955-000', :state => state); c.save 
c = City.new(:name => 'Borebi', :zip_code => '18.675-000', :state => state); c.save 
c = City.new(:name => 'Botafogo', :zip_code => '14.718-000', :state => state); c.save 
c = City.new(:name => 'Botelho', :zip_code => '15.953-000', :state => state); c.save 
c = City.new(:name => 'Botucatu', :zip_code => '18.600-000', :state => state); c.save 
c = City.new(:name => 'Braco', :zip_code => '11.980-000', :state => state); c.save 
c = City.new(:name => 'Braganca Paulista', :zip_code => '12.900-000', :state => state); c.save 
c = City.new(:name => 'Bras Cubas', :zip_code => '08.700-000', :state => state); c.save 
c = City.new(:name => 'Brasitania', :zip_code => '15.617-000', :state => state); c.save 
c = City.new(:name => 'Brauna', :zip_code => '16.290-000', :state => state); c.save 
c = City.new(:name => 'Brejo Alegre', :zip_code => '16.265-000', :state => state); c.save 
c = City.new(:name => 'Brigadeiro Tobias', :zip_code => '18.108-000', :state => state); c.save 
c = City.new(:name => 'Brodowski', :zip_code => '14.340-000', :state => state); c.save 
c = City.new(:name => 'Brotas', :zip_code => '17.380-000', :state => state); c.save 
c = City.new(:name => 'Bueno De Andrada', :zip_code => '14.812-000', :state => state); c.save 
c = City.new(:name => 'Buri', :zip_code => '18.290-000', :state => state); c.save 
c = City.new(:name => 'Buritama', :zip_code => '15.290-000', :state => state); c.save 
c = City.new(:name => 'Buritizal', :zip_code => '14.570-000', :state => state); c.save 
c = City.new(:name => 'Cabralia Paulista', :zip_code => '17.480-000', :state => state); c.save 
c = City.new(:name => 'Cabreuva', :zip_code => '13.315-000', :state => state); c.save 
c = City.new(:name => 'Cacapava', :zip_code => '12.280-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Emas', :zip_code => '13.645-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Paulista', :zip_code => '12.630-000', :state => state); c.save 
c = City.new(:name => 'Caconde', :zip_code => '13.770-000', :state => state); c.save 
c = City.new(:name => 'Cafelandia', :zip_code => '16.500-000', :state => state); c.save 
c = City.new(:name => 'Cafesopolis', :zip_code => '16.530-000', :state => state); c.save 
c = City.new(:name => 'Caiabu', :zip_code => '19.530-000', :state => state); c.save 
c = City.new(:name => 'Caieiras', :zip_code => '07.700-000', :state => state); c.save 
c = City.new(:name => 'Caiua', :zip_code => '19.450-000', :state => state); c.save 
c = City.new(:name => 'Cajamar', :zip_code => '07.750-000', :state => state); c.save 
c = City.new(:name => 'Cajati', :zip_code => '11.950-000', :state => state); c.save 
c = City.new(:name => 'Cajobi', :zip_code => '15.410-000', :state => state); c.save 
c = City.new(:name => 'Cajuru', :zip_code => '14.240-000', :state => state); c.save 
c = City.new(:name => 'Cajuru Do Sul', :zip_code => '18.105-000', :state => state); c.save 
c = City.new(:name => 'Cambaquara', :zip_code => '11.640-000', :state => state); c.save 
c = City.new(:name => 'Cambaratiba', :zip_code => '14.945-000', :state => state); c.save 
c = City.new(:name => 'Campestrinho', :zip_code => '13.785-000', :state => state); c.save 
c = City.new(:name => 'Campina Do Monte Alegre', :zip_code => '18.245-000', :state => state); c.save 
c = City.new(:name => 'Nova Campina', :zip_code => '18.435-000', :state => state); c.save 
c = City.new(:name => 'Campinal', :zip_code => '19.490-000', :state => state); c.save 
c = City.new(:name => 'Campinas', :zip_code => '13.000-000', :state => state); c.save 
c = City.new(:name => 'Campo Limpo Paulista', :zip_code => '13.230-000', :state => state); c.save 
c = City.new(:name => 'Campos De Cunha', :zip_code => '12.540-000', :state => state); c.save 
c = City.new(:name => 'Campos Do Jordao', :zip_code => '12.460-000', :state => state); c.save 
c = City.new(:name => 'Campos Novos Paulista', :zip_code => '19.960-000', :state => state); c.save 
c = City.new(:name => 'Cananeia', :zip_code => '11.990-000', :state => state); c.save 
c = City.new(:name => 'Canas', :zip_code => '12.615-000', :state => state); c.save 
c = City.new(:name => 'Candia', :zip_code => '14.185-000', :state => state); c.save 
c = City.new(:name => 'Candido Mota', :zip_code => '19.880-000', :state => state); c.save 
c = City.new(:name => 'Candido Rodrigues', :zip_code => '15.930-000', :state => state); c.save 
c = City.new(:name => 'Canguera', :zip_code => '18.145-000', :state => state); c.save 
c = City.new(:name => 'Canitar', :zip_code => '18.990-000', :state => state); c.save 
c = City.new(:name => 'Capao Bonito', :zip_code => '18.300-000', :state => state); c.save 
c = City.new(:name => 'Capela Do Alto', :zip_code => '18.195-000', :state => state); c.save 
c = City.new(:name => 'Capivari', :zip_code => '13.360-000', :state => state); c.save 
c = City.new(:name => 'Capivari Da Mata', :zip_code => '14.508-000', :state => state); c.save 
c = City.new(:name => 'Caporanga', :zip_code => '18.915-000', :state => state); c.save 
c = City.new(:name => 'Caraguatatuba', :zip_code => '11.660-000', :state => state); c.save 
c = City.new(:name => 'Carapicuiba', :zip_code => '06.300-000', :state => state); c.save 
c = City.new(:name => 'Cardeal', :zip_code => '13.355-000', :state => state); c.save 
c = City.new(:name => 'Cardoso', :zip_code => '15.570-000', :state => state); c.save 
c = City.new(:name => 'Casa Branca', :zip_code => '13.700-000', :state => state); c.save 
c = City.new(:name => 'Cassia Dos Coqueiros', :zip_code => '14.260-000', :state => state); c.save 
c = City.new(:name => 'Castilho', :zip_code => '16.920-000', :state => state); c.save 
c = City.new(:name => 'Catanduva', :zip_code => '15.800-000', :state => state); c.save 
c = City.new(:name => 'Catigua', :zip_code => '15.870-000', :state => state); c.save 
c = City.new(:name => 'Catucaba', :zip_code => '12.150-000', :state => state); c.save 
c = City.new(:name => 'Caucaia Do Alto', :zip_code => '06.700-000', :state => state); c.save 
c = City.new(:name => 'Cedral', :zip_code => '15.895-000', :state => state); c.save 
c = City.new(:name => 'Cerqueira Cesar', :zip_code => '18.760-000', :state => state); c.save 
c = City.new(:name => 'Cerquilho', :zip_code => '18.520-000', :state => state); c.save 
c = City.new(:name => 'Cesario Lange', :zip_code => '18.285-000', :state => state); c.save 
c = City.new(:name => 'Cezar De Souza', :zip_code => '08.700-000', :state => state); c.save 
c = City.new(:name => 'Charqueada', :zip_code => '13.515-000', :state => state); c.save 
c = City.new(:name => 'Chavantes', :zip_code => '18.970-000', :state => state); c.save 
c = City.new(:name => 'Clarinia', :zip_code => '18.905-000', :state => state); c.save 
c = City.new(:name => 'Clementina', :zip_code => '16.250-000', :state => state); c.save 
c = City.new(:name => 'Colina', :zip_code => '14.770-000', :state => state); c.save 
c = City.new(:name => 'Colombia', :zip_code => '14.795-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Monte Alegre', :zip_code => '19.710-000', :state => state); c.save 
c = City.new(:name => 'Conchal', :zip_code => '13.835-000', :state => state); c.save 
c = City.new(:name => 'Conchas', :zip_code => '18.570-000', :state => state); c.save 
c = City.new(:name => 'Cordeiropolis', :zip_code => '13.490-000', :state => state); c.save 
c = City.new(:name => 'Coroados', :zip_code => '16.260-000', :state => state); c.save 
c = City.new(:name => 'Coronel Goulart', :zip_code => '19.165-000', :state => state); c.save 
c = City.new(:name => 'Coronel Macedo', :zip_code => '18.745-000', :state => state); c.save 
c = City.new(:name => 'Corredeira', :zip_code => '16.610-000', :state => state); c.save 
c = City.new(:name => 'Corrego Rico', :zip_code => '14.896-000', :state => state); c.save 
c = City.new(:name => 'Corumbatai', :zip_code => '13.540-000', :state => state); c.save 
c = City.new(:name => 'Cosmopolis', :zip_code => '13.150-000', :state => state); c.save 
c = City.new(:name => 'Cosmorama', :zip_code => '15.530-000', :state => state); c.save 
c = City.new(:name => 'Costa Machado', :zip_code => '19.265-000', :state => state); c.save 
c = City.new(:name => 'Cotia', :zip_code => '06.700-000', :state => state); c.save 
c = City.new(:name => 'Cravinhos', :zip_code => '14.140-000', :state => state); c.save 
c = City.new(:name => 'Cristais Paulista', :zip_code => '14.460-000', :state => state); c.save 
c = City.new(:name => 'Cruz Das Posses', :zip_code => '14.179-000', :state => state); c.save 
c = City.new(:name => 'Cruzalia', :zip_code => '19.860-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro', :zip_code => '12.700-000', :state => state); c.save 
c = City.new(:name => 'Cubatao', :zip_code => '11.500-000', :state => state); c.save 
c = City.new(:name => 'Cuiaba Paulista', :zip_code => '19.270-000', :state => state); c.save 
c = City.new(:name => 'Cunha', :zip_code => '12.530-000', :state => state); c.save 
c = City.new(:name => 'Curupa', :zip_code => '14.915-000', :state => state); c.save 
c = City.new(:name => 'Dalas', :zip_code => '15.725-000', :state => state); c.save 
c = City.new(:name => 'Descalvado', :zip_code => '13.690-000', :state => state); c.save 
c = City.new(:name => 'Diadema', :zip_code => '09.900-000', :state => state); c.save 
c = City.new(:name => 'Dirce Reis', :zip_code => '15.715-000', :state => state); c.save 
c = City.new(:name => 'Dirceu', :zip_code => '17.537-000', :state => state); c.save 
c = City.new(:name => 'Divinolandia', :zip_code => '13.780-000', :state => state); c.save 
c = City.new(:name => 'Dobrada', :zip_code => '15.980-000', :state => state); c.save 
c = City.new(:name => 'Dois Corregos', :zip_code => '17.300-000', :state => state); c.save 
c = City.new(:name => 'Dolcinopolis', :zip_code => '15.740-000', :state => state); c.save 
c = City.new(:name => 'Domelia', :zip_code => '17.123-000', :state => state); c.save 
c = City.new(:name => 'Dourado', :zip_code => '13.590-000', :state => state); c.save 
c = City.new(:name => 'Dracena', :zip_code => '17.900-000', :state => state); c.save 
c = City.new(:name => 'Duartina', :zip_code => '17.470-000', :state => state); c.save 
c = City.new(:name => 'Dumont', :zip_code => '14.120-000', :state => state); c.save 
c = City.new(:name => 'Duplo Ceu', :zip_code => '15.472-000', :state => state); c.save 
c = City.new(:name => 'Echapora', :zip_code => '19.830-000', :state => state); c.save 
c = City.new(:name => 'Eden', :zip_code => '18.103-000', :state => state); c.save 
c = City.new(:name => 'Eldorado', :zip_code => '11.960-000', :state => state); c.save 
c = City.new(:name => 'Eleuterio', :zip_code => '13.988-000', :state => state); c.save 
c = City.new(:name => 'Elias Fausto', :zip_code => '13.350-000', :state => state); c.save 
c = City.new(:name => 'Elisiario', :zip_code => '15.823-000', :state => state); c.save 
c = City.new(:name => 'Embauba', :zip_code => '15.425-000', :state => state); c.save 
c = City.new(:name => 'Embu', :zip_code => '06.800-000', :state => state); c.save 
c = City.new(:name => 'Embu-guacu', :zip_code => '06.900-000', :state => state); c.save 
c = City.new(:name => 'Emilianopolis', :zip_code => '19.350-000', :state => state); c.save 
c = City.new(:name => 'Eneida', :zip_code => '19.130-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Balduino', :zip_code => '15.154-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Coelho', :zip_code => '13.165-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Schmidt', :zip_code => '15.104-000', :state => state); c.save 
c = City.new(:name => 'Esmeralda', :zip_code => '15.795-000', :state => state); c.save 
c = City.new(:name => 'Esperanca Doeste', :zip_code => '19.535-000', :state => state); c.save 
c = City.new(:name => 'Espigao', :zip_code => '19.575-000', :state => state); c.save 
c = City.new(:name => 'Espirito Santo Do Pinhal', :zip_code => '13.990-000', :state => state); c.save 
c = City.new(:name => 'Espirito Santo Do Turvo', :zip_code => '18.935-000', :state => state); c.save 
c = City.new(:name => 'Estiva Gerbi', :zip_code => '13.857-000', :state => state); c.save 
c = City.new(:name => 'Estrela Doeste', :zip_code => '15.650-000', :state => state); c.save 
c = City.new(:name => 'Estrela Do Norte', :zip_code => '19.230-000', :state => state); c.save 
c = City.new(:name => 'Euclides Da Cunha Paulista', :zip_code => '19.275-000', :state => state); c.save 
c = City.new(:name => 'Eugenio De Melo', :zip_code => '12.200-000', :state => state); c.save 
c = City.new(:name => 'Fartura', :zip_code => '18.870-000', :state => state); c.save 
c = City.new(:name => 'Fatima', :zip_code => '16.490-000', :state => state); c.save 
c = City.new(:name => 'Fatima Paulista', :zip_code => '15.757-000', :state => state); c.save 
c = City.new(:name => 'Fernando Prestes', :zip_code => '15.940-000', :state => state); c.save 
c = City.new(:name => 'Fernandopolis', :zip_code => '15.600-000', :state => state); c.save 
c = City.new(:name => 'Fernao', :zip_code => '17.455-000', :state => state); c.save 
c = City.new(:name => 'Ferraz De Vasconcelos', :zip_code => '08.500-000', :state => state); c.save 
c = City.new(:name => 'Flora Rica', :zip_code => '17.870-000', :state => state); c.save 
c = City.new(:name => 'Floreal', :zip_code => '15.320-000', :state => state); c.save 
c = City.new(:name => 'Floresta Do Sul', :zip_code => '19.120-000', :state => state); c.save 
c = City.new(:name => 'Florida Paulista', :zip_code => '17.830-000', :state => state); c.save 
c = City.new(:name => 'Florinea', :zip_code => '19.870-000', :state => state); c.save 
c = City.new(:name => 'Franca', :zip_code => '14.400-000', :state => state); c.save 
c = City.new(:name => 'Francisco Morato', :zip_code => '07.900-000', :state => state); c.save 
c = City.new(:name => 'Franco Da Rocha', :zip_code => '07.800-000', :state => state); c.save 
c = City.new(:name => 'Frutal Do Campo', :zip_code => '19.885-000', :state => state); c.save 
c = City.new(:name => 'Gabriel Monteiro', :zip_code => '16.220-000', :state => state); c.save 
c = City.new(:name => 'Galia', :zip_code => '17.450-000', :state => state); c.save 
c = City.new(:name => 'Garca', :zip_code => '17.400-000', :state => state); c.save 
c = City.new(:name => 'Gardenia', :zip_code => '19.620-000', :state => state); c.save 
c = City.new(:name => 'Gastao Vidigal', :zip_code => '15.330-000', :state => state); c.save 
c = City.new(:name => 'Gaviao Peixoto', :zip_code => '14.813-000', :state => state); c.save 
c = City.new(:name => 'General Salgado', :zip_code => '15.300-000', :state => state); c.save 
c = City.new(:name => 'Getulina', :zip_code => '16.450-000', :state => state); c.save 
c = City.new(:name => 'Glicerio', :zip_code => '16.270-000', :state => state); c.save 
c = City.new(:name => 'Gramadinho', :zip_code => '18.218-000', :state => state); c.save 
c = City.new(:name => 'Guachos', :zip_code => '19.510-000', :state => state); c.save 
c = City.new(:name => 'Guaianas', :zip_code => '17.285-000', :state => state); c.save 
c = City.new(:name => 'Guaicara', :zip_code => '16.430-000', :state => state); c.save 
c = City.new(:name => 'Guaimbe', :zip_code => '16.480-000', :state => state); c.save 
c = City.new(:name => 'Guaira', :zip_code => '14.790-000', :state => state); c.save 
c = City.new(:name => 'Guamium', :zip_code => '13.431-000', :state => state); c.save 
c = City.new(:name => 'Guapiacu', :zip_code => '15.110-000', :state => state); c.save 
c = City.new(:name => 'Guapiara', :zip_code => '18.310-000', :state => state); c.save 
c = City.new(:name => 'Guapiranga', :zip_code => '16.420-000', :state => state); c.save 
c = City.new(:name => 'Guara', :zip_code => '14.580-000', :state => state); c.save 
c = City.new(:name => 'Guaracai', :zip_code => '16.980-000', :state => state); c.save 
c = City.new(:name => 'Guaraci', :zip_code => '15.420-000', :state => state); c.save 
c = City.new(:name => 'Guaraciaba Doeste', :zip_code => '17.935-000', :state => state); c.save 
c = City.new(:name => 'Guarani Doeste', :zip_code => '15.680-000', :state => state); c.save 
c = City.new(:name => 'Guaranta', :zip_code => '16.570-000', :state => state); c.save 
c = City.new(:name => 'Guarapiranga', :zip_code => '13.585-000', :state => state); c.save 
c = City.new(:name => 'Guarapua', :zip_code => '17.310-000', :state => state); c.save 
c = City.new(:name => 'Guararapes', :zip_code => '16.700-000', :state => state); c.save 
c = City.new(:name => 'Guararema', :zip_code => '08.900-000', :state => state); c.save 
c = City.new(:name => 'Guaratingueta', :zip_code => '12.500-000', :state => state); c.save 
c = City.new(:name => 'Guarei', :zip_code => '18.250-000', :state => state); c.save 
c = City.new(:name => 'Guariba', :zip_code => '14.840-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz Do Guaricanga', :zip_code => '16.675-000', :state => state); c.save 
c = City.new(:name => 'Guariroba', :zip_code => '15.903-000', :state => state); c.save 
c = City.new(:name => 'Guarizinho', :zip_code => '18.420-000', :state => state); c.save 
c = City.new(:name => 'Guaruja', :zip_code => '11.400-000', :state => state); c.save 
c = City.new(:name => 'Guarulhos', :zip_code => '07.000-000', :state => state); c.save 
c = City.new(:name => 'Guzolandia', :zip_code => '15.355-000', :state => state); c.save 
c = City.new(:name => 'Herculandia', :zip_code => '17.650-000', :state => state); c.save 
c = City.new(:name => 'Holambra', :zip_code => '13.825-000', :state => state); c.save 
c = City.new(:name => 'Hortolandia', :zip_code => '13.183-000', :state => state); c.save 
c = City.new(:name => 'Iacanga', :zip_code => '17.180-000', :state => state); c.save 
c = City.new(:name => 'Iacri', :zip_code => '17.680-000', :state => state); c.save 
c = City.new(:name => 'Iaras', :zip_code => '18.775-000', :state => state); c.save 
c = City.new(:name => 'Ibate', :zip_code => '14.815-000', :state => state); c.save 
c = City.new(:name => 'Ibiporanga', :zip_code => '15.175-000', :state => state); c.save 
c = City.new(:name => 'Ibira', :zip_code => '15.860-000', :state => state); c.save 
c = City.new(:name => 'Ibirarema', :zip_code => '19.940-000', :state => state); c.save 
c = City.new(:name => 'Ibitinga', :zip_code => '14.940-000', :state => state); c.save 
c = City.new(:name => 'Ibitiruna', :zip_code => '13.434-000', :state => state); c.save 
c = City.new(:name => 'Ibitiuva', :zip_code => '14.760-000', :state => state); c.save 
c = City.new(:name => 'Ibitu', :zip_code => '14.789-000', :state => state); c.save 
c = City.new(:name => 'Ibiuna', :zip_code => '18.150-000', :state => state); c.save 
c = City.new(:name => 'Icem', :zip_code => '15.460-000', :state => state); c.save 
c = City.new(:name => 'Ida Iolanda', :zip_code => '15.195-000', :state => state); c.save 
c = City.new(:name => 'Iepe', :zip_code => '19.640-000', :state => state); c.save 
c = City.new(:name => 'Igacaba', :zip_code => '14.475-000', :state => state); c.save 
c = City.new(:name => 'Igaracu Do Tiete', :zip_code => '17.350-000', :state => state); c.save 
c = City.new(:name => 'Igarai', :zip_code => '13.750-000', :state => state); c.save 
c = City.new(:name => 'Igarapava', :zip_code => '14.540-000', :state => state); c.save 
c = City.new(:name => 'Igarata', :zip_code => '12.350-000', :state => state); c.save 
c = City.new(:name => 'Iguape', :zip_code => '11.920-000', :state => state); c.save 
c = City.new(:name => 'Ilha Solteira', :zip_code => '15.385-000', :state => state); c.save 
c = City.new(:name => 'Ilhabela', :zip_code => '11.630-000', :state => state); c.save 
c = City.new(:name => 'Indaia Do Aguapei', :zip_code => '17.835-000', :state => state); c.save 
c = City.new(:name => 'Indaiatuba', :zip_code => '13.330-000', :state => state); c.save 
c = City.new(:name => 'Indiana', :zip_code => '19.560-000', :state => state); c.save 
c = City.new(:name => 'Indiapora', :zip_code => '15.690-000', :state => state); c.save 
c = City.new(:name => 'Ingas', :zip_code => '15.448-000', :state => state); c.save 
c = City.new(:name => 'Inubia Paulista', :zip_code => '17.760-000', :state => state); c.save 
c = City.new(:name => 'Ipaussu', :zip_code => '18.950-000', :state => state); c.save 
c = City.new(:name => 'Ipero', :zip_code => '18.560-000', :state => state); c.save 
c = City.new(:name => 'Ipeuna', :zip_code => '13.537-000', :state => state); c.save 
c = City.new(:name => 'Ipigua', :zip_code => '15.108-000', :state => state); c.save 
c = City.new(:name => 'Iporanga', :zip_code => '18.330-000', :state => state); c.save 
c = City.new(:name => 'Ipua', :zip_code => '14.610-000', :state => state); c.save 
c = City.new(:name => 'Iracemapolis', :zip_code => '13.495-000', :state => state); c.save 
c = City.new(:name => 'Irape', :zip_code => '18.980-000', :state => state); c.save 
c = City.new(:name => 'Irapua', :zip_code => '14.990-000', :state => state); c.save 
c = City.new(:name => 'Irapuru', :zip_code => '17.880-000', :state => state); c.save 
c = City.new(:name => 'Itabera', :zip_code => '18.440-000', :state => state); c.save 
c = City.new(:name => 'Itai', :zip_code => '18.730-000', :state => state); c.save 
c = City.new(:name => 'Itaiuba', :zip_code => '15.153-000', :state => state); c.save 
c = City.new(:name => 'Itajobi', :zip_code => '15.840-000', :state => state); c.save 
c = City.new(:name => 'Itaju', :zip_code => '17.260-000', :state => state); c.save 
c = City.new(:name => 'Itanhaem', :zip_code => '11.740-000', :state => state); c.save 
c = City.new(:name => 'Itaoca', :zip_code => '18.360-000', :state => state); c.save 
c = City.new(:name => 'Itapecerica Da Serra', :zip_code => '06.850-000', :state => state); c.save 
c = City.new(:name => 'Itapetininga', :zip_code => '18.200-000', :state => state); c.save 
c = City.new(:name => 'Itapeuna', :zip_code => '11.970-000', :state => state); c.save 
c = City.new(:name => 'Itapeva', :zip_code => '18.400-000', :state => state); c.save 
c = City.new(:name => 'Itapevi', :zip_code => '06.650-000', :state => state); c.save 
c = City.new(:name => 'Itapira', :zip_code => '13.970-000', :state => state); c.save 
c = City.new(:name => 'Itapirapua Paulista', :zip_code => '18.385-000', :state => state); c.save 
c = City.new(:name => 'Itapolis', :zip_code => '14.900-000', :state => state); c.save 
c = City.new(:name => 'Itaporanga', :zip_code => '18.480-000', :state => state); c.save 
c = City.new(:name => 'Itapui', :zip_code => '17.230-000', :state => state); c.save 
c = City.new(:name => 'Itapura', :zip_code => '15.390-000', :state => state); c.save 
c = City.new(:name => 'Itaquaquecetuba', :zip_code => '08.570-000', :state => state); c.save 
c = City.new(:name => 'Itaqueri Da Serra', :zip_code => '13.535-000', :state => state); c.save 
c = City.new(:name => 'Itarare', :zip_code => '18.460-000', :state => state); c.save 
c = City.new(:name => 'Itariri', :zip_code => '11.760-000', :state => state); c.save 
c = City.new(:name => 'Itatiba', :zip_code => '13.250-000', :state => state); c.save 
c = City.new(:name => 'Itatinga', :zip_code => '18.690-000', :state => state); c.save 
c = City.new(:name => 'Itirapina', :zip_code => '13.530-000', :state => state); c.save 
c = City.new(:name => 'Itirapua', :zip_code => '14.420-000', :state => state); c.save 
c = City.new(:name => 'Itobi', :zip_code => '13.715-000', :state => state); c.save 
c = City.new(:name => 'Itororo Do Paranapanema', :zip_code => '19.208-000', :state => state); c.save 
c = City.new(:name => 'Itu', :zip_code => '13.300-000', :state => state); c.save 
c = City.new(:name => 'Itupeva', :zip_code => '13.295-000', :state => state); c.save 
c = City.new(:name => 'Ituverava', :zip_code => '14.500-000', :state => state); c.save 
c = City.new(:name => 'Iubatinga', :zip_code => '19.540-000', :state => state); c.save 
c = City.new(:name => 'Jaborandi', :zip_code => '14.775-000', :state => state); c.save 
c = City.new(:name => 'Jaboticabal', :zip_code => '14.870-000', :state => state); c.save 
c = City.new(:name => 'Jacarei', :zip_code => '12.300-000', :state => state); c.save 
c = City.new(:name => 'Jaci', :zip_code => '15.155-000', :state => state); c.save 
c = City.new(:name => 'Jacipora', :zip_code => '17.910-000', :state => state); c.save 
c = City.new(:name => 'Jacuba', :zip_code => '17.170-000', :state => state); c.save 
c = City.new(:name => 'Jacupiranga', :zip_code => '11.940-000', :state => state); c.save 
c = City.new(:name => 'Jafa', :zip_code => '17.405-000', :state => state); c.save 
c = City.new(:name => 'Jaguariuna', :zip_code => '13.820-000', :state => state); c.save 
c = City.new(:name => 'Jales', :zip_code => '15.700-000', :state => state); c.save 
c = City.new(:name => 'Jamaica', :zip_code => '17.905-000', :state => state); c.save 
c = City.new(:name => 'Jambeiro', :zip_code => '12.270-000', :state => state); c.save 
c = City.new(:name => 'Jandira', :zip_code => '06.600-000', :state => state); c.save 
c = City.new(:name => 'Jardim Belval', :zip_code => '06.400-000', :state => state); c.save 
c = City.new(:name => 'Jardim Presidente Dutra', :zip_code => '07.000-000', :state => state); c.save 
c = City.new(:name => 'Jardim Silveira', :zip_code => '06.400-000', :state => state); c.save 
c = City.new(:name => 'Jardinopolis', :zip_code => '14.680-000', :state => state); c.save 
c = City.new(:name => 'Jarinu', :zip_code => '13.240-000', :state => state); c.save 
c = City.new(:name => 'Jatoba', :zip_code => '16.330-000', :state => state); c.save 
c = City.new(:name => 'Jau', :zip_code => '17.200-000', :state => state); c.save 
c = City.new(:name => 'Jeriquara', :zip_code => '14.450-000', :state => state); c.save 
c = City.new(:name => 'Joanopolis', :zip_code => '12.980-000', :state => state); c.save 
c = City.new(:name => 'Joao Ramalho', :zip_code => '19.680-000', :state => state); c.save 
c = City.new(:name => 'Joaquim Egidio', :zip_code => '13.000-000', :state => state); c.save 
c = City.new(:name => 'Jordanesia', :zip_code => '07.760-000', :state => state); c.save 
c = City.new(:name => 'Jose Bonifacio', :zip_code => '15.200-000', :state => state); c.save 
c = City.new(:name => 'Juliania', :zip_code => '17.660-000', :state => state); c.save 
c = City.new(:name => 'Julio Mesquita', :zip_code => '17.550-000', :state => state); c.save 
c = City.new(:name => 'Jumirim', :zip_code => '18.535-000', :state => state); c.save 
c = City.new(:name => 'Jundiai', :zip_code => '13.200-000', :state => state); c.save 
c = City.new(:name => 'Jundiapeba', :zip_code => '08.700-000', :state => state); c.save 
c = City.new(:name => 'Junqueira', :zip_code => '15.152-000', :state => state); c.save 
c = City.new(:name => 'Junqueiropolis', :zip_code => '17.890-000', :state => state); c.save 
c = City.new(:name => 'Juquia', :zip_code => '11.800-000', :state => state); c.save 
c = City.new(:name => 'Juquiratiba', :zip_code => '18.575-000', :state => state); c.save 
c = City.new(:name => 'Juquitiba', :zip_code => '06.950-000', :state => state); c.save 
c = City.new(:name => 'Juritis', :zip_code => '16.280-000', :state => state); c.save 
c = City.new(:name => 'Juruce', :zip_code => '14.690-000', :state => state); c.save 
c = City.new(:name => 'Jurupeba', :zip_code => '15.475-000', :state => state); c.save 
c = City.new(:name => 'Jurupema', :zip_code => '15.905-000', :state => state); c.save 
c = City.new(:name => 'Lacio', :zip_code => '17.539-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Azul', :zip_code => '17.705-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Branca', :zip_code => '13.705-000', :state => state); c.save 
c = City.new(:name => 'Lagoinha', :zip_code => '12.130-000', :state => state); c.save 
c = City.new(:name => 'Laranjal Paulista', :zip_code => '18.500-000', :state => state); c.save 
c = City.new(:name => 'Laras', :zip_code => '18.505-000', :state => state); c.save 
c = City.new(:name => 'Lauro Penteado', :zip_code => '16.255-000', :state => state); c.save 
c = City.new(:name => 'Lavinia', :zip_code => '16.850-000', :state => state); c.save 
c = City.new(:name => 'Lavrinhas', :zip_code => '12.760-000', :state => state); c.save 
c = City.new(:name => 'Leme', :zip_code => '13.610-000', :state => state); c.save 
c = City.new(:name => 'Lencois Paulista', :zip_code => '18.680-000', :state => state); c.save 
c = City.new(:name => 'Limeira', :zip_code => '13.480-000', :state => state); c.save 
c = City.new(:name => 'Lindoia', :zip_code => '13.950-000', :state => state); c.save 
c = City.new(:name => 'Lins', :zip_code => '16.400-000', :state => state); c.save 
c = City.new(:name => 'Lobo', :zip_code => '18.695-000', :state => state); c.save 
c = City.new(:name => 'Lorena', :zip_code => '12.600-000', :state => state); c.save 
c = City.new(:name => 'Lourdes', :zip_code => '15.285-000', :state => state); c.save 
c = City.new(:name => 'Louveira', :zip_code => '13.290-000', :state => state); c.save 
c = City.new(:name => 'Lucelia', :zip_code => '17.780-000', :state => state); c.save 
c = City.new(:name => 'Lucianopolis', :zip_code => '17.475-000', :state => state); c.save 
c = City.new(:name => 'Luis Antonio', :zip_code => '14.210-000', :state => state); c.save 
c = City.new(:name => 'Luiziania', :zip_code => '16.340-000', :state => state); c.save 
c = City.new(:name => 'Lupercio', :zip_code => '17.420-000', :state => state); c.save 
c = City.new(:name => 'Lusitania', :zip_code => '14.898-000', :state => state); c.save 
c = City.new(:name => 'Lutecia', :zip_code => '19.750-000', :state => state); c.save 
c = City.new(:name => 'Macatuba', :zip_code => '17.290-000', :state => state); c.save 
c = City.new(:name => 'Macaubal', :zip_code => '15.270-000', :state => state); c.save 
c = City.new(:name => 'Macedonia', :zip_code => '15.620-000', :state => state); c.save 
c = City.new(:name => 'Macucos', :zip_code => '16.460-000', :state => state); c.save 
c = City.new(:name => 'Magda', :zip_code => '15.310-000', :state => state); c.save 
c = City.new(:name => 'Mailasqui', :zip_code => '18.143-000', :state => state); c.save 
c = City.new(:name => 'Mairinque', :zip_code => '18.120-000', :state => state); c.save 
c = City.new(:name => 'Mairipora', :zip_code => '07.600-000', :state => state); c.save 
c = City.new(:name => 'Manduri', :zip_code => '18.780-000', :state => state); c.save 
c = City.new(:name => 'Mangaratu', :zip_code => '15.442-000', :state => state); c.save 
c = City.new(:name => 'Maraba Paulista', :zip_code => '19.430-000', :state => state); c.save 
c = City.new(:name => 'Maracai', :zip_code => '19.840-000', :state => state); c.save 
c = City.new(:name => 'Marapoama', :zip_code => '15.845-000', :state => state); c.save 
c = City.new(:name => 'Marcondesia', :zip_code => '14.733-000', :state => state); c.save 
c = City.new(:name => 'Maresias', :zip_code => '11.620-000', :state => state); c.save 
c = City.new(:name => 'Mariapolis', :zip_code => '17.810-000', :state => state); c.save 
c = City.new(:name => 'Marilia', :zip_code => '17.500-000', :state => state); c.save 
c = City.new(:name => 'Marinopolis', :zip_code => '15.730-000', :state => state); c.save 
c = City.new(:name => 'Maristela', :zip_code => '18.510-000', :state => state); c.save 
c = City.new(:name => 'Martim Francisco', :zip_code => '13.817-000', :state => state); c.save 
c = City.new(:name => 'Martinho Prado Junior', :zip_code => '13.855-000', :state => state); c.save 
c = City.new(:name => 'Martinopolis', :zip_code => '19.500-000', :state => state); c.save 
c = City.new(:name => 'Matao', :zip_code => '15.990-000', :state => state); c.save 
c = City.new(:name => 'Maua', :zip_code => '09.300-000', :state => state); c.save 
c = City.new(:name => 'Mendonca', :zip_code => '15.220-000', :state => state); c.save 
c = City.new(:name => 'Meridiano', :zip_code => '15.625-000', :state => state); c.save 
c = City.new(:name => 'Mesopolis', :zip_code => '15.748-000', :state => state); c.save 
c = City.new(:name => 'Miguelopolis', :zip_code => '14.530-000', :state => state); c.save 
c = City.new(:name => 'Mineiros Do Tiete', :zip_code => '17.320-000', :state => state); c.save 
c = City.new(:name => 'Mira Estrela', :zip_code => '15.580-000', :state => state); c.save 
c = City.new(:name => 'Miracatu', :zip_code => '11.850-000', :state => state); c.save 
c = City.new(:name => 'Miraluz', :zip_code => '15.128-000', :state => state); c.save 
c = City.new(:name => 'Mirandopolis', :zip_code => '16.800-000', :state => state); c.save 
c = City.new(:name => 'Mirante Do Paranapanema', :zip_code => '19.260-000', :state => state); c.save 
c = City.new(:name => 'Mirassol', :zip_code => '15.130-000', :state => state); c.save 
c = City.new(:name => 'Mirassolandia', :zip_code => '15.145-000', :state => state); c.save 
c = City.new(:name => 'Mococa', :zip_code => '13.730-000', :state => state); c.save 
c = City.new(:name => 'Mogi Das Cruzes', :zip_code => '08.700-000', :state => state); c.save 
c = City.new(:name => 'Mogi-guacu', :zip_code => '13.840-000', :state => state); c.save 
c = City.new(:name => 'Mogi-mirim', :zip_code => '13.800-000', :state => state); c.save 
c = City.new(:name => 'Mombuca', :zip_code => '13.380-000', :state => state); c.save 
c = City.new(:name => 'Moncoes', :zip_code => '15.275-000', :state => state); c.save 
c = City.new(:name => 'Mongagua', :zip_code => '11.730-000', :state => state); c.save 
c = City.new(:name => 'Montalvao', :zip_code => '19.110-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre Do Sul', :zip_code => '13.910-000', :state => state); c.save 
c = City.new(:name => 'Monte Alto', :zip_code => '15.910-000', :state => state); c.save 
c = City.new(:name => 'Monte Aprazivel', :zip_code => '15.150-000', :state => state); c.save 
c = City.new(:name => 'Monte Azul Paulista', :zip_code => '14.730-000', :state => state); c.save 
c = City.new(:name => 'Monte Castelo', :zip_code => '17.960-000', :state => state); c.save 
c = City.new(:name => 'Monte Mor', :zip_code => '13.190-000', :state => state); c.save 
c = City.new(:name => 'Monte Verde Paulista', :zip_code => '15.417-000', :state => state); c.save 
c = City.new(:name => 'Monteiro Lobato', :zip_code => '12.250-000', :state => state); c.save 
c = City.new(:name => 'Moreira Cesar', :zip_code => '12.400-000', :state => state); c.save 
c = City.new(:name => 'Morro Agudo', :zip_code => '14.640-000', :state => state); c.save 
c = City.new(:name => 'Morro Do Alto', :zip_code => '18.219-000', :state => state); c.save 
c = City.new(:name => 'Morungaba', :zip_code => '13.260-000', :state => state); c.save 
c = City.new(:name => 'Mostardas', :zip_code => '13.915-000', :state => state); c.save 
c = City.new(:name => 'Motuca', :zip_code => '14.835-000', :state => state); c.save 
c = City.new(:name => 'Mourao', :zip_code => '17.815-000', :state => state); c.save 
c = City.new(:name => 'Murutinga Do Sul', :zip_code => '16.950-000', :state => state); c.save 
c = City.new(:name => 'Nantes', :zip_code => '19.645-000', :state => state); c.save 
c = City.new(:name => 'Narandiba', :zip_code => '19.220-000', :state => state); c.save 
c = City.new(:name => 'Natividade Da Serra', :zip_code => '12.180-000', :state => state); c.save 
c = City.new(:name => 'Nazare Paulista', :zip_code => '12.960-000', :state => state); c.save 
c = City.new(:name => 'Neves Paulista', :zip_code => '15.120-000', :state => state); c.save 
c = City.new(:name => 'Nhandeara', :zip_code => '15.190-000', :state => state); c.save 
c = City.new(:name => 'Nipoa', :zip_code => '15.240-000', :state => state); c.save 
c = City.new(:name => 'Nogueira', :zip_code => '16.690-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Remedio', :zip_code => '08.980-000', :state => state); c.save 
c = City.new(:name => 'Nova Alexandria', :zip_code => '19.882-000', :state => state); c.save 
c = City.new(:name => 'Nova Alianca', :zip_code => '15.210-000', :state => state); c.save 
c = City.new(:name => 'Nova America', :zip_code => '14.904-000', :state => state); c.save 
c = City.new(:name => 'Nova Aparecida', :zip_code => '13.000-000', :state => state); c.save 
c = City.new(:name => 'Nova Canaa Paulista', :zip_code => '15.773-000', :state => state); c.save 
c = City.new(:name => 'Nova Castilho', :zip_code => '15.313-000', :state => state); c.save 
c = City.new(:name => 'Nova Europa', :zip_code => '14.920-000', :state => state); c.save 
c = City.new(:name => 'Nova Granada', :zip_code => '15.440-000', :state => state); c.save 
c = City.new(:name => 'Nova Guataporanga', :zip_code => '17.950-000', :state => state); c.save 
c = City.new(:name => 'Nova Independencia', :zip_code => '16.940-000', :state => state); c.save 
c = City.new(:name => 'Nova Itapirema', :zip_code => '15.215-000', :state => state); c.save 
c = City.new(:name => 'Nova Luzitania', :zip_code => '15.340-000', :state => state); c.save 
c = City.new(:name => 'Nova Odessa', :zip_code => '13.460-000', :state => state); c.save 
c = City.new(:name => 'Nova Patria', :zip_code => '19.330-000', :state => state); c.save 
c = City.new(:name => 'Nova Veneza', :zip_code => '13.170-000', :state => state); c.save 
c = City.new(:name => 'Novais', :zip_code => '15.885-000', :state => state); c.save 
c = City.new(:name => 'Novo Cravinhos', :zip_code => '17.585-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '14.960-000', :state => state); c.save 
c = City.new(:name => 'Nuporanga', :zip_code => '14.670-000', :state => state); c.save 
c = City.new(:name => 'Oasis', :zip_code => '17.932-000', :state => state); c.save 
c = City.new(:name => 'Ocaucu', :zip_code => '17.540-000', :state => state); c.save 
c = City.new(:name => 'Oleo', :zip_code => '18.790-000', :state => state); c.save 
c = City.new(:name => 'Olimpia', :zip_code => '15.400-000', :state => state); c.save 
c = City.new(:name => 'Onda Branca', :zip_code => '15.445-000', :state => state); c.save 
c = City.new(:name => 'Onda Verde', :zip_code => '15.450-000', :state => state); c.save 
c = City.new(:name => 'Oriente', :zip_code => '17.570-000', :state => state); c.save 
c = City.new(:name => 'Orindiuva', :zip_code => '15.480-000', :state => state); c.save 
c = City.new(:name => 'Orlandia', :zip_code => '14.620-000', :state => state); c.save 
c = City.new(:name => 'Osasco', :zip_code => '06.000-000', :state => state); c.save 
c = City.new(:name => 'Oscar Bressane', :zip_code => '19.770-000', :state => state); c.save 
c = City.new(:name => 'Osvaldo Cruz', :zip_code => '17.700-000', :state => state); c.save 
c = City.new(:name => 'Ourinhos', :zip_code => '19.900-000', :state => state); c.save 
c = City.new(:name => 'Ouro Fino Paulista', :zip_code => '09.400-000', :state => state); c.save 
c = City.new(:name => 'Ouro Verde', :zip_code => '17.920-000', :state => state); c.save 
c = City.new(:name => 'Pacaembu', :zip_code => '17.860-000', :state => state); c.save 
c = City.new(:name => 'Padre Nobrega', :zip_code => '17.533-000', :state => state); c.save 
c = City.new(:name => 'Palestina', :zip_code => '15.470-000', :state => state); c.save 
c = City.new(:name => 'Palmares Paulista', :zip_code => '15.828-000', :state => state); c.save 
c = City.new(:name => 'Palmeira Doeste', :zip_code => '15.720-000', :state => state); c.save 
c = City.new(:name => 'Palmeiras De Sao Paulo', :zip_code => '08.600-000', :state => state); c.save 
c = City.new(:name => 'Palmital', :zip_code => '19.970-000', :state => state); c.save 
c = City.new(:name => 'Panorama', :zip_code => '17.980-000', :state => state); c.save 
c = City.new(:name => 'Paraguacu Paulista', :zip_code => '19.700-000', :state => state); c.save 
c = City.new(:name => 'Paraibuna', :zip_code => '12.260-000', :state => state); c.save 
c = City.new(:name => 'Paraiso', :zip_code => '15.825-000', :state => state); c.save 
c = City.new(:name => 'Paraisolandia', :zip_code => '13.517-000', :state => state); c.save 
c = City.new(:name => 'Paranabi', :zip_code => '11.650-000', :state => state); c.save 
c = City.new(:name => 'Paranapanema', :zip_code => '18.720-000', :state => state); c.save 
c = City.new(:name => 'Paranapiacaba', :zip_code => '09.000-000', :state => state); c.save 
c = City.new(:name => 'Paranapua', :zip_code => '15.745-000', :state => state); c.save 
c = City.new(:name => 'Parapua', :zip_code => '17.730-000', :state => state); c.save 
c = City.new(:name => 'Pardinho', :zip_code => '18.640-000', :state => state); c.save 
c = City.new(:name => 'Pariquera-acu', :zip_code => '11.930-000', :state => state); c.save 
c = City.new(:name => 'Parisi', :zip_code => '15.525-000', :state => state); c.save 
c = City.new(:name => 'Parnaso', :zip_code => '17.620-000', :state => state); c.save 
c = City.new(:name => 'Parque Meia Lua', :zip_code => '12.300-000', :state => state); c.save 
c = City.new(:name => 'Paruru', :zip_code => '18.155-000', :state => state); c.save 
c = City.new(:name => 'Patrocinio Paulista', :zip_code => '14.415-000', :state => state); c.save 
c = City.new(:name => 'Pauliceia', :zip_code => '17.990-000', :state => state); c.save 
c = City.new(:name => 'Paulinia', :zip_code => '13.140-000', :state => state); c.save 
c = City.new(:name => 'Paulistania', :zip_code => '17.150-000', :state => state); c.save 
c = City.new(:name => 'Paulo De Faria', :zip_code => '15.490-000', :state => state); c.save 
c = City.new(:name => 'Paulopolis', :zip_code => '17.583-000', :state => state); c.save 
c = City.new(:name => 'Pederneiras', :zip_code => '17.280-000', :state => state); c.save 
c = City.new(:name => 'Pedra Bela', :zip_code => '12.990-000', :state => state); c.save 
c = City.new(:name => 'Pedranopolis', :zip_code => '15.630-000', :state => state); c.save 
c = City.new(:name => 'Pedregulho', :zip_code => '14.470-000', :state => state); c.save 
c = City.new(:name => 'Pedreira', :zip_code => '13.920-000', :state => state); c.save 
c = City.new(:name => 'Pedrinhas Paulista', :zip_code => '19.865-000', :state => state); c.save 
c = City.new(:name => 'Pedro Barros', :zip_code => '11.855-000', :state => state); c.save 
c = City.new(:name => 'Pedro De Toledo', :zip_code => '11.790-000', :state => state); c.save 
c = City.new(:name => 'Penapolis', :zip_code => '16.300-000', :state => state); c.save 
c = City.new(:name => 'Pereira Barreto', :zip_code => '15.370-000', :state => state); c.save 
c = City.new(:name => 'Pereiras', :zip_code => '18.580-000', :state => state); c.save 
c = City.new(:name => 'Peruibe', :zip_code => '11.750-000', :state => state); c.save 
c = City.new(:name => 'Piacatu', :zip_code => '16.230-000', :state => state); c.save 
c = City.new(:name => 'Picinguaba', :zip_code => '11.690-000', :state => state); c.save 
c = City.new(:name => 'Piedade', :zip_code => '18.170-000', :state => state); c.save 
c = City.new(:name => 'Pilar Do Sul', :zip_code => '18.185-000', :state => state); c.save 
c = City.new(:name => 'Pindamonhangaba', :zip_code => '12.400-000', :state => state); c.save 
c = City.new(:name => 'Pindorama', :zip_code => '15.830-000', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '12.995-000', :state => state); c.save 
c = City.new(:name => 'Pinheiros', :zip_code => '12.770-000', :state => state); c.save 
c = City.new(:name => 'Pioneiros', :zip_code => '14.590-000', :state => state); c.save 
c = City.new(:name => 'Piquerobi', :zip_code => '19.410-000', :state => state); c.save 
c = City.new(:name => 'Piquete', :zip_code => '12.620-000', :state => state); c.save 
c = City.new(:name => 'Piracaia', :zip_code => '12.970-000', :state => state); c.save 
c = City.new(:name => 'Piracicaba', :zip_code => '13.400-000', :state => state); c.save 
c = City.new(:name => 'Piraju', :zip_code => '18.800-000', :state => state); c.save 
c = City.new(:name => 'Pirajui', :zip_code => '16.600-000', :state => state); c.save 
c = City.new(:name => 'Piramboia', :zip_code => '18.630-000', :state => state); c.save 
c = City.new(:name => 'Pirangi', :zip_code => '15.820-000', :state => state); c.save 
c = City.new(:name => 'Pirapitingui', :zip_code => '13.300-000', :state => state); c.save 
c = City.new(:name => 'Pirapora Do Bom Jesus', :zip_code => '06.550-000', :state => state); c.save 
c = City.new(:name => 'Pirapozinho', :zip_code => '19.200-000', :state => state); c.save 
c = City.new(:name => 'Pirassununga', :zip_code => '13.630-000', :state => state); c.save 
c = City.new(:name => 'Piratininga', :zip_code => '17.490-000', :state => state); c.save 
c = City.new(:name => 'Pitangueiras', :zip_code => '14.750-000', :state => state); c.save 
c = City.new(:name => 'Planalto', :zip_code => '15.260-000', :state => state); c.save 
c = City.new(:name => 'Platina', :zip_code => '19.990-000', :state => state); c.save 
c = City.new(:name => 'Poa', :zip_code => '08.550-000', :state => state); c.save 
c = City.new(:name => 'Poloni', :zip_code => '15.160-000', :state => state); c.save 
c = City.new(:name => 'Polvilho', :zip_code => '07.770-000', :state => state); c.save 
c = City.new(:name => 'Pompeia', :zip_code => '17.580-000', :state => state); c.save 
c = City.new(:name => 'Pongai', :zip_code => '16.660-000', :state => state); c.save 
c = City.new(:name => 'Pontal', :zip_code => '14.180-000', :state => state); c.save 
c = City.new(:name => 'Pontalinda', :zip_code => '15.718-000', :state => state); c.save 
c = City.new(:name => 'Pontes Gestal', :zip_code => '15.560-000', :state => state); c.save 
c = City.new(:name => 'Populina', :zip_code => '15.670-000', :state => state); c.save 
c = City.new(:name => 'Porangaba', :zip_code => '18.260-000', :state => state); c.save 
c = City.new(:name => 'Porto Feliz', :zip_code => '18.540-000', :state => state); c.save 
c = City.new(:name => 'Porto Ferreira', :zip_code => '13.660-000', :state => state); c.save 
c = City.new(:name => 'Porto Novo', :zip_code => '11.660-000', :state => state); c.save 
c = City.new(:name => 'Primavera', :zip_code => '19.274-000', :state => state); c.save 
c = City.new(:name => 'Potim', :zip_code => '12.525-000', :state => state); c.save 
c = City.new(:name => 'Potirendaba', :zip_code => '15.105-000', :state => state); c.save 
c = City.new(:name => 'Potunduva', :zip_code => '17.220-000', :state => state); c.save 
c = City.new(:name => 'Pracinha', :zip_code => '17.790-000', :state => state); c.save 
c = City.new(:name => 'Pradinia', :zip_code => '16.606-000', :state => state); c.save 
c = City.new(:name => 'Pradopolis', :zip_code => '14.850-000', :state => state); c.save 
c = City.new(:name => 'Praia Grande', :zip_code => '11.700-000', :state => state); c.save 
c = City.new(:name => 'Pratania', :zip_code => '18.660-000', :state => state); c.save 
c = City.new(:name => 'Presidente Alves', :zip_code => '16.670-000', :state => state); c.save 
c = City.new(:name => 'Presidente Bernardes', :zip_code => '19.300-000', :state => state); c.save 
c = City.new(:name => 'Presidente Epitacio', :zip_code => '19.470-000', :state => state); c.save 
c = City.new(:name => 'Presidente Prudente', :zip_code => '19.000-000', :state => state); c.save 
c = City.new(:name => 'Presidente Venceslau', :zip_code => '19.400-000', :state => state); c.save 
c = City.new(:name => 'Promissao', :zip_code => '16.370-000', :state => state); c.save 
c = City.new(:name => 'Prudencio E Moraes', :zip_code => '15.307-000', :state => state); c.save 
c = City.new(:name => 'Quadra', :zip_code => '18.255-000', :state => state); c.save 
c = City.new(:name => 'Quata', :zip_code => '19.780-000', :state => state); c.save 
c = City.new(:name => 'Guatapara', :zip_code => '14.115-000', :state => state); c.save 
c = City.new(:name => 'Queiroz', :zip_code => '17.590-000', :state => state); c.save 
c = City.new(:name => 'Queluz', :zip_code => '12.800-000', :state => state); c.save 
c = City.new(:name => 'Quintana', :zip_code => '17.670-000', :state => state); c.save 
c = City.new(:name => 'Quiririm', :zip_code => '12.000-000', :state => state); c.save 
c = City.new(:name => 'Rafard', :zip_code => '13.370-000', :state => state); c.save 
c = City.new(:name => 'Rancharia', :zip_code => '19.600-000', :state => state); c.save 
c = City.new(:name => 'Rechan', :zip_code => '18.217-000', :state => state); c.save 
c = City.new(:name => 'Redencao Da Serra', :zip_code => '12.170-000', :state => state); c.save 
c = City.new(:name => 'Regente Feijo', :zip_code => '19.570-000', :state => state); c.save 
c = City.new(:name => 'Reginopolis', :zip_code => '17.190-000', :state => state); c.save 
c = City.new(:name => 'Registro', :zip_code => '11.900-000', :state => state); c.save 
c = City.new(:name => 'Restinga', :zip_code => '14.430-000', :state => state); c.save 
c = City.new(:name => 'Riacho Grande', :zip_code => '09.700-000', :state => state); c.save 
c = City.new(:name => 'Ribeira', :zip_code => '18.380-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Bonito', :zip_code => '13.580-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Branco', :zip_code => '18.430-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Corrente', :zip_code => '14.445-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Do Sul', :zip_code => '19.930-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Dos Indios', :zip_code => '19.380-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Grande', :zip_code => '18.315-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Pires', :zip_code => '09.400-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Preto', :zip_code => '14.000-000', :state => state); c.save 
c = City.new(:name => 'Ribeiro Do Vale', :zip_code => '16.710-000', :state => state); c.save 
c = City.new(:name => 'Ribeiro Dos Santos', :zip_code => '15.408-000', :state => state); c.save 
c = City.new(:name => 'Rifaina', :zip_code => '14.490-000', :state => state); c.save 
c = City.new(:name => 'Rincao', :zip_code => '14.830-000', :state => state); c.save 
c = City.new(:name => 'Rinopolis', :zip_code => '17.740-000', :state => state); c.save 
c = City.new(:name => 'Rio Claro', :zip_code => '13.500-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Pedras', :zip_code => '13.390-000', :state => state); c.save 
c = City.new(:name => 'Rio Grande Da Serra', :zip_code => '09.450-000', :state => state); c.save 
c = City.new(:name => 'Riolandia', :zip_code => '15.495-000', :state => state); c.save 
c = City.new(:name => 'Riversul', :zip_code => '18.470-000', :state => state); c.save 
c = City.new(:name => 'Roberto', :zip_code => '15.835-000', :state => state); c.save 
c = City.new(:name => 'Rosalia', :zip_code => '17.535-000', :state => state); c.save 
c = City.new(:name => 'Rosana', :zip_code => '19.273-000', :state => state); c.save 
c = City.new(:name => 'Roseira', :zip_code => '12.580-000', :state => state); c.save 
c = City.new(:name => 'Rubiacea', :zip_code => '16.750-000', :state => state); c.save 
c = City.new(:name => 'Rubiao Junior', :zip_code => '18.618-000', :state => state); c.save 
c = City.new(:name => 'Rubineia', :zip_code => '15.790-000', :state => state); c.save 
c = City.new(:name => 'Ruilandia', :zip_code => '15.135-000', :state => state); c.save 
c = City.new(:name => 'Sabauna', :zip_code => '08.700-000', :state => state); c.save 
c = City.new(:name => 'Sabino', :zip_code => '16.440-000', :state => state); c.save 
c = City.new(:name => 'Sagres', :zip_code => '17.710-000', :state => state); c.save 
c = City.new(:name => 'Sales', :zip_code => '14.980-000', :state => state); c.save 
c = City.new(:name => 'Sales Oliveira', :zip_code => '14.660-000', :state => state); c.save 
c = City.new(:name => 'Salesopolis', :zip_code => '08.970-000', :state => state); c.save 
c = City.new(:name => 'Salmourao', :zip_code => '17.720-000', :state => state); c.save 
c = City.new(:name => 'Saltinho', :zip_code => '13.440-000', :state => state); c.save 
c = City.new(:name => 'Salto', :zip_code => '13.320-000', :state => state); c.save 
c = City.new(:name => 'Salto De Pirapora', :zip_code => '18.160-000', :state => state); c.save 
c = City.new(:name => 'Salto Do Avanhandava', :zip_code => '15.208-000', :state => state); c.save 
c = City.new(:name => 'Salto Grande', :zip_code => '19.920-000', :state => state); c.save 
c = City.new(:name => 'Sandovalina', :zip_code => '19.250-000', :state => state); c.save 
c = City.new(:name => 'Santa Adelia', :zip_code => '15.950-000', :state => state); c.save 
c = City.new(:name => 'Santa Albertina', :zip_code => '15.750-000', :state => state); c.save 
c = City.new(:name => 'Santa America', :zip_code => '16.455-000', :state => state); c.save 
c = City.new(:name => 'Santa Barbara Doeste', :zip_code => '13.450-000', :state => state); c.save 
c = City.new(:name => 'Santa Branca', :zip_code => '12.380-000', :state => state); c.save 
c = City.new(:name => 'Santa Clara Doeste', :zip_code => '15.785-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Da Conceicao', :zip_code => '13.625-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Da Esperanca', :zip_code => '14.250-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Da Estrela', :zip_code => '13.675-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Das Palmeiras', :zip_code => '13.650-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Rio Pardo', :zip_code => '18.900-000', :state => state); c.save 
c = City.new(:name => 'Santa Ernestina', :zip_code => '15.970-000', :state => state); c.save 
c = City.new(:name => 'Santa Eudoxia', :zip_code => '13.579-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe Do Sul', :zip_code => '15.775-000', :state => state); c.save 
c = City.new(:name => 'Santa Gertrudes', :zip_code => '13.510-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel', :zip_code => '07.500-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel Do Marinheiro', :zip_code => '15.635-000', :state => state); c.save 
c = City.new(:name => 'Santa Lucia', :zip_code => '14.825-000', :state => state); c.save 
c = City.new(:name => 'Santa Margarida Paulista', :zip_code => '08.500-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Da Serra', :zip_code => '17.370-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Gurupa', :zip_code => '16.380-000', :state => state); c.save 
c = City.new(:name => 'Santa Mercedes', :zip_code => '17.940-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Doeste', :zip_code => '15.780-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Passa Quatro', :zip_code => '13.670-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Ribeira', :zip_code => '11.870-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa De Viterbo', :zip_code => '14.270-000', :state => state); c.save 
c = City.new(:name => 'Santa Salete', :zip_code => '15.768-000', :state => state); c.save 
c = City.new(:name => 'Santa Teresinha De Piracicaba', :zip_code => '13.400-000', :state => state); c.save 
c = City.new(:name => 'Santana Da Ponte Pensa', :zip_code => '15.765-000', :state => state); c.save 
c = City.new(:name => 'Santana De Parnaiba', :zip_code => '06.500-000', :state => state); c.save 
c = City.new(:name => 'Santelmo', :zip_code => '17.288-000', :state => state); c.save 
c = City.new(:name => 'Santo Anastacio', :zip_code => '19.360-000', :state => state); c.save 
c = City.new(:name => 'Santo Andre', :zip_code => '09.000-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Alegria', :zip_code => '14.390-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Estiva', :zip_code => '16.603-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio De Posse', :zip_code => '13.830-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Aracangua', :zip_code => '16.130-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Jardim', :zip_code => '13.995-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Paranapanema', :zip_code => '19.890-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Pinhal', :zip_code => '12.450-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Paulista', :zip_code => '08.500-000', :state => state); c.save 
c = City.new(:name => 'Santo Expedito', :zip_code => '19.190-000', :state => state); c.save 
c = City.new(:name => 'Santopolis Do Aguapei', :zip_code => '16.240-000', :state => state); c.save 
c = City.new(:name => 'Santos', :zip_code => '11.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Benedito Da Cachoeirinha', :zip_code => '14.505-000', :state => state); c.save 
c = City.new(:name => 'Sao Benedito Das Areias', :zip_code => '13.755-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento Do Sapucai', :zip_code => '12.490-000', :state => state); c.save 
c = City.new(:name => 'Sao Bernardo Do Campo', :zip_code => '09.700-000', :state => state); c.save 
c = City.new(:name => 'Sao Berto', :zip_code => '18.785-000', :state => state); c.save 
c = City.new(:name => 'Sao Caetano Do Sul', :zip_code => '09.500-000', :state => state); c.save 
c = City.new(:name => 'Sao Carlos', :zip_code => '13.560-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '15.710-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Da Praia', :zip_code => '11.610-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Xavier', :zip_code => '12.249-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Boa Vista', :zip_code => '13.870-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Das Duas Pontes', :zip_code => '15.640-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Iracema', :zip_code => '15.315-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Itaguacu', :zip_code => '15.855-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Marinheiro', :zip_code => '15.575-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Pau Dalho', :zip_code => '17.970-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Novo', :zip_code => '18.140-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim Da Barra', :zip_code => '14.600-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Bela Vista', :zip_code => '14.440-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Das Laranjeiras', :zip_code => '19.845-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Barreiro', :zip_code => '12.830-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Rio Pardo', :zip_code => '13.720-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Rio Preto', :zip_code => '15.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Campos', :zip_code => '12.200-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco Da Serra', :zip_code => '06.890-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco Do Turvo', :zip_code => '15.999-000', :state => state); c.save 
c = City.new(:name => 'Sao Luis Do Paraitinga', :zip_code => '12.140-000', :state => state); c.save 
c = City.new(:name => 'Sao Manuel', :zip_code => '18.650-000', :state => state); c.save 
c = City.new(:name => 'Sao Martinho Doeste', :zip_code => '16.320-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Arcanjo', :zip_code => '18.230-000', :state => state); c.save 
c = City.new(:name => 'Sao Paulo', :zip_code => '01.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '13.520-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Turvo', :zip_code => '18.940-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque', :zip_code => '18.130-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque Da Fartura', :zip_code => '13.895-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '11.600-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Grama', :zip_code => '13.790-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Serra', :zip_code => '17.390-000', :state => state); c.save 
c = City.new(:name => 'Sao Silvestre De Jacarei', :zip_code => '12.300-000', :state => state); c.save 
c = City.new(:name => 'Sao Simao', :zip_code => '14.200-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '11.300-000', :state => state); c.save 
c = City.new(:name => 'Sapezal', :zip_code => '19.720-000', :state => state); c.save 
c = City.new(:name => 'Sarapui', :zip_code => '18.225-000', :state => state); c.save 
c = City.new(:name => 'Sarutaia', :zip_code => '18.840-000', :state => state); c.save 
c = City.new(:name => 'Sebastianopolis Do Sul', :zip_code => '15.180-000', :state => state); c.save 
c = City.new(:name => 'Serra Azul', :zip_code => '14.230-000', :state => state); c.save 
c = City.new(:name => 'Serra Negra', :zip_code => '13.930-000', :state => state); c.save 
c = City.new(:name => 'Serrana', :zip_code => '14.150-000', :state => state); c.save 
c = City.new(:name => 'Sertaozinho', :zip_code => '14.160-000', :state => state); c.save 
c = City.new(:name => 'Sete Barras', :zip_code => '11.910-000', :state => state); c.save 
c = City.new(:name => 'Severinia', :zip_code => '14.735-000', :state => state); c.save 
c = City.new(:name => 'Silveiras', :zip_code => '12.690-000', :state => state); c.save 
c = City.new(:name => 'Simoes', :zip_code => '16.510-000', :state => state); c.save 
c = City.new(:name => 'Simonsen', :zip_code => '15.515-000', :state => state); c.save 
c = City.new(:name => 'Socorro', :zip_code => '13.960-000', :state => state); c.save 
c = City.new(:name => 'Sodrelia', :zip_code => '18.910-000', :state => state); c.save 
c = City.new(:name => 'Solemar', :zip_code => '11.700-000', :state => state); c.save 
c = City.new(:name => 'Sorocaba', :zip_code => '18.000-000', :state => state); c.save 
c = City.new(:name => 'Sousas', :zip_code => '13.000-000', :state => state); c.save 
c = City.new(:name => 'Sud Mennucci', :zip_code => '15.360-000', :state => state); c.save 
c = City.new(:name => 'Sumare', :zip_code => '13.170-000', :state => state); c.save 
c = City.new(:name => 'Suzanapolis', :zip_code => '15.380-000', :state => state); c.save 
c = City.new(:name => 'Sussui', :zip_code => '19.975-000', :state => state); c.save 
c = City.new(:name => 'Suzano', :zip_code => '08.600-000', :state => state); c.save 
c = City.new(:name => 'Tabajara', :zip_code => '16.855-000', :state => state); c.save 
c = City.new(:name => 'Tabapua', :zip_code => '15.880-000', :state => state); c.save 
c = City.new(:name => 'Tabatinga', :zip_code => '14.910-000', :state => state); c.save 
c = City.new(:name => 'Taboao Da Serra', :zip_code => '06.750-000', :state => state); c.save 
c = City.new(:name => 'Taciba', :zip_code => '19.590-000', :state => state); c.save 
c = City.new(:name => 'Taguai', :zip_code => '18.890-000', :state => state); c.save 
c = City.new(:name => 'Taiacu', :zip_code => '14.725-000', :state => state); c.save 
c = City.new(:name => 'Taiacupeba', :zip_code => '08.700-000', :state => state); c.save 
c = City.new(:name => 'Taiuva', :zip_code => '14.720-000', :state => state); c.save 
c = City.new(:name => 'Talhado', :zip_code => '15.102-000', :state => state); c.save 
c = City.new(:name => 'Tambau', :zip_code => '13.710-000', :state => state); c.save 
c = City.new(:name => 'Tanabi', :zip_code => '15.170-000', :state => state); c.save 
c = City.new(:name => 'Tapinas', :zip_code => '14.907-000', :state => state); c.save 
c = City.new(:name => 'Tapirai', :zip_code => '18.180-000', :state => state); c.save 
c = City.new(:name => 'Tapiratiba', :zip_code => '13.760-000', :state => state); c.save 
c = City.new(:name => 'Taquaral', :zip_code => '14.765-000', :state => state); c.save 
c = City.new(:name => 'Taquaritinga', :zip_code => '15.900-000', :state => state); c.save 
c = City.new(:name => 'Taquarituba', :zip_code => '18.740-000', :state => state); c.save 
c = City.new(:name => 'Taquarivai', :zip_code => '18.425-000', :state => state); c.save 
c = City.new(:name => 'Tarabai', :zip_code => '19.210-000', :state => state); c.save 
c = City.new(:name => 'Taruma', :zip_code => '19.820-000', :state => state); c.save 
c = City.new(:name => 'Tatui', :zip_code => '18.270-000', :state => state); c.save 
c = City.new(:name => 'Taubate', :zip_code => '12.000-000', :state => state); c.save 
c = City.new(:name => 'Tecainda', :zip_code => '19.505-000', :state => state); c.save 
c = City.new(:name => 'Tejupa', :zip_code => '18.830-000', :state => state); c.save 
c = City.new(:name => 'Teodoro Sampaio', :zip_code => '19.280-000', :state => state); c.save 
c = City.new(:name => 'Terra Nova Doeste', :zip_code => '17.945-000', :state => state); c.save 
c = City.new(:name => 'Terra Roxa', :zip_code => '14.745-000', :state => state); c.save 
c = City.new(:name => 'Tibirica', :zip_code => '17.110-000', :state => state); c.save 
c = City.new(:name => 'Tiete', :zip_code => '18.530-000', :state => state); c.save 
c = City.new(:name => 'Timburi', :zip_code => '18.860-000', :state => state); c.save 
c = City.new(:name => 'Torre De Pedra', :zip_code => '18.265-000', :state => state); c.save 
c = City.new(:name => 'Torrinha', :zip_code => '17.360-000', :state => state); c.save 
c = City.new(:name => 'Trabiju', :zip_code => '14.935-000', :state => state); c.save 
c = City.new(:name => 'Tremembe', :zip_code => '12.120-000', :state => state); c.save 
c = City.new(:name => 'Tres Aliancas', :zip_code => '16.830-000', :state => state); c.save 
c = City.new(:name => 'Tres Fronteiras', :zip_code => '15.770-000', :state => state); c.save 
c = City.new(:name => 'Tres Pontes', :zip_code => '13.900-000', :state => state); c.save 
c = City.new(:name => 'Tuiuti', :zip_code => '12.930-000', :state => state); c.save 
c = City.new(:name => 'Tujuguaba', :zip_code => '13.839-000', :state => state); c.save 
c = City.new(:name => 'Tupa', :zip_code => '17.600-000', :state => state); c.save 
c = City.new(:name => 'Tupi', :zip_code => '13.428-000', :state => state); c.save 
c = City.new(:name => 'Tupi Paulista', :zip_code => '17.930-000', :state => state); c.save 
c = City.new(:name => 'Turiba Do Sul', :zip_code => '18.450-000', :state => state); c.save 
c = City.new(:name => 'Turiuba', :zip_code => '15.280-000', :state => state); c.save 
c = City.new(:name => 'Turmalina', :zip_code => '15.755-000', :state => state); c.save 
c = City.new(:name => 'Turvinia', :zip_code => '14.716-000', :state => state); c.save 
c = City.new(:name => 'Ubarana', :zip_code => '15.225-000', :state => state); c.save 
c = City.new(:name => 'Ubatuba', :zip_code => '11.680-000', :state => state); c.save 
c = City.new(:name => 'Ubirajara', :zip_code => '17.440-000', :state => state); c.save 
c = City.new(:name => 'Uchoa', :zip_code => '15.890-000', :state => state); c.save 
c = City.new(:name => 'Uniao Paulista', :zip_code => '15.250-000', :state => state); c.save 
c = City.new(:name => 'Universo', :zip_code => '17.623-000', :state => state); c.save 
c = City.new(:name => 'Urania', :zip_code => '15.760-000', :state => state); c.save 
c = City.new(:name => 'Uru', :zip_code => '16.650-000', :state => state); c.save 
c = City.new(:name => 'Urupes', :zip_code => '15.850-000', :state => state); c.save 
c = City.new(:name => 'Ururai', :zip_code => '15.955-000', :state => state); c.save 
c = City.new(:name => 'Vale Formoso', :zip_code => '14.970-000', :state => state); c.save 
c = City.new(:name => 'Valentim Gentil', :zip_code => '15.520-000', :state => state); c.save 
c = City.new(:name => 'Valinhos', :zip_code => '13.270-000', :state => state); c.save 
c = City.new(:name => 'Valparaiso', :zip_code => '16.880-000', :state => state); c.save 
c = City.new(:name => 'Vangloria', :zip_code => '17.282-000', :state => state); c.save 
c = City.new(:name => 'Vargem', :zip_code => '12.935-000', :state => state); c.save 
c = City.new(:name => 'Vargem Grande Do Sul', :zip_code => '13.880-000', :state => state); c.save 
c = City.new(:name => 'Vargem Grande Paulista', :zip_code => '06.730-000', :state => state); c.save 
c = City.new(:name => 'Varpa', :zip_code => '17.625-000', :state => state); c.save 
c = City.new(:name => 'Varzea Paulista', :zip_code => '13.220-000', :state => state); c.save 
c = City.new(:name => 'Venda Branca', :zip_code => '13.707-000', :state => state); c.save 
c = City.new(:name => 'Vera Cruz', :zip_code => '17.560-000', :state => state); c.save 
c = City.new(:name => 'Vicente De Carvalho', :zip_code => '11.400-000', :state => state); c.save 
c = City.new(:name => 'Vila Nery', :zip_code => '13.560-000', :state => state); c.save 
c = City.new(:name => 'Vila Xavier', :zip_code => '14.800-000', :state => state); c.save 
c = City.new(:name => 'Vinhedo', :zip_code => '13.280-000', :state => state); c.save 
c = City.new(:name => 'Viradouro', :zip_code => '14.740-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre Do Alto', :zip_code => '15.920-000', :state => state); c.save 
c = City.new(:name => 'Vitoria Brasil', :zip_code => '15.705-000', :state => state); c.save 
c = City.new(:name => 'Vitoriana', :zip_code => '18.619-000', :state => state); c.save 
c = City.new(:name => 'Votorantim', :zip_code => '18.110-000', :state => state); c.save 
c = City.new(:name => 'Votuporanga', :zip_code => '15.500-000', :state => state); c.save 
c = City.new(:name => 'Zacarias', :zip_code => '15.265-000', :state => state); c.save 
c = City.new(:name => 'Barao De Geraldo', :zip_code => '13.000-000', :state => state); c.save 
c = City.new(:name => 'Botujuru', :zip_code => '13.230-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro Da Esperanca', :zip_code => '18.243-000', :state => state); c.save 
c = City.new(:name => 'Jacare', :zip_code => '13.318-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Dos Lopes', :zip_code => '18.468-000', :state => state); c.save 
c = City.new(:name => 'Pedra Branca De Itarare', :zip_code => '18.465-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso De Itarare', :zip_code => '18.475-000', :state => state); c.save 
c = City.new(:name => 'Oliveira Barros', :zip_code => '11.860-000', :state => state); c.save 
c = City.new(:name => 'Jardim Santa Luzia', :zip_code => '09.400-000', :state => state); c.save 
c = City.new(:name => 'Vila Dirce', :zip_code => '06.300-000', :state => state); c.save 
c = City.new(:name => 'Planalto Do Sul', :zip_code => '19.295-000', :state => state); c.save 
c = City.new(:name => 'Tibirica Do Paranapanema', :zip_code => '18.810-000', :state => state); c.save 
c = City.new(:name => 'Aparecida De Monte Alto', :zip_code => '15.915-000', :state => state); c.save 
c = City.new(:name => 'Capuava', :zip_code => '09.000-000', :state => state); c.save 
c = City.new(:name => 'Aldeia De Carapicuiba', :zip_code => '06.300-000', :state => state); c.save 
c = City.new(:name => 'Anhumas', :zip_code => '13.435-000', :state => state); c.save 
c = City.new(:name => 'Andes', :zip_code => '14.715-000', :state => state); c.save 
c = City.new(:name => 'Silvania', :zip_code => '15.990-000', :state => state); c.save 
c = City.new(:name => 'Ilha Comprida', :zip_code => '11.925-000', :state => state); c.save 
c = City.new(:name => 'Tres Vendas', :zip_code => '17.621-000', :state => state); c.save 
c = City.new(:name => 'Toledo', :zip_code => '17.627-000', :state => state); c.save 
c = City.new(:name => 'Planalto', :zip_code => '16.915-000', :state => state); c.save 
c = City.new(:name => 'Vicentinopolis', :zip_code => '16.140-000', :state => state); c.save 
c = City.new(:name => 'Major Prado', :zip_code => '16.150-000', :state => state); c.save 
c = City.new(:name => 'Utinga', :zip_code => '09.000-000', :state => state); c.save 
c = City.new(:name => 'Holambra Ii', :zip_code => '18.725-000', :state => state); c.save 
c = City.new(:name => 'Cipo-guacu', :zip_code => '06.930-000', :state => state); c.save 
c = City.new(:name => 'Caruara', :zip_code => '11.200-000', :state => state); c.save 
c = City.new(:name => 'Caibura', :zip_code => '11.210-000', :state => state); c.save 
c = City.new(:name => 'Monte Cabrao', :zip_code => '11.220-000', :state => state); c.save 
c = City.new(:name => 'Ilha Diana', :zip_code => '11.230-000', :state => state); c.save 
c = City.new(:name => 'Bandeirantes Doeste', :zip_code => '15.367-000', :state => state); c.save 
c = City.new(:name => 'Suinana', :zip_code => '15.437-000', :state => state); c.save 
c = City.new(:name => 'Ouroeste', :zip_code => '15.685-000', :state => state); c.save 
c = City.new(:name => 'Cardoso', :zip_code => '15.843-000', :state => state); c.save 
c = City.new(:name => 'Cocaes', :zip_code => '18.227-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Velha', :zip_code => '18.288-000', :state => state); c.save 
c = City.new(:name => 'Itaboa', :zip_code => '18.433-000', :state => state); c.save 
c = City.new(:name => 'Campina De Fora', :zip_code => '18.434-000', :state => state); c.save 
c = City.new(:name => 'Termas De Ibira', :zip_code => '15.868-000', :state => state); c.save 
c = City.new(:name => 'Apiai-mirim', :zip_code => '18.309-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Maia', :zip_code => '18.445-000', :state => state); c.save 

