#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Paraná')
state ||= State.create!( :name => 'Paraná', :code => 'PR', :country => country);

c = City.new(:name => 'Abapa', :zip_code => '84.185-000', :state => state); c.save 
c = City.new(:name => 'Abatia', :zip_code => '86.460-000', :state => state); c.save 
c = City.new(:name => 'Acungui', :zip_code => '83.550-000', :state => state); c.save 
c = City.new(:name => 'Adhemar De Barros', :zip_code => '87.895-000', :state => state); c.save 
c = City.new(:name => 'Adrianopolis', :zip_code => '83.490-000', :state => state); c.save 
c = City.new(:name => 'Agua Azul', :zip_code => '83.770-000', :state => state); c.save 
c = City.new(:name => 'Agua Boa', :zip_code => '87.145-000', :state => state); c.save 
c = City.new(:name => 'Agudos Do Sul', :zip_code => '83.850-000', :state => state); c.save 
c = City.new(:name => 'Alecrim', :zip_code => '84.284-000', :state => state); c.save 
c = City.new(:name => 'Alexandra', :zip_code => '83.250-000', :state => state); c.save 
c = City.new(:name => 'Almirante Tamandare', :zip_code => '83.500-000', :state => state); c.save 
c = City.new(:name => 'Altamira Do Parana', :zip_code => '85.280-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre', :zip_code => '86.695-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre Do Iguacu', :zip_code => '85.794-000', :state => state); c.save 
c = City.new(:name => 'Alto Do Amparo', :zip_code => '84.305-000', :state => state); c.save 
c = City.new(:name => 'Alto Sao Joao', :zip_code => '87.323-000', :state => state); c.save 
c = City.new(:name => 'Alto Parana', :zip_code => '87.750-000', :state => state); c.save 
c = City.new(:name => 'Alto Piquiri', :zip_code => '87.580-000', :state => state); c.save 
c = City.new(:name => 'Alto Pora', :zip_code => '86.875-000', :state => state); c.save 
c = City.new(:name => 'Alto Santa Fe', :zip_code => '85.931-000', :state => state); c.save 
c = City.new(:name => 'Altonia', :zip_code => '87.550-000', :state => state); c.save 
c = City.new(:name => 'Alvorada Do Iguacu', :zip_code => '85.872-000', :state => state); c.save 
c = City.new(:name => 'Alvorada Do Sul', :zip_code => '86.150-000', :state => state); c.save 
c = City.new(:name => 'Amapora', :zip_code => '87.850-000', :state => state); c.save 
c = City.new(:name => 'Amorinha', :zip_code => '84.910-000', :state => state); c.save 
c = City.new(:name => 'Ampere', :zip_code => '85.640-000', :state => state); c.save 
c = City.new(:name => 'Anahy', :zip_code => '85.425-000', :state => state); c.save 
c = City.new(:name => 'Andira', :zip_code => '86.380-000', :state => state); c.save 
c = City.new(:name => 'Angai', :zip_code => '84.538-000', :state => state); c.save 
c = City.new(:name => 'Angulo', :zip_code => '86.755-000', :state => state); c.save 
c = City.new(:name => 'Antonina', :zip_code => '83.370-000', :state => state); c.save 
c = City.new(:name => 'Antonio Brandao De Oliveira', :zip_code => '86.213-000', :state => state); c.save 
c = City.new(:name => 'Antonio Olinto', :zip_code => '83.980-000', :state => state); c.save 
c = City.new(:name => 'Anunciacao', :zip_code => '85.654-000', :state => state); c.save 
c = City.new(:name => 'Aparecida Do Oeste', :zip_code => '87.455-000', :state => state); c.save 
c = City.new(:name => 'Itaipulandia', :zip_code => '85.880-000', :state => state); c.save 
c = City.new(:name => 'Apiaba', :zip_code => '84.433-000', :state => state); c.save 
c = City.new(:name => 'Apucarana', :zip_code => '86.800-000', :state => state); c.save 
c = City.new(:name => 'Arapongas', :zip_code => '86.700-000', :state => state); c.save 
c = City.new(:name => 'Arapoti', :zip_code => '84.990-000', :state => state); c.save 
c = City.new(:name => 'Arapua', :zip_code => '86.884-000', :state => state); c.save 
c = City.new(:name => 'Arapuan', :zip_code => '87.385-000', :state => state); c.save 
c = City.new(:name => 'Ararapira', :zip_code => '83.393-000', :state => state); c.save 
c = City.new(:name => 'Araruna', :zip_code => '87.260-000', :state => state); c.save 
c = City.new(:name => 'Araucaria', :zip_code => '83.700-000', :state => state); c.save 
c = City.new(:name => 'Areia Branca Dos Assis', :zip_code => '83.810-000', :state => state); c.save 
c = City.new(:name => 'Ariranha Do Ivai', :zip_code => '86.880-000', :state => state); c.save 
c = City.new(:name => 'Assai', :zip_code => '86.220-000', :state => state); c.save 
c = City.new(:name => 'Assis Chateaubriand', :zip_code => '85.935-000', :state => state); c.save 
c = City.new(:name => 'Astorga', :zip_code => '86.730-000', :state => state); c.save 
c = City.new(:name => 'Atalaia', :zip_code => '87.630-000', :state => state); c.save 
c = City.new(:name => 'Aurora Do Iguacu', :zip_code => '85.878-000', :state => state); c.save 
c = City.new(:name => 'Balsa Nova', :zip_code => '83.650-000', :state => state); c.save 
c = City.new(:name => 'Bandeirantes', :zip_code => '86.360-000', :state => state); c.save 
c = City.new(:name => 'Bandeirantes Doeste', :zip_code => '87.368-000', :state => state); c.save 
c = City.new(:name => 'Barao De Lucena', :zip_code => '87.610-000', :state => state); c.save 
c = City.new(:name => 'Barbosa Ferraz', :zip_code => '86.960-000', :state => state); c.save 
c = City.new(:name => 'Barra Bonita', :zip_code => '85.245-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Jacare', :zip_code => '86.385-000', :state => state); c.save 
c = City.new(:name => 'Barra Grande', :zip_code => '85.584-000', :state => state); c.save 
c = City.new(:name => 'Barra Grande', :zip_code => '85.752-000', :state => state); c.save 
c = City.new(:name => 'Barra Santa Salete', :zip_code => '85.265-000', :state => state); c.save 
c = City.new(:name => 'Barracao', :zip_code => '85.700-000', :state => state); c.save 
c = City.new(:name => 'Porto Barreiro', :zip_code => '85.345-000', :state => state); c.save 
c = City.new(:name => 'Barreiro', :zip_code => '84.380-000', :state => state); c.save 
c = City.new(:name => 'Bateias', :zip_code => '83.648-000', :state => state); c.save 
c = City.new(:name => 'Baulandia', :zip_code => '85.613-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '85.406-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Caroba', :zip_code => '85.745-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Ivai', :zip_code => '86.953-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Paraiso', :zip_code => '86.130-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Piquiri', :zip_code => '87.347-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Tapiracui', :zip_code => '87.440-000', :state => state); c.save 
c = City.new(:name => 'Bentopolis', :zip_code => '86.625-000', :state => state); c.save 
c = City.new(:name => 'Bituruna', :zip_code => '84.640-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '87.390-000', :state => state); c.save 
c = City.new(:name => 'Esperanca Nova', :zip_code => '87.545-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca Do Iguacu', :zip_code => '85.680-000', :state => state); c.save 
c = City.new(:name => 'Boa Ventura De Sao Roque', :zip_code => '85.225-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista Da Aparecida', :zip_code => '85.780-000', :state => state); c.save 
c = City.new(:name => 'Bocaiuva Do Sul', :zip_code => '83.450-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim Do Sul', :zip_code => '84.465-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Sul', :zip_code => '85.708-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro', :zip_code => '85.175-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso', :zip_code => '86.940-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso Do Sul', :zip_code => '85.515-000', :state => state); c.save 
c = City.new(:name => 'Borda Do Campo', :zip_code => '83.425-000', :state => state); c.save 
c = City.new(:name => 'Borman', :zip_code => '85.405-000', :state => state); c.save 
c = City.new(:name => 'Borrazopolis', :zip_code => '86.925-000', :state => state); c.save 
c = City.new(:name => 'Bourbonia', :zip_code => '86.963-000', :state => state); c.save 
c = City.new(:name => 'Braganey', :zip_code => '85.430-000', :state => state); c.save 
c = City.new(:name => 'Bragantina', :zip_code => '85.937-000', :state => state); c.save 
c = City.new(:name => 'Brasilandia Do Sul', :zip_code => '87.595-000', :state => state); c.save 
c = City.new(:name => 'Bugre', :zip_code => '83.660-000', :state => state); c.save 
c = City.new(:name => 'Cacatu', :zip_code => '83.375-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Cima', :zip_code => '83.380-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Sao Jose', :zip_code => '83.181-000', :state => state); c.save 
c = City.new(:name => 'Cafeara', :zip_code => '86.640-000', :state => state); c.save 
c = City.new(:name => 'Cafeeiros', :zip_code => '87.405-000', :state => state); c.save 
c = City.new(:name => 'Cafelandia', :zip_code => '85.415-000', :state => state); c.save 
c = City.new(:name => 'Cafezal Do Sul', :zip_code => '87.565-000', :state => state); c.save 
c = City.new(:name => 'Caita', :zip_code => '83.920-000', :state => state); c.save 
c = City.new(:name => 'California', :zip_code => '86.820-000', :state => state); c.save 
c = City.new(:name => 'Calogeras', :zip_code => '84.995-000', :state => state); c.save 
c = City.new(:name => 'Cambara', :zip_code => '86.390-000', :state => state); c.save 
c = City.new(:name => 'Cambe', :zip_code => '86.180-000', :state => state); c.save 
c = City.new(:name => 'Cambira', :zip_code => '86.890-000', :state => state); c.save 
c = City.new(:name => 'Campina Da Lagoa', :zip_code => '87.345-000', :state => state); c.save 
c = City.new(:name => 'Campina Do Simao', :zip_code => '85.148-000', :state => state); c.save 
c = City.new(:name => 'Campina Grande Do Sul', :zip_code => '83.430-000', :state => state); c.save 
c = City.new(:name => 'Campo Bonito', :zip_code => '85.450-000', :state => state); c.save 
c = City.new(:name => 'Campo Do Tenente', :zip_code => '83.870-000', :state => state); c.save 
c = City.new(:name => 'Campo Largo', :zip_code => '83.600-000', :state => state); c.save 
c = City.new(:name => 'Campo Largo Da Roseira', :zip_code => '83.183-000', :state => state); c.save 
c = City.new(:name => 'Campo Magro', :zip_code => '83.535-000', :state => state); c.save 
c = City.new(:name => 'Campo Mourao', :zip_code => '87.300-000', :state => state); c.save 
c = City.new(:name => 'Candido De Abreu', :zip_code => '84.470-000', :state => state); c.save 
c = City.new(:name => 'Candoi', :zip_code => '85.140-000', :state => state); c.save 
c = City.new(:name => 'Canela', :zip_code => '85.612-000', :state => state); c.save 
c = City.new(:name => 'Cantagalo', :zip_code => '85.160-000', :state => state); c.save 
c = City.new(:name => 'Canzianopolis', :zip_code => '85.735-000', :state => state); c.save 
c = City.new(:name => 'Capanema', :zip_code => '85.760-000', :state => state); c.save 
c = City.new(:name => 'Capitao Leonidas Marques', :zip_code => '85.790-000', :state => state); c.save 
c = City.new(:name => 'Caraja', :zip_code => '85.837-000', :state => state); c.save 
c = City.new(:name => 'Carambei', :zip_code => '84.145-000', :state => state); c.save 
c = City.new(:name => 'Caratuva', :zip_code => '84.998-000', :state => state); c.save 
c = City.new(:name => 'Carbonera', :zip_code => '87.483-000', :state => state); c.save 
c = City.new(:name => 'Carlopolis', :zip_code => '86.420-000', :state => state); c.save 
c = City.new(:name => 'Cascavel', :zip_code => '85.800-000', :state => state); c.save 
c = City.new(:name => 'Castro', :zip_code => '84.160-000', :state => state); c.save 
c = City.new(:name => 'Catanduvas', :zip_code => '85.470-000', :state => state); c.save 
c = City.new(:name => 'Catanduvas Do Sul', :zip_code => '83.740-000', :state => state); c.save 
c = City.new(:name => 'Centenario Do Sul', :zip_code => '86.630-000', :state => state); c.save 
c = City.new(:name => 'Centro Novo', :zip_code => '85.754-000', :state => state); c.save 
c = City.new(:name => 'Cerro Azul', :zip_code => '83.570-000', :state => state); c.save 
c = City.new(:name => 'Ceu Azul', :zip_code => '85.840-000', :state => state); c.save 
c = City.new(:name => 'Chopinzinho', :zip_code => '85.560-000', :state => state); c.save 
c = City.new(:name => 'Cianorte', :zip_code => '87.200-000', :state => state); c.save 
c = City.new(:name => 'Cidade Gaucha', :zip_code => '87.820-000', :state => state); c.save 
c = City.new(:name => 'Cintra Pimentel', :zip_code => '87.975-000', :state => state); c.save 
c = City.new(:name => 'Clevelandia', :zip_code => '85.530-000', :state => state); c.save 
c = City.new(:name => 'Colombo', :zip_code => '83.400-000', :state => state); c.save 
c = City.new(:name => 'Colonia Murici', :zip_code => '83.185-000', :state => state); c.save 
c = City.new(:name => 'Colonia Padre Paulo', :zip_code => '83.855-000', :state => state); c.save 
c = City.new(:name => 'Colorado', :zip_code => '86.690-000', :state => state); c.save 
c = City.new(:name => 'Comur', :zip_code => '87.870-000', :state => state); c.save 
c = City.new(:name => 'Conciolandia', :zip_code => '85.743-000', :state => state); c.save 
c = City.new(:name => 'Congonhas', :zip_code => '86.305-000', :state => state); c.save 
c = City.new(:name => 'Congonhinhas', :zip_code => '86.320-000', :state => state); c.save 
c = City.new(:name => 'Conselheiro Mairinck', :zip_code => '86.480-000', :state => state); c.save 
c = City.new(:name => 'Conselheiro Zacarias', :zip_code => '86.440-000', :state => state); c.save 
c = City.new(:name => 'Contenda', :zip_code => '83.730-000', :state => state); c.save 
c = City.new(:name => 'Copacabana Do Norte', :zip_code => '87.195-000', :state => state); c.save 
c = City.new(:name => 'Corbelia', :zip_code => '85.420-000', :state => state); c.save 
c = City.new(:name => 'Cornelio Procopio', :zip_code => '86.300-000', :state => state); c.save 
c = City.new(:name => 'Coronel Domingos Soares', :zip_code => '85.557-000', :state => state); c.save 
c = City.new(:name => 'Coronel Firmino Martins', :zip_code => '85.536-000', :state => state); c.save 
c = City.new(:name => 'Coronel Vivida', :zip_code => '85.550-000', :state => state); c.save 
c = City.new(:name => 'Correia De Freitas', :zip_code => '86.816-000', :state => state); c.save 
c = City.new(:name => 'Corumbatai Do Sul', :zip_code => '86.970-000', :state => state); c.save 
c = City.new(:name => 'Covo', :zip_code => '85.545-000', :state => state); c.save 
c = City.new(:name => 'Coxilha Rica', :zip_code => '85.582-000', :state => state); c.save 
c = City.new(:name => 'Cristo Rei', :zip_code => '85.763-000', :state => state); c.save 
c = City.new(:name => 'Cristo Rei', :zip_code => '87.728-000', :state => state); c.save 
c = City.new(:name => 'Cruzmaltina', :zip_code => '86.855-000', :state => state); c.save 
c = City.new(:name => 'Cruz Machado', :zip_code => '84.620-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Do Iguacu', :zip_code => '85.598-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Do Norte', :zip_code => '86.285-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Do Oeste', :zip_code => '87.400-000', :state => state); c.save 
c = City.new(:name => 'Cruzeiro Do Sul', :zip_code => '87.650-000', :state => state); c.save 
c = City.new(:name => 'Curitiba', :zip_code => '80.000-000', :state => state); c.save 
c = City.new(:name => 'Curiuva', :zip_code => '84.280-000', :state => state); c.save 
c = City.new(:name => 'Deputado Jose Afonso', :zip_code => '87.726-000', :state => state); c.save 
c = City.new(:name => 'Dez De Maio', :zip_code => '85.920-000', :state => state); c.save 
c = City.new(:name => 'Diamante Do Sul', :zip_code => '85.408-000', :state => state); c.save 
c = City.new(:name => 'Diamante Do Norte', :zip_code => '87.990-000', :state => state); c.save 
c = City.new(:name => 'Diamante Doeste', :zip_code => '85.896-000', :state => state); c.save 
c = City.new(:name => 'Doce Grande', :zip_code => '83.843-000', :state => state); c.save 
c = City.new(:name => 'Dois Irmaos', :zip_code => '85.571-000', :state => state); c.save 
c = City.new(:name => 'Dois Irmaos', :zip_code => '85.923-000', :state => state); c.save 
c = City.new(:name => 'Dois Vizinhos', :zip_code => '85.660-000', :state => state); c.save 
c = City.new(:name => 'Dorizon', :zip_code => '84.574-000', :state => state); c.save 
c = City.new(:name => 'Douradina', :zip_code => '87.485-000', :state => state); c.save 
c = City.new(:name => 'Doutor Antonio Paranhos', :zip_code => '85.579-000', :state => state); c.save 
c = City.new(:name => 'Doutor Camargo', :zip_code => '87.155-000', :state => state); c.save 
c = City.new(:name => 'Doutor Oliveira Castro', :zip_code => '85.985-000', :state => state); c.save 
c = City.new(:name => 'Eduardo Xavier Da Silva', :zip_code => '84.210-000', :state => state); c.save 
c = City.new(:name => 'Encantado Doeste', :zip_code => '85.936-000', :state => state); c.save 
c = City.new(:name => 'Eneas Marques', :zip_code => '85.630-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Beltrao', :zip_code => '87.270-000', :state => state); c.save 
c = City.new(:name => 'Entre Rios', :zip_code => '85.108-000', :state => state); c.save 
c = City.new(:name => 'Entre Rios Do Oeste', :zip_code => '85.988-000', :state => state); c.save 
c = City.new(:name => 'Esperanca Do Norte', :zip_code => '86.155-000', :state => state); c.save 
c = City.new(:name => 'Espigao Alto Do Iguacu', :zip_code => '85.465-000', :state => state); c.save 
c = City.new(:name => 'Euzebio De Oliveira', :zip_code => '84.912-000', :state => state); c.save 
c = City.new(:name => 'Farol', :zip_code => '87.325-000', :state => state); c.save 
c = City.new(:name => 'Faxinal', :zip_code => '86.840-000', :state => state); c.save 
c = City.new(:name => 'Faxinal Do Ceu', :zip_code => '85.180-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Rio Grande', :zip_code => '83.820-000', :state => state); c.save 
c = City.new(:name => 'Fenix', :zip_code => '86.950-000', :state => state); c.save 
c = City.new(:name => 'Fernandes Pinheiro', :zip_code => '84.535-000', :state => state); c.save 
c = City.new(:name => 'Fernao Dias', :zip_code => '86.765-000', :state => state); c.save 
c = City.new(:name => 'Ferraria', :zip_code => '83.644-000', :state => state); c.save 
c = City.new(:name => 'Figueira', :zip_code => '84.285-000', :state => state); c.save 
c = City.new(:name => 'Flor Da Serra', :zip_code => '85.886-000', :state => state); c.save 
c = City.new(:name => 'Flor Da Serra Do Sul', :zip_code => '85.618-000', :state => state); c.save 
c = City.new(:name => 'Florai', :zip_code => '87.185-000', :state => state); c.save 
c = City.new(:name => 'Floresta', :zip_code => '87.120-000', :state => state); c.save 
c = City.new(:name => 'Florestopolis', :zip_code => '86.165-000', :state => state); c.save 
c = City.new(:name => 'Floriano', :zip_code => '87.105-000', :state => state); c.save 
c = City.new(:name => 'Florida', :zip_code => '86.780-000', :state => state); c.save 
c = City.new(:name => 'Fluviopolis', :zip_code => '83.930-000', :state => state); c.save 
c = City.new(:name => 'Formosa Do Oeste', :zip_code => '85.830-000', :state => state); c.save 
c = City.new(:name => 'Foz Do Iguacu', :zip_code => '85.850-000', :state => state); c.save 
c = City.new(:name => 'Francisco Alves', :zip_code => '87.570-000', :state => state); c.save 
c = City.new(:name => 'Francisco Beltrao', :zip_code => '85.600-000', :state => state); c.save 
c = City.new(:name => 'Francisco Frederico Teixeira Guimaraes', :zip_code => '85.556-000', :state => state); c.save 
c = City.new(:name => 'Frei Timoteo', :zip_code => '86.215-000', :state => state); c.save 
c = City.new(:name => 'Gaviao', :zip_code => '85.678-000', :state => state); c.save 
c = City.new(:name => 'General Carneiro', :zip_code => '84.660-000', :state => state); c.save 
c = City.new(:name => 'Geremia Lunardelli', :zip_code => '87.333-000', :state => state); c.save 
c = City.new(:name => 'Godoy Moreira', :zip_code => '86.938-000', :state => state); c.save 
c = City.new(:name => 'Goioere', :zip_code => '87.360-000', :state => state); c.save 
c = City.new(:name => 'Goioxim', :zip_code => '85.162-000', :state => state); c.save 
c = City.new(:name => 'Goncalves Junior', :zip_code => '84.507-000', :state => state); c.save 
c = City.new(:name => 'Graciosa', :zip_code => '87.722-000', :state => state); c.save 
c = City.new(:name => 'Grandes Rios', :zip_code => '86.845-000', :state => state); c.save 
c = City.new(:name => 'Guaipora', :zip_code => '87.567-000', :state => state); c.save 
c = City.new(:name => 'Guaira', :zip_code => '85.980-000', :state => state); c.save 
c = City.new(:name => 'Guairaca', :zip_code => '87.880-000', :state => state); c.save 
c = City.new(:name => 'Guairaca', :zip_code => '85.113-000', :state => state); c.save 
c = City.new(:name => 'Guajuvira', :zip_code => '83.725-000', :state => state); c.save 
c = City.new(:name => 'Guamiranga', :zip_code => '84.435-000', :state => state); c.save 
c = City.new(:name => 'Guamirim', :zip_code => '84.510-000', :state => state); c.save 
c = City.new(:name => 'Guapirama', :zip_code => '86.465-000', :state => state); c.save 
c = City.new(:name => 'Guapore', :zip_code => '85.407-000', :state => state); c.save 
c = City.new(:name => 'Guaporema', :zip_code => '87.810-000', :state => state); c.save 
c = City.new(:name => 'Guara', :zip_code => '85.110-000', :state => state); c.save 
c = City.new(:name => 'Guaraci', :zip_code => '86.620-000', :state => state); c.save 
c = City.new(:name => 'Guaragi', :zip_code => '84.120-000', :state => state); c.save 
c = City.new(:name => 'Guarani', :zip_code => '85.380-000', :state => state); c.save 
c = City.new(:name => 'Guaraniacu', :zip_code => '85.400-000', :state => state); c.save 
c = City.new(:name => 'Guarapuava', :zip_code => '85.000-000', :state => state); c.save 
c = City.new(:name => 'Guaraquecaba', :zip_code => '83.390-000', :state => state); c.save 
c = City.new(:name => 'Guaratuba', :zip_code => '83.280-000', :state => state); c.save 
c = City.new(:name => 'Guarauna', :zip_code => '84.534-000', :state => state); c.save 
c = City.new(:name => 'Guaravera', :zip_code => '86.120-000', :state => state); c.save 
c = City.new(:name => 'Harmonia', :zip_code => '84.275-000', :state => state); c.save 
c = City.new(:name => 'Herculandia', :zip_code => '87.527-000', :state => state); c.save 
c = City.new(:name => 'Herveira', :zip_code => '87.348-000', :state => state); c.save 
c = City.new(:name => 'Herveira', :zip_code => '85.360-000', :state => state); c.save 
c = City.new(:name => 'Hidreletrica Itaipu', :zip_code => '85.873-000', :state => state); c.save 
c = City.new(:name => 'Honorio Serpa', :zip_code => '85.548-000', :state => state); c.save 
c = City.new(:name => 'Ibaiti', :zip_code => '84.900-000', :state => state); c.save 
c = City.new(:name => 'Ibema', :zip_code => '85.478-000', :state => state); c.save 
c = City.new(:name => 'Ibiaci', :zip_code => '86.143-000', :state => state); c.save 
c = City.new(:name => 'Ibipora', :zip_code => '86.200-000', :state => state); c.save 
c = City.new(:name => 'Icara', :zip_code => '86.744-000', :state => state); c.save 
c = City.new(:name => 'Icaraima', :zip_code => '87.530-000', :state => state); c.save 
c = City.new(:name => 'Icatu', :zip_code => '87.935-000', :state => state); c.save 
c = City.new(:name => 'Iguaracu', :zip_code => '86.750-000', :state => state); c.save 
c = City.new(:name => 'Iguatemi', :zip_code => '87.103-000', :state => state); c.save 
c = City.new(:name => 'Iguatu', :zip_code => '85.423-000', :state => state); c.save 
c = City.new(:name => 'Iguipora', :zip_code => '85.972-000', :state => state); c.save 
c = City.new(:name => 'Imbau', :zip_code => '84.250-000', :state => state); c.save 
c = City.new(:name => 'Imbituva', :zip_code => '84.430-000', :state => state); c.save 
c = City.new(:name => 'Inacio Martins', :zip_code => '85.155-000', :state => state); c.save 
c = City.new(:name => 'Inaja', :zip_code => '87.670-000', :state => state); c.save 
c = City.new(:name => 'Indianopolis', :zip_code => '87.210-000', :state => state); c.save 
c = City.new(:name => 'Iolopolis', :zip_code => '85.578-000', :state => state); c.save 
c = City.new(:name => 'Ipiranga', :zip_code => '84.450-000', :state => state); c.save 
c = City.new(:name => 'Ipora', :zip_code => '87.560-000', :state => state); c.save 
c = City.new(:name => 'Iracema Do Oeste', :zip_code => '85.833-000', :state => state); c.save 
c = City.new(:name => 'Irapuan', :zip_code => '87.267-000', :state => state); c.save 
c = City.new(:name => 'Irati', :zip_code => '84.500-000', :state => state); c.save 
c = City.new(:name => 'Irere', :zip_code => '86.115-000', :state => state); c.save 
c = City.new(:name => 'Iretama', :zip_code => '87.280-000', :state => state); c.save 
c = City.new(:name => 'Novo Itacolomi', :zip_code => '86.895-000', :state => state); c.save 
c = City.new(:name => 'Itaguaje', :zip_code => '86.670-000', :state => state); c.save 
c = City.new(:name => 'Itaiacoca', :zip_code => '84.110-000', :state => state); c.save 
c = City.new(:name => 'Itambaraca', :zip_code => '86.375-000', :state => state); c.save 
c = City.new(:name => 'Itambe', :zip_code => '87.175-000', :state => state); c.save 
c = City.new(:name => 'Itapara', :zip_code => '84.515-000', :state => state); c.save 
c = City.new(:name => 'Itapejara Doeste', :zip_code => '85.580-000', :state => state); c.save 
c = City.new(:name => 'Itauna Do Sul', :zip_code => '87.980-000', :state => state); c.save 
c = City.new(:name => '4o. Centenario', :zip_code => '87.365-000', :state => state); c.save 
c = City.new(:name => 'Ivai', :zip_code => '84.460-000', :state => state); c.save 
c = City.new(:name => 'Ivaipora', :zip_code => '86.870-000', :state => state); c.save 
c = City.new(:name => 'Ivaitinga', :zip_code => '87.620-000', :state => state); c.save 
c = City.new(:name => 'Ivate', :zip_code => '87.525-000', :state => state); c.save 
c = City.new(:name => 'Ivatuba', :zip_code => '87.130-000', :state => state); c.save 
c = City.new(:name => 'Jaboti', :zip_code => '84.930-000', :state => state); c.save 
c = City.new(:name => 'Jacarezinho', :zip_code => '86.400-000', :state => state); c.save 
c = City.new(:name => 'Jaciaba', :zip_code => '84.420-000', :state => state); c.save 
c = City.new(:name => 'Jacutinga', :zip_code => '85.164-000', :state => state); c.save 
c = City.new(:name => 'Jacutinga', :zip_code => '86.878-000', :state => state); c.save 
c = City.new(:name => 'Jacutinga', :zip_code => '85.653-000', :state => state); c.save 
c = City.new(:name => 'Jaguapita', :zip_code => '86.610-000', :state => state); c.save 
c = City.new(:name => 'Jaguariaiva', :zip_code => '84.200-000', :state => state); c.save 
c = City.new(:name => 'Jandaia Do Sul', :zip_code => '86.900-000', :state => state); c.save 
c = City.new(:name => 'Jangada', :zip_code => '87.569-000', :state => state); c.save 
c = City.new(:name => 'Jangada Do Sul', :zip_code => '84.664-000', :state => state); c.save 
c = City.new(:name => 'Janiopolis', :zip_code => '87.380-000', :state => state); c.save 
c = City.new(:name => 'Japira', :zip_code => '84.920-000', :state => state); c.save 
c = City.new(:name => 'Japura', :zip_code => '87.225-000', :state => state); c.save 
c = City.new(:name => 'Jardim Alegre', :zip_code => '86.860-000', :state => state); c.save 
c = City.new(:name => 'Jardim Olinda', :zip_code => '87.690-000', :state => state); c.save 
c = City.new(:name => 'Jardim Paredao', :zip_code => '87.552-000', :state => state); c.save 
c = City.new(:name => 'Serranopolis Do Iguacu', :zip_code => '85.885-000', :state => state); c.save 
c = City.new(:name => 'Jataizinho', :zip_code => '86.210-000', :state => state); c.save 
c = City.new(:name => 'Jesuitas', :zip_code => '85.835-000', :state => state); c.save 
c = City.new(:name => 'Joa', :zip_code => '86.457-000', :state => state); c.save 
c = City.new(:name => 'Joaquim Tavora', :zip_code => '86.455-000', :state => state); c.save 
c = City.new(:name => 'Jose Lacerda', :zip_code => '84.330-000', :state => state); c.save 
c = City.new(:name => 'Jundiai Do Sul', :zip_code => '86.470-000', :state => state); c.save 
c = City.new(:name => 'Juranda', :zip_code => '87.355-000', :state => state); c.save 
c = City.new(:name => 'Jussara', :zip_code => '87.230-000', :state => state); c.save 
c = City.new(:name => 'Juvinopolis', :zip_code => '85.821-000', :state => state); c.save 
c = City.new(:name => 'Kalore', :zip_code => '86.920-000', :state => state); c.save 
c = City.new(:name => 'Lajeado', :zip_code => '83.910-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Bonito', :zip_code => '84.360-000', :state => state); c.save 
c = City.new(:name => 'Lambari', :zip_code => '84.295-000', :state => state); c.save 
c = City.new(:name => 'Lapa', :zip_code => '83.750-000', :state => state); c.save 
c = City.new(:name => 'Laranjal', :zip_code => '85.275-000', :state => state); c.save 
c = City.new(:name => 'Laranjeiras Do Sul', :zip_code => '85.300-000', :state => state); c.save 
c = City.new(:name => 'Lavrinha', :zip_code => '84.928-000', :state => state); c.save 
c = City.new(:name => 'Leopolis', :zip_code => '86.330-000', :state => state); c.save 
c = City.new(:name => 'Lerroville', :zip_code => '86.123-000', :state => state); c.save 
c = City.new(:name => 'Lidianopolis', :zip_code => '86.865-000', :state => state); c.save 
c = City.new(:name => 'Lindoeste', :zip_code => '85.826-000', :state => state); c.save 
c = City.new(:name => 'Loanda', :zip_code => '87.900-000', :state => state); c.save 
c = City.new(:name => 'Lobato', :zip_code => '86.790-000', :state => state); c.save 
c = City.new(:name => 'Londrina', :zip_code => '86.000-000', :state => state); c.save 
c = City.new(:name => 'Lovat', :zip_code => '87.520-000', :state => state); c.save 
c = City.new(:name => 'Luar', :zip_code => '86.931-000', :state => state); c.save 
c = City.new(:name => 'Luiziana', :zip_code => '87.290-000', :state => state); c.save 
c = City.new(:name => 'Lunardelli', :zip_code => '86.935-000', :state => state); c.save 
c = City.new(:name => 'Lupionopolis', :zip_code => '86.635-000', :state => state); c.save 
c = City.new(:name => 'Maira', :zip_code => '86.638-000', :state => state); c.save 
c = City.new(:name => 'Mallet', :zip_code => '84.570-000', :state => state); c.save 
c = City.new(:name => 'Mambore', :zip_code => '87.340-000', :state => state); c.save 
c = City.new(:name => 'Mandaguacu', :zip_code => '87.160-000', :state => state); c.save 
c = City.new(:name => 'Mandaguari', :zip_code => '86.975-000', :state => state); c.save 
c = City.new(:name => 'Mandirituba', :zip_code => '83.800-000', :state => state); c.save 
c = City.new(:name => 'Mangueirinha', :zip_code => '85.540-000', :state => state); c.save 
c = City.new(:name => 'Manoel Ribas', :zip_code => '85.260-000', :state => state); c.save 
c = City.new(:name => 'Maraba', :zip_code => '87.458-000', :state => state); c.save 
c = City.new(:name => 'Marajo', :zip_code => '85.412-000', :state => state); c.save 
c = City.new(:name => 'Maravilha', :zip_code => '86.110-000', :state => state); c.save 
c = City.new(:name => 'Maravilha', :zip_code => '85.775-000', :state => state); c.save 
c = City.new(:name => 'Marcionopolis', :zip_code => '85.720-000', :state => state); c.save 
c = City.new(:name => 'Marechal Candido Rondon', :zip_code => '85.960-000', :state => state); c.save 
c = City.new(:name => 'Margarida', :zip_code => '85.974-000', :state => state); c.save 
c = City.new(:name => 'Maria Helena', :zip_code => '87.480-000', :state => state); c.save 
c = City.new(:name => 'Marialva', :zip_code => '86.990-000', :state => state); c.save 
c = City.new(:name => 'Mariental', :zip_code => '83.760-000', :state => state); c.save 
c = City.new(:name => 'Marilandia Do Sul', :zip_code => '86.825-000', :state => state); c.save 
c = City.new(:name => 'Marilena', :zip_code => '87.960-000', :state => state); c.save 
c = City.new(:name => 'Marilu', :zip_code => '87.282-000', :state => state); c.save 
c = City.new(:name => 'Mariluz', :zip_code => '87.470-000', :state => state); c.save 
c = City.new(:name => 'Marimbondo', :zip_code => '84.943-000', :state => state); c.save 
c = City.new(:name => 'Maringa', :zip_code => '87.000-000', :state => state); c.save 
c = City.new(:name => 'Mariopolis', :zip_code => '85.525-000', :state => state); c.save 
c = City.new(:name => 'Maristela', :zip_code => '87.753-000', :state => state); c.save 
c = City.new(:name => 'Mariza', :zip_code => '86.947-000', :state => state); c.save 
c = City.new(:name => 'Marmelandia', :zip_code => '85.778-000', :state => state); c.save 
c = City.new(:name => 'Marmeleiro', :zip_code => '85.615-000', :state => state); c.save 
c = City.new(:name => 'Marques De Abrantes', :zip_code => '83.485-000', :state => state); c.save 
c = City.new(:name => 'Marquinho', :zip_code => '85.168-000', :state => state); c.save 
c = City.new(:name => 'Marumbi', :zip_code => '86.910-000', :state => state); c.save 
c = City.new(:name => 'Matelandia', :zip_code => '85.887-000', :state => state); c.save 
c = City.new(:name => 'Matinhos', :zip_code => '83.260-000', :state => state); c.save 
c = City.new(:name => 'Maua Da Serra', :zip_code => '86.828-000', :state => state); c.save 
c = City.new(:name => 'Medianeira', :zip_code => '85.884-000', :state => state); c.save 
c = City.new(:name => 'Mirador', :zip_code => '87.840-000', :state => state); c.save 
c = City.new(:name => 'Mirante Do Piquiri', :zip_code => '87.590-000', :state => state); c.save 
c = City.new(:name => 'Miraselva', :zip_code => '86.615-000', :state => state); c.save 
c = City.new(:name => 'Missal', :zip_code => '85.890-000', :state => state); c.save 
c = City.new(:name => 'Monjolinho', :zip_code => '84.370-000', :state => state); c.save 
c = City.new(:name => 'Monte Real', :zip_code => '86.435-000', :state => state); c.save 
c = City.new(:name => 'Moreira Sales', :zip_code => '87.370-000', :state => state); c.save 
c = City.new(:name => 'Morretes', :zip_code => '83.350-000', :state => state); c.save 
c = City.new(:name => 'Munhoz De Melo', :zip_code => '86.760-000', :state => state); c.save 
c = City.new(:name => 'Natingui', :zip_code => '84.390-000', :state => state); c.save 
c = City.new(:name => 'Nilza', :zip_code => '87.562-000', :state => state); c.save 
c = City.new(:name => 'Nordestina', :zip_code => '87.855-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Aparecida', :zip_code => '86.383-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Aparecida', :zip_code => '86.607-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Candelaria', :zip_code => '86.365-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Das Gracas', :zip_code => '86.680-000', :state => state); c.save 
c = City.new(:name => 'Nova Alianca Do Ivai', :zip_code => '87.790-000', :state => state); c.save 
c = City.new(:name => 'Nova Altamira', :zip_code => '86.842-000', :state => state); c.save 
c = City.new(:name => 'Nova America Da Colina', :zip_code => '86.230-000', :state => state); c.save 
c = City.new(:name => 'Nova Aurora', :zip_code => '85.410-000', :state => state); c.save 
c = City.new(:name => 'Nova Bilac', :zip_code => '87.188-000', :state => state); c.save 
c = City.new(:name => 'Nova Brasilia Do Itarare', :zip_code => '86.425-000', :state => state); c.save 
c = City.new(:name => 'Nova Cantu', :zip_code => '87.330-000', :state => state); c.save 
c = City.new(:name => 'Nova Concordia', :zip_code => '85.609-000', :state => state); c.save 
c = City.new(:name => 'Nova Esperanca', :zip_code => '87.600-000', :state => state); c.save 
c = City.new(:name => 'Nova Esperanca Do Sudoeste', :zip_code => '85.635-000', :state => state); c.save 
c = City.new(:name => 'Nova Fatima', :zip_code => '86.310-000', :state => state); c.save 
c = City.new(:name => 'Nova Londrina', :zip_code => '87.970-000', :state => state); c.save 
c = City.new(:name => 'Nova Lourdes', :zip_code => '85.572-000', :state => state); c.save 
c = City.new(:name => 'Mercedes', :zip_code => '85.998-000', :state => state); c.save 
c = City.new(:name => 'Nova Olimpia', :zip_code => '87.490-000', :state => state); c.save 
c = City.new(:name => 'Nova Prata Do Iguacu', :zip_code => '85.685-000', :state => state); c.save 
c = City.new(:name => 'Nova Santa Rosa', :zip_code => '85.930-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '85.978-000', :state => state); c.save 
c = City.new(:name => 'Novo Jardim', :zip_code => '84.923-000', :state => state); c.save 
c = City.new(:name => 'Novo Sarandi', :zip_code => '85.927-000', :state => state); c.save 
c = City.new(:name => 'Novo Sobradinho', :zip_code => '85.925-000', :state => state); c.save 
c = City.new(:name => 'Novo Tres Passos', :zip_code => '85.975-000', :state => state); c.save 
c = City.new(:name => 'Oroite', :zip_code => '87.564-000', :state => state); c.save 
c = City.new(:name => 'Ortigueira', :zip_code => '84.350-000', :state => state); c.save 
c = City.new(:name => 'Ourilandia', :zip_code => '86.968-000', :state => state); c.save 
c = City.new(:name => 'Ouro Verde Do Oeste', :zip_code => '85.933-000', :state => state); c.save 
c = City.new(:name => 'Ouro Verde Do Piquiri', :zip_code => '85.422-000', :state => state); c.save 
c = City.new(:name => 'Padre Ponciano', :zip_code => '85.559-000', :state => state); c.save 
c = City.new(:name => 'Paicandu', :zip_code => '87.140-000', :state => state); c.save 
c = City.new(:name => 'Paiquere', :zip_code => '86.112-000', :state => state); c.save 
c = City.new(:name => 'Palmas', :zip_code => '85.555-000', :state => state); c.save 
c = City.new(:name => 'Palmeira', :zip_code => '84.130-000', :state => state); c.save 
c = City.new(:name => 'Palmeirinha', :zip_code => '85.118-000', :state => state); c.save 
c = City.new(:name => 'Palmira', :zip_code => '84.155-000', :state => state); c.save 
c = City.new(:name => 'Palmital', :zip_code => '85.270-000', :state => state); c.save 
c = City.new(:name => 'Palmitopolis', :zip_code => '85.413-000', :state => state); c.save 
c = City.new(:name => 'Palotina', :zip_code => '85.950-000', :state => state); c.save 
c = City.new(:name => 'Pangare', :zip_code => '83.845-000', :state => state); c.save 
c = City.new(:name => 'Papagaios Novos', :zip_code => '84.135-000', :state => state); c.save 
c = City.new(:name => 'Paraiso Do Norte', :zip_code => '87.780-000', :state => state); c.save 
c = City.new(:name => 'Parana Doeste', :zip_code => '87.375-000', :state => state); c.save 
c = City.new(:name => 'Paranacity', :zip_code => '87.660-000', :state => state); c.save 
c = City.new(:name => 'Paranagi', :zip_code => '86.345-000', :state => state); c.save 
c = City.new(:name => 'Paranagua', :zip_code => '83.200-000', :state => state); c.save 
c = City.new(:name => 'Paranapoema', :zip_code => '87.680-000', :state => state); c.save 
c = City.new(:name => 'Paranavai', :zip_code => '87.700-000', :state => state); c.save 
c = City.new(:name => 'Passo Liso', :zip_code => '85.330-000', :state => state); c.save 
c = City.new(:name => 'Pato Bragado', :zip_code => '85.948-000', :state => state); c.save 
c = City.new(:name => 'Pato Branco', :zip_code => '85.500-000', :state => state); c.save 
c = City.new(:name => 'Patos Velhos', :zip_code => '84.410-000', :state => state); c.save 
c = City.new(:name => 'Paula Freitas', :zip_code => '84.630-000', :state => state); c.save 
c = City.new(:name => 'Paulistania', :zip_code => '87.588-000', :state => state); c.save 
c = City.new(:name => 'Paulo Frontin', :zip_code => '84.635-000', :state => state); c.save 
c = City.new(:name => 'Foz Do Jordao', :zip_code => '85.145-000', :state => state); c.save 
c = City.new(:name => 'Peabiru', :zip_code => '87.250-000', :state => state); c.save 
c = City.new(:name => 'Pedra Branca Do Araraquara', :zip_code => '83.290-000', :state => state); c.save 
c = City.new(:name => 'Pedro Lustosa', :zip_code => '85.198-000', :state => state); c.save 
c = City.new(:name => 'Perobal', :zip_code => '87.538-000', :state => state); c.save 
c = City.new(:name => 'Perola', :zip_code => '87.540-000', :state => state); c.save 
c = City.new(:name => 'Perola Do Oeste', :zip_code => '85.740-000', :state => state); c.save 
c = City.new(:name => 'Perola Independente', :zip_code => '85.958-000', :state => state); c.save 
c = City.new(:name => 'Pien', :zip_code => '83.860-000', :state => state); c.save 
c = City.new(:name => 'Pinare', :zip_code => '84.625-000', :state => state); c.save 
c = City.new(:name => 'Pinhais', :zip_code => '83.320-000', :state => state); c.save 
c = City.new(:name => 'Pinhal Do Sao Bento', :zip_code => '85.727-000', :state => state); c.save 
c = City.new(:name => 'Pinhalao', :zip_code => '84.925-000', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '85.634-000', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '85.190-000', :state => state); c.save 
c = City.new(:name => 'Pinhao', :zip_code => '85.170-000', :state => state); c.save 
c = City.new(:name => 'Pinheiro', :zip_code => '85.767-000', :state => state); c.save 
c = City.new(:name => 'Piquirivai', :zip_code => '87.318-000', :state => state); c.save 
c = City.new(:name => 'Pirai Do Sul', :zip_code => '84.240-000', :state => state); c.save 
c = City.new(:name => 'Pirapo', :zip_code => '86.818-000', :state => state); c.save 
c = City.new(:name => 'Piraquara', :zip_code => '83.300-000', :state => state); c.save 
c = City.new(:name => 'Piriquitos', :zip_code => '84.105-000', :state => state); c.save 
c = City.new(:name => 'Pitanga', :zip_code => '85.200-000', :state => state); c.save 
c = City.new(:name => 'Pitangueiras', :zip_code => '86.613-000', :state => state); c.save 
c = City.new(:name => 'Planaltina Do Parana', :zip_code => '87.860-000', :state => state); c.save 
c = City.new(:name => 'Planalto', :zip_code => '85.750-000', :state => state); c.save 
c = City.new(:name => 'Pocinho', :zip_code => '86.962-000', :state => state); c.save 
c = City.new(:name => 'Poema', :zip_code => '85.255-000', :state => state); c.save 
c = City.new(:name => 'Ponta Grossa', :zip_code => '84.000-000', :state => state); c.save 
c = City.new(:name => 'Porecatu', :zip_code => '86.160-000', :state => state); c.save 
c = City.new(:name => 'Porteira Preta', :zip_code => '86.955-000', :state => state); c.save 
c = City.new(:name => 'Porto Amazonas', :zip_code => '84.140-000', :state => state); c.save 
c = City.new(:name => 'Porto Brasilio', :zip_code => '87.940-000', :state => state); c.save 
c = City.new(:name => 'Porto Camargo', :zip_code => '87.532-000', :state => state); c.save 
c = City.new(:name => 'Porto De Cima', :zip_code => '83.360-000', :state => state); c.save 
c = City.new(:name => 'Porto Mendes', :zip_code => '85.976-000', :state => state); c.save 
c = City.new(:name => 'Porto Rico', :zip_code => '87.950-000', :state => state); c.save 
c = City.new(:name => 'Porto Santana', :zip_code => '85.348-000', :state => state); c.save 
c = City.new(:name => 'Porto Sao Carlos', :zip_code => '87.775-000', :state => state); c.save 
c = City.new(:name => 'Porto Sao Jose', :zip_code => '87.957-000', :state => state); c.save 
c = City.new(:name => 'Porto Vitoria', :zip_code => '84.610-000', :state => state); c.save 
c = City.new(:name => 'Prado Ferreira', :zip_code => '86.618-000', :state => state); c.save 
c = City.new(:name => 'Pranchita', :zip_code => '85.730-000', :state => state); c.save 
c = City.new(:name => 'Prata', :zip_code => '86.198-000', :state => state); c.save 
c = City.new(:name => 'Presidente Castelo Branco', :zip_code => '87.180-000', :state => state); c.save 
c = City.new(:name => 'Presidente Kennedy', :zip_code => '85.587-000', :state => state); c.save 
c = City.new(:name => 'Primeiro De Maio', :zip_code => '86.140-000', :state => state); c.save 
c = City.new(:name => 'Prudentopolis', :zip_code => '84.400-000', :state => state); c.save 
c = City.new(:name => 'Quatigua', :zip_code => '86.450-000', :state => state); c.save 
c = City.new(:name => 'Quatro Barras', :zip_code => '83.420-000', :state => state); c.save 
c = City.new(:name => 'Quatro Pontes', :zip_code => '85.940-000', :state => state); c.save 
c = City.new(:name => 'Quedas Do Iguacu', :zip_code => '85.460-000', :state => state); c.save 
c = City.new(:name => 'Querencia Do Norte', :zip_code => '87.930-000', :state => state); c.save 
c = City.new(:name => 'Quinta Do Sol', :zip_code => '87.265-000', :state => state); c.save 
c = City.new(:name => 'Quitandinha', :zip_code => '83.840-000', :state => state); c.save 
c = City.new(:name => 'Ramilandia', :zip_code => '85.888-000', :state => state); c.save 
c = City.new(:name => 'Rancho Alegre', :zip_code => '86.290-000', :state => state); c.save 
c = City.new(:name => 'Rancho Alegre Doeste', :zip_code => '87.395-000', :state => state); c.save 
c = City.new(:name => 'Realeza', :zip_code => '85.770-000', :state => state); c.save 
c = City.new(:name => 'Reboucas', :zip_code => '84.550-000', :state => state); c.save 
c = City.new(:name => 'Reianopolis', :zip_code => '84.230-000', :state => state); c.save 
c = City.new(:name => 'Renascenca', :zip_code => '85.610-000', :state => state); c.save 
c = City.new(:name => 'Reserva', :zip_code => '84.320-000', :state => state); c.save 
c = City.new(:name => 'Reserva Do Iguacu', :zip_code => '85.195-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Bonito', :zip_code => '86.847-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Claro', :zip_code => '86.410-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Do Pinhal', :zip_code => '86.490-000', :state => state); c.save 
c = City.new(:name => 'Rio Azul', :zip_code => '84.560-000', :state => state); c.save 
c = City.new(:name => 'Rio Bom', :zip_code => '86.830-000', :state => state); c.save 
c = City.new(:name => 'Rio Bonito', :zip_code => '87.575-000', :state => state); c.save 
c = City.new(:name => 'Rio Bonito Do Iguacu', :zip_code => '85.340-000', :state => state); c.save 
c = City.new(:name => 'Rio Branco Do Sul', :zip_code => '83.540-000', :state => state); c.save 
c = City.new(:name => 'Rio Claro Do Sul', :zip_code => '84.577-000', :state => state); c.save 
c = City.new(:name => 'Rio Da Prata', :zip_code => '85.370-000', :state => state); c.save 
c = City.new(:name => 'Rio Da Prata', :zip_code => '85.655-000', :state => state); c.save 
c = City.new(:name => 'Rio Do Salto', :zip_code => '85.824-000', :state => state); c.save 
c = City.new(:name => 'Rio Negro', :zip_code => '83.880-000', :state => state); c.save 
c = City.new(:name => 'Rio Novo', :zip_code => '84.340-000', :state => state); c.save 
c = City.new(:name => 'Rio Pinheiro', :zip_code => '85.526-000', :state => state); c.save 
c = City.new(:name => 'Rio Verde', :zip_code => '87.357-000', :state => state); c.save 
c = City.new(:name => 'Roberto Silveira', :zip_code => '87.524-000', :state => state); c.save 
c = City.new(:name => 'Rolandia', :zip_code => '86.600-000', :state => state); c.save 
c = City.new(:name => 'Romeopolis', :zip_code => '86.887-000', :state => state); c.save 
c = City.new(:name => 'Roncador', :zip_code => '87.320-000', :state => state); c.save 
c = City.new(:name => 'Rondon', :zip_code => '87.800-000', :state => state); c.save 
c = City.new(:name => 'Rosario Do Ivai', :zip_code => '86.850-000', :state => state); c.save 
c = City.new(:name => 'Sabaudia', :zip_code => '86.720-000', :state => state); c.save 
c = City.new(:name => 'Sagrada Familia', :zip_code => '85.756-000', :state => state); c.save 
c = City.new(:name => 'Salgado Filho', :zip_code => '85.620-000', :state => state); c.save 
c = City.new(:name => 'Salles De Oliveira', :zip_code => '87.349-000', :state => state); c.save 
c = City.new(:name => 'Saltinho Do Oeste', :zip_code => '87.585-000', :state => state); c.save 
c = City.new(:name => 'Salto Do Itarare', :zip_code => '84.945-000', :state => state); c.save 
c = City.new(:name => 'Salto Do Lontra', :zip_code => '85.670-000', :state => state); c.save 
c = City.new(:name => 'Santa Amelia', :zip_code => '86.370-000', :state => state); c.save 
c = City.new(:name => 'Nova Santa Barbara', :zip_code => '86.250-000', :state => state); c.save 
c = City.new(:name => 'Santa Cecilia Do Pavao', :zip_code => '86.225-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz De Monte Castelo', :zip_code => '87.920-000', :state => state); c.save 
c = City.new(:name => 'Santa Eliza', :zip_code => '87.521-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe', :zip_code => '86.770-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe Do Pirapo', :zip_code => '86.994-000', :state => state); c.save 
c = City.new(:name => 'Santa Helena', :zip_code => '85.892-000', :state => state); c.save 
c = City.new(:name => 'Santa Ines', :zip_code => '86.660-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel Do Ivai', :zip_code => '87.910-000', :state => state); c.save 
c = City.new(:name => 'Santa Izabel Do Oeste', :zip_code => '85.650-000', :state => state); c.save 
c = City.new(:name => 'Santa Lucia', :zip_code => '85.795-000', :state => state); c.save 
c = City.new(:name => 'Santa Luzia Da Alvorada', :zip_code => '86.934-000', :state => state); c.save 
c = City.new(:name => 'Santa Margarida', :zip_code => '86.135-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '87.755-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Oeste', :zip_code => '85.230-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Rio Do Peixe', :zip_code => '86.323-000', :state => state); c.save 
c = City.new(:name => 'Santa Mariana', :zip_code => '86.350-000', :state => state); c.save 
c = City.new(:name => 'Santa Monica', :zip_code => '87.915-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Oeste', :zip_code => '85.995-000', :state => state); c.save 
c = City.new(:name => 'Santa Tereza Do Oeste', :zip_code => '85.825-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha De Itaipu', :zip_code => '85.875-000', :state => state); c.save 
c = City.new(:name => 'Santa Zelia', :zip_code => '86.742-000', :state => state); c.save 
c = City.new(:name => 'Santana', :zip_code => '84.623-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Itarare', :zip_code => '84.970-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Da Platina', :zip_code => '86.430-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Caiua', :zip_code => '87.730-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Iratim', :zip_code => '84.650-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Palmital', :zip_code => '86.835-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Paraiso', :zip_code => '86.315-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Sudoeste', :zip_code => '85.710-000', :state => state); c.save 
c = City.new(:name => 'Santo Inacio', :zip_code => '86.650-000', :state => state); c.save 
c = City.new(:name => 'Santo Rei', :zip_code => '87.335-000', :state => state); c.save 
c = City.new(:name => 'Sao Camilo', :zip_code => '85.952-000', :state => state); c.save 
c = City.new(:name => 'Sao Carlos Do Ivai', :zip_code => '87.770-000', :state => state); c.save 
c = City.new(:name => 'Sao Clemente', :zip_code => '85.894-000', :state => state); c.save 
c = City.new(:name => 'Sao Cristovao', :zip_code => '84.609-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '86.859-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '84.608-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '85.562-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Imbau', :zip_code => '86.325-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Sales', :zip_code => '85.534-000', :state => state); c.save 
c = City.new(:name => 'Sao Jeronimo Da Serra', :zip_code => '86.270-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao', :zip_code => '85.570-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao', :zip_code => '87.553-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Doeste', :zip_code => '85.823-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Caiua', :zip_code => '87.740-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Ivai', :zip_code => '86.930-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Pinhal', :zip_code => '86.273-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Triunfo', :zip_code => '84.150-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim Do Pontal', :zip_code => '86.378-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge Doeste', :zip_code => '85.575-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge Do Ivai', :zip_code => '87.190-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge Do Patrocinio', :zip_code => '87.555-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '86.905-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '85.235-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Da Boa Vista', :zip_code => '84.980-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Das Palmeiras', :zip_code => '85.898-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Iguacu', :zip_code => '85.879-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Itavo', :zip_code => '85.883-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Ivai', :zip_code => '87.913-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Pinhais', :zip_code => '83.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Judas Tadeu', :zip_code => '86.318-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco', :zip_code => '87.205-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '85.765-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '85.563-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '86.117-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '86.998-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '87.475-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz Do Puruna', :zip_code => '83.670-000', :state => state); c.save 
c = City.new(:name => 'Sao Manoel Do Parana', :zip_code => '87.215-000', :state => state); c.save 
c = City.new(:name => 'Sao Martinho', :zip_code => '86.609-000', :state => state); c.save 
c = City.new(:name => 'Sao Mateus Do Sul', :zip_code => '83.900-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel', :zip_code => '85.924-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Cambui', :zip_code => '86.996-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Iguacu', :zip_code => '85.877-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '85.645-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '86.817-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Iguacu', :zip_code => '85.929-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Florido', :zip_code => '85.725-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Ivai', :zip_code => '86.945-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Parana', :zip_code => '87.955-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque', :zip_code => '85.667-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque', :zip_code => '85.977-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque', :zip_code => '85.773-000', :state => state); c.save 
c = City.new(:name => 'Sao Salvador', :zip_code => '85.643-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '83.580-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Da Amoreira', :zip_code => '86.240-000', :state => state); c.save 
c = City.new(:name => 'Manfrinopolis', :zip_code => '85.628-000', :state => state); c.save 
c = City.new(:name => 'Sao Silvestre', :zip_code => '87.408-000', :state => state); c.save 
c = City.new(:name => 'Sao Tome', :zip_code => '87.220-000', :state => state); c.save 
c = City.new(:name => 'Sao Valentim', :zip_code => '85.668-000', :state => state); c.save 
c = City.new(:name => 'Sape', :zip_code => '84.938-000', :state => state); c.save 
c = City.new(:name => 'Sapopema', :zip_code => '84.290-000', :state => state); c.save 
c = City.new(:name => 'Sarandi', :zip_code => '87.110-000', :state => state); c.save 
c = City.new(:name => 'Sede Alvorada', :zip_code => '85.822-000', :state => state); c.save 
c = City.new(:name => 'Sede Progresso', :zip_code => '85.588-000', :state => state); c.save 
c = City.new(:name => 'Sulina', :zip_code => '85.565-000', :state => state); c.save 
c = City.new(:name => 'Senges', :zip_code => '84.220-000', :state => state); c.save 
c = City.new(:name => 'Serra Dos Dourados', :zip_code => '87.518-000', :state => state); c.save 
c = City.new(:name => 'Serra Negra', :zip_code => '83.395-000', :state => state); c.save 
c = City.new(:name => 'Sertaneja', :zip_code => '86.340-000', :state => state); c.save 
c = City.new(:name => 'Sertanopolis', :zip_code => '86.170-000', :state => state); c.save 
c = City.new(:name => 'Sertaozinho', :zip_code => '87.272-000', :state => state); c.save 
c = City.new(:name => 'Siqueira Campos', :zip_code => '84.940-000', :state => state); c.save 
c = City.new(:name => 'Socavao', :zip_code => '84.190-000', :state => state); c.save 
c = City.new(:name => 'Sumare', :zip_code => '87.720-000', :state => state); c.save 
c = City.new(:name => 'Sussui', :zip_code => '87.274-000', :state => state); c.save 
c = City.new(:name => 'Tamarana', :zip_code => '86.125-000', :state => state); c.save 
c = City.new(:name => 'Tamboara', :zip_code => '87.760-000', :state => state); c.save 
c = City.new(:name => 'Tapejara', :zip_code => '87.430-000', :state => state); c.save 
c = City.new(:name => 'Tapira', :zip_code => '87.830-000', :state => state); c.save 
c = City.new(:name => 'Teixeira Soares', :zip_code => '84.530-000', :state => state); c.save 
c = City.new(:name => 'Telemaco Borba', :zip_code => '84.260-000', :state => state); c.save 
c = City.new(:name => 'Tereza Cristina', :zip_code => '84.490-000', :state => state); c.save 
c = City.new(:name => 'Tereza Breda', :zip_code => '86.964-000', :state => state); c.save 
c = City.new(:name => 'Terra Boa', :zip_code => '87.240-000', :state => state); c.save 
c = City.new(:name => 'Terra Nova', :zip_code => '86.275-000', :state => state); c.save 
c = City.new(:name => 'Terra Rica', :zip_code => '87.890-000', :state => state); c.save 
c = City.new(:name => 'Terra Roxa', :zip_code => '85.990-000', :state => state); c.save 
c = City.new(:name => 'Tibagi', :zip_code => '84.300-000', :state => state); c.save 
c = City.new(:name => 'Tijucas Do Sul', :zip_code => '83.190-000', :state => state); c.save 
c = City.new(:name => 'Tiradentes', :zip_code => '85.625-000', :state => state); c.save 
c = City.new(:name => 'Toledo', :zip_code => '85.900-000', :state => state); c.save 
c = City.new(:name => 'Tomazina', :zip_code => '84.935-000', :state => state); c.save 
c = City.new(:name => 'Tres Barras Do Parana', :zip_code => '85.485-000', :state => state); c.save 
c = City.new(:name => 'Tres Bicos', :zip_code => '84.480-000', :state => state); c.save 
c = City.new(:name => 'Tres Corregos', :zip_code => '83.642-000', :state => state); c.save 
c = City.new(:name => 'Triangulo', :zip_code => '87.276-000', :state => state); c.save 
c = City.new(:name => 'Triolandia', :zip_code => '86.495-000', :state => state); c.save 
c = City.new(:name => 'Tunas Do Parana', :zip_code => '83.480-000', :state => state); c.save 
c = City.new(:name => 'Tuneiras Do Oeste', :zip_code => '87.450-000', :state => state); c.save 
c = City.new(:name => 'Tupassi', :zip_code => '85.945-000', :state => state); c.save 
c = City.new(:name => 'Tupinamba', :zip_code => '86.746-000', :state => state); c.save 
c = City.new(:name => 'Turvo', :zip_code => '85.150-000', :state => state); c.save 
c = City.new(:name => 'Ubaldino Taques', :zip_code => '85.558-000', :state => state); c.save 
c = City.new(:name => 'Ubauna', :zip_code => '86.932-000', :state => state); c.save 
c = City.new(:name => 'Ubirata', :zip_code => '85.440-000', :state => state); c.save 
c = City.new(:name => 'Umuarama', :zip_code => '87.500-000', :state => state); c.save 
c = City.new(:name => 'Uniao Da Vitoria', :zip_code => '84.600-000', :state => state); c.save 
c = City.new(:name => 'Uniao Do Oeste', :zip_code => '85.656-000', :state => state); c.save 
c = City.new(:name => 'Uniflor', :zip_code => '87.640-000', :state => state); c.save 
c = City.new(:name => 'Urai', :zip_code => '86.280-000', :state => state); c.save 
c = City.new(:name => 'Uvaia', :zip_code => '84.115-000', :state => state); c.save 
c = City.new(:name => 'Valerio', :zip_code => '85.758-000', :state => state); c.save 
c = City.new(:name => 'Doutor Ulysses', :zip_code => '83.590-000', :state => state); c.save 
c = City.new(:name => 'Vassoural', :zip_code => '84.916-000', :state => state); c.save 
c = City.new(:name => 'Ventania', :zip_code => '84.345-000', :state => state); c.save 
c = City.new(:name => 'Vera Cruz Do Oeste', :zip_code => '85.845-000', :state => state); c.save 
c = City.new(:name => 'Vera Guarani', :zip_code => '84.638-000', :state => state); c.save 
c = City.new(:name => 'Vere', :zip_code => '85.585-000', :state => state); c.save 
c = City.new(:name => 'Vida Nova', :zip_code => '84.293-000', :state => state); c.save 
c = City.new(:name => 'Vidigal', :zip_code => '87.208-000', :state => state); c.save 
c = City.new(:name => 'Vila Alta', :zip_code => '87.528-000', :state => state); c.save 
c = City.new(:name => 'Vila Diniz', :zip_code => '86.857-000', :state => state); c.save 
c = City.new(:name => 'Vila Guay', :zip_code => '84.914-000', :state => state); c.save 
c = City.new(:name => 'Maripa', :zip_code => '85.955-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova', :zip_code => '85.926-000', :state => state); c.save 
c = City.new(:name => 'Vila Paraiso', :zip_code => '85.573-000', :state => state); c.save 
c = City.new(:name => 'Vila Reis', :zip_code => '86.819-000', :state => state); c.save 
c = City.new(:name => 'Vila Rica Do Ivai', :zip_code => '87.534-000', :state => state); c.save 
c = City.new(:name => 'Virmond', :zip_code => '85.390-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '85.554-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '85.633-000', :state => state); c.save 
c = City.new(:name => 'Vitorino', :zip_code => '85.520-000', :state => state); c.save 
c = City.new(:name => 'Warta', :zip_code => '86.105-000', :state => state); c.save 
c = City.new(:name => 'Wenceslau Braz', :zip_code => '84.950-000', :state => state); c.save 
c = City.new(:name => 'Xambre', :zip_code => '87.535-000', :state => state); c.save 
c = City.new(:name => 'Yolanda', :zip_code => '85.455-000', :state => state); c.save 
c = City.new(:name => 'Catarinenses', :zip_code => '87.724-000', :state => state); c.save 
c = City.new(:name => 'Mandiocaba', :zip_code => '87.729-400', :state => state); c.save 
c = City.new(:name => 'Jacutinga', :zip_code => '85.607-000', :state => state); c.save 
c = City.new(:name => 'Nova Amoreira', :zip_code => '86.826-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '87.523-800', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '85.267-000', :state => state); c.save 
c = City.new(:name => 'Nova Brasilia', :zip_code => '87.262-000', :state => state); c.save 
c = City.new(:name => 'Nova Tebas', :zip_code => '85.250-000', :state => state); c.save 
c = City.new(:name => 'Nova Riqueza', :zip_code => '85.729-000', :state => state); c.save 
c = City.new(:name => 'Santa Esmeralda', :zip_code => '87.925-000', :state => state); c.save 
c = City.new(:name => 'Piracema', :zip_code => '87.729-200', :state => state); c.save 
c = City.new(:name => 'Iarama', :zip_code => '87.523-600', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '87.729-000', :state => state); c.save 
c = City.new(:name => 'Cedro', :zip_code => '87.523-500', :state => state); c.save 
c = City.new(:name => 'Fazenda Salmo 23', :zip_code => '87.523-700', :state => state); c.save 
c = City.new(:name => 'Siqueira Belo', :zip_code => '85.705-000', :state => state); c.save 
c = City.new(:name => 'Sao Pio X', :zip_code => '85.608-000', :state => state); c.save 
c = City.new(:name => 'Vila Gandhi', :zip_code => '86.142-000', :state => state); c.save 
c = City.new(:name => 'Caetano Mendes', :zip_code => '84.315-000', :state => state); c.save 
c = City.new(:name => 'Nova Laranjeiras', :zip_code => '85.350-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '87.263-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Espirito Santo', :zip_code => '86.415-000', :state => state); c.save 
c = City.new(:name => 'Senhor Bom Jesus Dos Gramados', :zip_code => '85.528-000', :state => state); c.save 
c = City.new(:name => 'Palmital De Sao Silvestre', :zip_code => '83.646-000', :state => state); c.save 
c = City.new(:name => 'Sede Nova Santana', :zip_code => '85.577-000', :state => state); c.save 
c = City.new(:name => 'Sarandi', :zip_code => '85.652-000', :state => state); c.save 
c = City.new(:name => 'Jaborandi', :zip_code => '87.523-400', :state => state); c.save 
c = City.new(:name => 'Sao Cristovao', :zip_code => '87.729-600', :state => state); c.save 
c = City.new(:name => 'Pontal Do Parana', :zip_code => '83.255-000', :state => state); c.save 
c = City.new(:name => 'Colonia General Carneiro', :zip_code => '84.662-000', :state => state); c.save 
c = City.new(:name => 'Guaraituba', :zip_code => '83.418-000', :state => state); c.save 
c = City.new(:name => 'Paiol De Baixo', :zip_code => '83.440-000', :state => state); c.save 
c = City.new(:name => 'Itaperucu', :zip_code => '83.560-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Verde', :zip_code => '83.848-000', :state => state); c.save 
c = City.new(:name => 'Cadeadinho', :zip_code => '84.518-000', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '85.167-000', :state => state); c.save 
c = City.new(:name => 'Mato Rico', :zip_code => '85.240-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '85.258-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '85.538-000', :state => state); c.save 
c = City.new(:name => 'Quinzopolis', :zip_code => '86.355-000', :state => state); c.save 
c = City.new(:name => 'Panema', :zip_code => '86.358-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque Do Pinhal', :zip_code => '86.458-000', :state => state); c.save 
c = City.new(:name => 'Mendeslandia', :zip_code => '86.685-000', :state => state); c.save 
c = City.new(:name => 'Bom Progresso', :zip_code => '86.728-000', :state => state); c.save 
c = City.new(:name => 'Rio Branco Do Ivai', :zip_code => '86.848-000', :state => state); c.save 
c = City.new(:name => 'Juciara', :zip_code => '86.923-000', :state => state); c.save 
c = City.new(:name => 'Aquidaban', :zip_code => '86.995-000', :state => state); c.save 
c = City.new(:name => 'Pulinopolis', :zip_code => '87.165-000', :state => state); c.save 
c = City.new(:name => 'Cabrito', :zip_code => '87.729-800', :state => state); c.save 
c = City.new(:name => 'Malu', :zip_code => '87.245-000', :state => state); c.save 
c = City.new(:name => 'Figueira Do Oeste', :zip_code => '87.277-000', :state => state); c.save 
c = City.new(:name => 'Ivailandia', :zip_code => '87.275-000', :state => state); c.save 
c = City.new(:name => 'Jaracatia', :zip_code => '87.364-000', :state => state); c.save 
c = City.new(:name => 'Vila Silva Jardim', :zip_code => '87.665-000', :state => state); c.save 
c = City.new(:name => 'Floropolis', :zip_code => '87.668-000', :state => state); c.save 
c = City.new(:name => 'Bernardelli', :zip_code => '87.805-000', :state => state); c.save 
c = City.new(:name => 'Jardinopolis', :zip_code => '86.335-000', :state => state); c.save 
c = City.new(:name => 'Tranqueira', :zip_code => '83.530-000', :state => state); c.save 
c = City.new(:name => 'Aricanduva', :zip_code => '86.719-000', :state => state); c.save 
c = City.new(:name => 'Ourizona', :zip_code => '87.170-000', :state => state); c.save 
c = City.new(:name => 'Saudade Do Iguacu', :zip_code => '85.568-000', :state => state); c.save 
c = City.new(:name => 'Ilha Dos Valadares', :zip_code => '83.252-000', :state => state); c.save 
c = City.new(:name => 'Emboque', :zip_code => '83.150-000', :state => state); c.save 
c = City.new(:name => 'Colonia Acioli', :zip_code => '83.151-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '83.152-000', :state => state); c.save 
c = City.new(:name => 'Barro Preto', :zip_code => '83.153-000', :state => state); c.save 
c = City.new(:name => 'Campina Do Miranguava', :zip_code => '83.154-000', :state => state); c.save 
c = City.new(:name => 'Inspetor Carvalho', :zip_code => '83.155-000', :state => state); c.save 
c = City.new(:name => 'Gamela', :zip_code => '83.156-000', :state => state); c.save 
c = City.new(:name => 'Morro Alto', :zip_code => '83.157-000', :state => state); c.save 
c = City.new(:name => 'Despique', :zip_code => '83.158-000', :state => state); c.save 
c = City.new(:name => 'Campina', :zip_code => '83.159-000', :state => state); c.save 
c = City.new(:name => 'Olho Agudo', :zip_code => '83.160-000', :state => state); c.save 
c = City.new(:name => 'Campina Dos Furtados', :zip_code => '83.161-000', :state => state); c.save 
c = City.new(:name => 'Colonia Santos Andrade', :zip_code => '83.162-000', :state => state); c.save 
c = City.new(:name => 'Faxina', :zip_code => '83.163-000', :state => state); c.save 
c = City.new(:name => 'Roca Velha', :zip_code => '83.164-000', :state => state); c.save 
c = City.new(:name => 'Colonia Castelhanos', :zip_code => '83.165-000', :state => state); c.save 
c = City.new(:name => 'Ilha Do Mel', :zip_code => '83.251-000', :state => state); c.save 
c = City.new(:name => 'Emboguacu', :zip_code => '83.251-250', :state => state); c.save 
c = City.new(:name => 'Ponta Do Pasto', :zip_code => '83.251-300', :state => state); c.save 
c = City.new(:name => 'Itinga', :zip_code => '83.251-350', :state => state); c.save 
c = City.new(:name => 'Europa', :zip_code => '83.251-400', :state => state); c.save 
c = City.new(:name => 'Tambarutaca', :zip_code => '83.251-450', :state => state); c.save 
c = City.new(:name => 'Piassuguera', :zip_code => '83.251-500', :state => state); c.save 
c = City.new(:name => 'Rio Das Pedras', :zip_code => '83.251-550', :state => state); c.save 
c = City.new(:name => 'Morro Ingles', :zip_code => '83.251-650', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '83.251-700', :state => state); c.save 
c = City.new(:name => 'Maria Luiza', :zip_code => '83.251-750', :state => state); c.save 
c = City.new(:name => 'Rio Das Pombas', :zip_code => '83.251-800', :state => state); c.save 
c = City.new(:name => 'Colonia Pereira', :zip_code => '83.251-850', :state => state); c.save 
c = City.new(:name => 'Estacao Roca Nova', :zip_code => '83.319-000', :state => state); c.save 
c = City.new(:name => 'Nova Tirol', :zip_code => '83.319-300', :state => state); c.save 
c = City.new(:name => 'Emboque', :zip_code => '83.319-600', :state => state); c.save 
c = City.new(:name => 'Aranha', :zip_code => '83.419-000', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel', :zip_code => '83.419-200', :state => state); c.save 
c = City.new(:name => 'Jardim Paulista', :zip_code => '83.419-500', :state => state); c.save 
c = City.new(:name => 'Timbu Velho', :zip_code => '83.419-700', :state => state); c.save 
c = City.new(:name => 'Betaras', :zip_code => '83.531-000', :state => state); c.save 
c = City.new(:name => 'Tijuco Preto', :zip_code => '83.532-000', :state => state); c.save 
c = City.new(:name => 'Meia-lua', :zip_code => '83.533-000', :state => state); c.save 
c = City.new(:name => 'Capivara', :zip_code => '83.534-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '83.649-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '83.649-050', :state => state); c.save 
c = City.new(:name => 'Santa Quiteria', :zip_code => '83.649-100', :state => state); c.save 
c = City.new(:name => 'Itambe', :zip_code => '83.649-150', :state => state); c.save 
c = City.new(:name => 'Conceicao', :zip_code => '83.649-200', :state => state); c.save 
c = City.new(:name => 'Vista Bonita', :zip_code => '83.649-250', :state => state); c.save 
c = City.new(:name => 'Lavra', :zip_code => '83.649-300', :state => state); c.save 
c = City.new(:name => 'Campina', :zip_code => '83.649-350', :state => state); c.save 
c = City.new(:name => 'Javacae', :zip_code => '83.649-400', :state => state); c.save 
c = City.new(:name => 'Cerne', :zip_code => '83.649-450', :state => state); c.save 
c = City.new(:name => 'Retiro Grande', :zip_code => '83.649-500', :state => state); c.save 
c = City.new(:name => 'Passo Fundo', :zip_code => '83.649-600', :state => state); c.save 
c = City.new(:name => 'Dom Rodrigo', :zip_code => '83.649-650', :state => state); c.save 
c = City.new(:name => 'Felpudo', :zip_code => '83.649-700', :state => state); c.save 
c = City.new(:name => 'Itaqui', :zip_code => '83.649-800', :state => state); c.save 
c = City.new(:name => 'Campinas', :zip_code => '83.649-900', :state => state); c.save 
c = City.new(:name => 'Colonia Cristina', :zip_code => '83.729-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel', :zip_code => '83.729-100', :state => state); c.save 
c = City.new(:name => 'Passa Una', :zip_code => '83.729-200', :state => state); c.save 
c = City.new(:name => 'Ipiranga', :zip_code => '83.729-300', :state => state); c.save 
c = City.new(:name => 'Tomaz Coelho', :zip_code => '83.729-400', :state => state); c.save 
c = City.new(:name => 'Estacao General Lucio', :zip_code => '83.729-500', :state => state); c.save 
c = City.new(:name => 'Tindiquera', :zip_code => '83.729-600', :state => state); c.save 
c = City.new(:name => 'Costeira', :zip_code => '83.729-700', :state => state); c.save 
c = City.new(:name => 'Martins', :zip_code => '83.729-800', :state => state); c.save 
c = City.new(:name => 'Campestrinho', :zip_code => '83.729-900', :state => state); c.save 
c = City.new(:name => 'Bocaina', :zip_code => '84.125-200', :state => state); c.save 
c = City.new(:name => 'Lajeado', :zip_code => '84.125-300', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '84.125-400', :state => state); c.save 
c = City.new(:name => 'Pitangui', :zip_code => '84.125-500', :state => state); c.save 
c = City.new(:name => 'Trindade', :zip_code => '84.125-600', :state => state); c.save 
c = City.new(:name => 'Ferreiras', :zip_code => '84.125-700', :state => state); c.save 
c = City.new(:name => 'Pocinho', :zip_code => '84.125-800', :state => state); c.save 
c = City.new(:name => 'Barra Grande', :zip_code => '84.125-900', :state => state); c.save 
c = City.new(:name => 'Conchas Velhas', :zip_code => '84.126-000', :state => state); c.save 
c = City.new(:name => 'Taquari Dos Polacos', :zip_code => '84.126-100', :state => state); c.save 
c = City.new(:name => 'Centenario', :zip_code => '84.126-200', :state => state); c.save 
c = City.new(:name => 'Passo Dos Pupos', :zip_code => '84.126-300', :state => state); c.save 
c = City.new(:name => 'Cerrado Grande', :zip_code => '84.126-400', :state => state); c.save 
c = City.new(:name => 'Jaburu', :zip_code => '84.126-500', :state => state); c.save 
c = City.new(:name => 'Botuquara', :zip_code => '84.126-600', :state => state); c.save 
c = City.new(:name => 'Roca Velha', :zip_code => '84.126-700', :state => state); c.save 
c = City.new(:name => 'Taquari Dos Russos', :zip_code => '84.126-800', :state => state); c.save 
c = City.new(:name => 'Cara-cara', :zip_code => '84.126-900', :state => state); c.save 
c = City.new(:name => 'Valentins', :zip_code => '84.127-000', :state => state); c.save 
c = City.new(:name => 'Colonia Tapera', :zip_code => '84.127-100', :state => state); c.save 
c = City.new(:name => 'Carazinho', :zip_code => '84.127-200', :state => state); c.save 
c = City.new(:name => 'Cerro Velho', :zip_code => '84.127-300', :state => state); c.save 
c = City.new(:name => 'Mato Queimado', :zip_code => '84.127-400', :state => state); c.save 
c = City.new(:name => 'Capao Grande', :zip_code => '84.127-500', :state => state); c.save 
c = City.new(:name => 'Sete Saltos De Cima', :zip_code => '84.127-600', :state => state); c.save 
c = City.new(:name => 'Cambiju', :zip_code => '84.127-700', :state => state); c.save 
c = City.new(:name => 'Lagoa Dourada', :zip_code => '84.127-800', :state => state); c.save 
c = City.new(:name => 'Jaboticabal', :zip_code => '84.128-000', :state => state); c.save 
c = City.new(:name => 'Vila Velha', :zip_code => '84.128-200', :state => state); c.save 
c = City.new(:name => 'Campo Do Meio', :zip_code => '84.128-400', :state => state); c.save 
c = City.new(:name => 'Faxinal Santa Cruz', :zip_code => '84.128-600', :state => state); c.save 
c = City.new(:name => 'Serraria Klas', :zip_code => '84.128-800', :state => state); c.save 
c = City.new(:name => 'Taquara', :zip_code => '84.193-000', :state => state); c.save 
c = City.new(:name => 'Lagoa', :zip_code => '84.193-100', :state => state); c.save 
c = City.new(:name => 'Sao Cirilo', :zip_code => '84.193-200', :state => state); c.save 
c = City.new(:name => 'Guararema', :zip_code => '84.193-300', :state => state); c.save 
c = City.new(:name => 'Tijuco Preto', :zip_code => '84.193-400', :state => state); c.save 
c = City.new(:name => 'Colonia Iapo', :zip_code => '84.193-500', :state => state); c.save 
c = City.new(:name => 'Rio Abaixo', :zip_code => '84.193-600', :state => state); c.save 
c = City.new(:name => 'Pedras', :zip_code => '84.193-700', :state => state); c.save 
c = City.new(:name => 'Bulcao', :zip_code => '84.193-800', :state => state); c.save 
c = City.new(:name => 'Cunhaporanga', :zip_code => '84.193-900', :state => state); c.save 
c = City.new(:name => 'Santa Quiteria', :zip_code => '84.194-000', :state => state); c.save 
c = City.new(:name => 'Agostinho', :zip_code => '84.194-200', :state => state); c.save 
c = City.new(:name => 'Caxambu', :zip_code => '84.194-300', :state => state); c.save 
c = City.new(:name => 'Casa Nova', :zip_code => '84.194-400', :state => state); c.save 
c = City.new(:name => 'Andorinhas', :zip_code => '84.194-500', :state => state); c.save 
c = City.new(:name => 'Santa Clara', :zip_code => '84.194-600', :state => state); c.save 
c = City.new(:name => 'Ribeirao Do Pinheiro', :zip_code => '84.194-700', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '84.194-800', :state => state); c.save 
c = City.new(:name => 'Fundao', :zip_code => '84.194-900', :state => state); c.save 
c = City.new(:name => 'Capao Alto', :zip_code => '84.196-000', :state => state); c.save 
c = City.new(:name => 'Tanque Grande', :zip_code => '84.196-100', :state => state); c.save 
c = City.new(:name => 'Colonia Castrolanda', :zip_code => '84.196-200', :state => state); c.save 
c = City.new(:name => 'Lagoa Bonita', :zip_code => '84.196-400', :state => state); c.save 
c = City.new(:name => 'Conceicao', :zip_code => '84.196-500', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco', :zip_code => '84.196-600', :state => state); c.save 
c = City.new(:name => 'Palmital', :zip_code => '84.196-700', :state => state); c.save 
c = City.new(:name => 'Palmeirinha', :zip_code => '84.196-800', :state => state); c.save 
c = City.new(:name => 'Itapanhacanga', :zip_code => '84.196-900', :state => state); c.save 
c = City.new(:name => 'Paiol Queimado', :zip_code => '84.197-000', :state => state); c.save 
c = City.new(:name => 'Barrinha', :zip_code => '84.197-200', :state => state); c.save 
c = City.new(:name => 'Lagoa Dos Ribas', :zip_code => '84.197-300', :state => state); c.save 
c = City.new(:name => 'Tronco', :zip_code => '84.197-400', :state => state); c.save 
c = City.new(:name => 'Maracana', :zip_code => '84.197-500', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '84.197-600', :state => state); c.save 
c = City.new(:name => 'Agua Vermelha', :zip_code => '84.197-700', :state => state); c.save 
c = City.new(:name => 'Retiro', :zip_code => '84.197-800', :state => state); c.save 
c = City.new(:name => 'Invernada', :zip_code => '84.197-900', :state => state); c.save 
c = City.new(:name => 'Vargeado', :zip_code => '84.198-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '84.198-200', :state => state); c.save 
c = City.new(:name => 'Olho Dagua', :zip_code => '84.198-300', :state => state); c.save 
c = City.new(:name => 'Areias', :zip_code => '84.198-400', :state => state); c.save 
c = City.new(:name => 'Macaco', :zip_code => '84.198-600', :state => state); c.save 
c = City.new(:name => 'Lajeado', :zip_code => '84.198-700', :state => state); c.save 
c = City.new(:name => 'Serrinha', :zip_code => '84.199-000', :state => state); c.save 
c = City.new(:name => 'Capoeirinha', :zip_code => '84.199-400', :state => state); c.save 
c = City.new(:name => 'Catanduvas', :zip_code => '84.199-800', :state => state); c.save 
c = City.new(:name => 'Antas', :zip_code => '84.277-000', :state => state); c.save 
c = City.new(:name => 'Prata Um', :zip_code => '84.277-200', :state => state); c.save 
c = City.new(:name => 'Bairro Do Felisberto', :zip_code => '84.277-300', :state => state); c.save 
c = City.new(:name => 'Laranja Azeda', :zip_code => '84.277-400', :state => state); c.save 
c = City.new(:name => 'Acampamento Das Minas', :zip_code => '84.277-500', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '84.277-600', :state => state); c.save 
c = City.new(:name => 'Alto Amparo', :zip_code => '84.277-700', :state => state); c.save 
c = City.new(:name => 'Guardamoria', :zip_code => '84.277-800', :state => state); c.save 
c = City.new(:name => 'Olaria', :zip_code => '84.277-900', :state => state); c.save 
c = City.new(:name => 'Lagoa', :zip_code => '84.279-000', :state => state); c.save 
c = City.new(:name => 'Km 30', :zip_code => '84.279-100', :state => state); c.save 
c = City.new(:name => 'Lagoinha', :zip_code => '84.279-200', :state => state); c.save 
c = City.new(:name => 'Imbauzinho', :zip_code => '84.279-300', :state => state); c.save 
c = City.new(:name => 'Regiao Dos Valos', :zip_code => '84.279-500', :state => state); c.save 
c = City.new(:name => 'Miranda', :zip_code => '84.279-600', :state => state); c.save 
c = City.new(:name => 'Diamante', :zip_code => '84.279-700', :state => state); c.save 
c = City.new(:name => 'Faisqueira', :zip_code => '84.279-800', :state => state); c.save 
c = City.new(:name => 'Sao Francisco', :zip_code => '85.101-000', :state => state); c.save 
c = City.new(:name => 'Lavrinha', :zip_code => '85.102-000', :state => state); c.save 
c = City.new(:name => 'Gois', :zip_code => '85.103-000', :state => state); c.save 
c = City.new(:name => 'Despraiado', :zip_code => '85.104-000', :state => state); c.save 
c = City.new(:name => 'Paiquere', :zip_code => '85.105-000', :state => state); c.save 
c = City.new(:name => 'Cara Pintado', :zip_code => '85.106-000', :state => state); c.save 
c = City.new(:name => 'Campina', :zip_code => '85.107-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '85.109-000', :state => state); c.save 
c = City.new(:name => 'Corvo', :zip_code => '85.111-000', :state => state); c.save 
c = City.new(:name => 'Marrecas', :zip_code => '85.112-000', :state => state); c.save 
c = City.new(:name => 'Taipa', :zip_code => '85.115-000', :state => state); c.save 
c = City.new(:name => 'Fueros', :zip_code => '85.116-000', :state => state); c.save 
c = City.new(:name => 'Matinhos', :zip_code => '85.117-000', :state => state); c.save 
c = City.new(:name => 'Rondinha', :zip_code => '85.119-000', :state => state); c.save 
c = City.new(:name => 'Capao Da Lagoa', :zip_code => '85.120-000', :state => state); c.save 
c = City.new(:name => 'Capao Rico', :zip_code => '85.121-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro', :zip_code => '85.122-000', :state => state); c.save 
c = City.new(:name => 'Fiusas', :zip_code => '85.123-000', :state => state); c.save 
c = City.new(:name => 'Faxinal Dos Elias', :zip_code => '85.124-000', :state => state); c.save 
c = City.new(:name => 'Agua Mineral', :zip_code => '85.126-000', :state => state); c.save 
c = City.new(:name => 'Igrejinha', :zip_code => '85.127-000', :state => state); c.save 
c = City.new(:name => 'Pelado', :zip_code => '85.128-000', :state => state); c.save 
c = City.new(:name => 'Invernadinha', :zip_code => '85.129-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Mortes', :zip_code => '85.130-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Pedras', :zip_code => '85.131-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Grande', :zip_code => '85.132-000', :state => state); c.save 
c = City.new(:name => 'Macucos', :zip_code => '85.134-000', :state => state); c.save 
c = City.new(:name => 'Barreiro', :zip_code => '85.136-000', :state => state); c.save 
c = City.new(:name => 'Tres Capoes', :zip_code => '85.137-000', :state => state); c.save 
c = City.new(:name => 'Maita', :zip_code => '85.137-100', :state => state); c.save 
c = City.new(:name => 'Fazenda Dos Barbosas', :zip_code => '85.137-200', :state => state); c.save 
c = City.new(:name => 'Tres Pinheiros', :zip_code => '85.137-300', :state => state); c.save 
c = City.new(:name => 'Lagoa Seca', :zip_code => '85.137-400', :state => state); c.save 
c = City.new(:name => 'Coitinho', :zip_code => '85.137-500', :state => state); c.save 
c = City.new(:name => 'Bairro Cachoeira', :zip_code => '85.137-600', :state => state); c.save 
c = City.new(:name => 'Queimados', :zip_code => '85.137-900', :state => state); c.save 
c = City.new(:name => 'Mandacaia', :zip_code => '85.138-000', :state => state); c.save 
c = City.new(:name => 'Curucaca', :zip_code => '85.138-200', :state => state); c.save 
c = City.new(:name => 'Samambaia', :zip_code => '85.138-300', :state => state); c.save 
c = City.new(:name => 'Alto Sabia', :zip_code => '85.138-400', :state => state); c.save 
c = City.new(:name => 'Capao Bonito', :zip_code => '85.138-500', :state => state); c.save 
c = City.new(:name => 'Jordaozinho', :zip_code => '85.138-600', :state => state); c.save 
c = City.new(:name => 'Banhado', :zip_code => '85.138-700', :state => state); c.save 
c = City.new(:name => 'Capao Alto', :zip_code => '85.138-800', :state => state); c.save 
c = City.new(:name => 'Encruzilhada', :zip_code => '85.138-900', :state => state); c.save 
c = City.new(:name => 'Socorro', :zip_code => '85.139-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao', :zip_code => '85.139-200', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha', :zip_code => '85.139-300', :state => state); c.save 
c = City.new(:name => 'Agua Branca', :zip_code => '85.139-500', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '85.139-700', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso', :zip_code => '85.139-900', :state => state); c.save 
c = City.new(:name => 'Uniao', :zip_code => '85.321-000', :state => state); c.save 
c = City.new(:name => 'Antas', :zip_code => '85.322-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio', :zip_code => '85.323-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao', :zip_code => '85.324-000', :state => state); c.save 
c = City.new(:name => 'Gaviao', :zip_code => '85.325-000', :state => state); c.save 
c = City.new(:name => 'Herval Grande', :zip_code => '85.326-000', :state => state); c.save 
c = City.new(:name => 'Sertaozinho', :zip_code => '85.327-000', :state => state); c.save 
c = City.new(:name => 'Caixa Prego', :zip_code => '85.328-000', :state => state); c.save 
c = City.new(:name => 'Agua Do Boi', :zip_code => '85.329-000', :state => state); c.save 
c = City.new(:name => 'Barra Mansa', :zip_code => '85.331-000', :state => state); c.save 
c = City.new(:name => 'Pinhal Preto', :zip_code => '85.332-000', :state => state); c.save 
c = City.new(:name => 'Barra Grande', :zip_code => '85.333-000', :state => state); c.save 
c = City.new(:name => 'Quebra Freio', :zip_code => '85.514-000', :state => state); c.save 
c = City.new(:name => 'Colonia Dom Carlos', :zip_code => '85.514-100', :state => state); c.save 
c = City.new(:name => 'Sao Gotardo', :zip_code => '85.514-150', :state => state); c.save 
c = City.new(:name => 'Tiradentes', :zip_code => '85.514-200', :state => state); c.save 
c = City.new(:name => 'Bom Retiro', :zip_code => '85.514-250', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '85.514-300', :state => state); c.save 
c = City.new(:name => 'Teolandia', :zip_code => '85.514-350', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '85.514-400', :state => state); c.save 
c = City.new(:name => 'Sao Braz', :zip_code => '85.514-450', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha', :zip_code => '85.514-500', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Carmo', :zip_code => '85.514-550', :state => state); c.save 
c = City.new(:name => 'Independencia', :zip_code => '85.514-600', :state => state); c.save 
c = City.new(:name => 'Passo Da Ilha', :zip_code => '85.514-700', :state => state); c.save 
c = City.new(:name => 'Vila Dos Roldos', :zip_code => '85.514-800', :state => state); c.save 
c = City.new(:name => 'Encruzilhada', :zip_code => '85.514-900', :state => state); c.save 
c = City.new(:name => 'Barra Bonita', :zip_code => '85.609-100', :state => state); c.save 
c = City.new(:name => 'Guarapuavinha', :zip_code => '85.609-150', :state => state); c.save 
c = City.new(:name => 'Rio Do Mato', :zip_code => '85.609-200', :state => state); c.save 
c = City.new(:name => 'Sede Progresso', :zip_code => '85.609-250', :state => state); c.save 
c = City.new(:name => 'Santa Rosa', :zip_code => '85.609-300', :state => state); c.save 
c = City.new(:name => 'Sao Miguel', :zip_code => '85.609-350', :state => state); c.save 
c = City.new(:name => 'Progresso', :zip_code => '85.609-400', :state => state); c.save 
c = City.new(:name => 'Jacare', :zip_code => '85.609-450', :state => state); c.save 
c = City.new(:name => 'Gaucha', :zip_code => '85.609-500', :state => state); c.save 
c = City.new(:name => 'Rio Quatorze', :zip_code => '85.609-600', :state => state); c.save 
c = City.new(:name => 'Fazendinha', :zip_code => '85.609-700', :state => state); c.save 
c = City.new(:name => 'Rio Saudade', :zip_code => '85.609-800', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Lopei', :zip_code => '85.822-500', :state => state); c.save 
c = City.new(:name => 'Colonia Centenario', :zip_code => '85.822-550', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '85.822-600', :state => state); c.save 
c = City.new(:name => 'Colonia Melissa', :zip_code => '85.822-650', :state => state); c.save 
c = City.new(:name => 'Barro Preto', :zip_code => '85.822-700', :state => state); c.save 
c = City.new(:name => 'Colonia Sapucai', :zip_code => '85.822-750', :state => state); c.save 
c = City.new(:name => 'Aroeira', :zip_code => '85.822-800', :state => state); c.save 
c = City.new(:name => 'Rio Novo', :zip_code => '85.822-850', :state => state); c.save 
c = City.new(:name => 'Colonia Esperanca', :zip_code => '85.822-900', :state => state); c.save 
c = City.new(:name => 'Barreiro', :zip_code => '85.822-950', :state => state); c.save 
c = City.new(:name => 'Centralito', :zip_code => '85.823-500', :state => state); c.save 
c = City.new(:name => 'Rio Das Antas', :zip_code => '85.823-550', :state => state); c.save 
c = City.new(:name => 'Central Lupion', :zip_code => '85.823-600', :state => state); c.save 
c = City.new(:name => 'Colonia Sao Jose', :zip_code => '85.823-650', :state => state); c.save 
c = City.new(:name => 'Bom Retiro', :zip_code => '85.823-700', :state => state); c.save 
c = City.new(:name => 'Cachoeira', :zip_code => '85.823-750', :state => state); c.save 
c = City.new(:name => 'Salto Portao', :zip_code => '85.823-800', :state => state); c.save 
c = City.new(:name => 'Sao Braz', :zip_code => '85.823-850', :state => state); c.save 
c = City.new(:name => 'Rio Saltinho', :zip_code => '85.823-900', :state => state); c.save 
c = City.new(:name => 'Alto Para', :zip_code => '85.823-950', :state => state); c.save 
c = City.new(:name => 'Olaria', :zip_code => '85.824-500', :state => state); c.save 
c = City.new(:name => 'Gamadinho', :zip_code => '85.824-600', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora De Lourdes', :zip_code => '85.824-650', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '85.824-700', :state => state); c.save 
c = City.new(:name => 'Arquimedes', :zip_code => '85.824-750', :state => state); c.save 
c = City.new(:name => 'Fazenda Jangada', :zip_code => '85.824-800', :state => state); c.save 
c = City.new(:name => 'Fazenda Do Brigadeiro', :zip_code => '85.824-850', :state => state); c.save 
c = City.new(:name => 'Portao', :zip_code => '85.824-900', :state => state); c.save 
c = City.new(:name => 'Porto Belo', :zip_code => '85.874-000', :state => state); c.save 
c = City.new(:name => 'Tres Lagoas', :zip_code => '85.874-200', :state => state); c.save 
c = City.new(:name => 'Porto Meira', :zip_code => '85.874-400', :state => state); c.save 
c = City.new(:name => 'Porto San Juan', :zip_code => '85.874-700', :state => state); c.save 
c = City.new(:name => 'Doutor Ernesto', :zip_code => '85.926-500', :state => state); c.save 
c = City.new(:name => 'Dois Marcos', :zip_code => '85.926-550', :state => state); c.save 
c = City.new(:name => 'Nova Brasilia', :zip_code => '85.926-600', :state => state); c.save 
c = City.new(:name => 'Linha Giacomini', :zip_code => '85.926-650', :state => state); c.save 
c = City.new(:name => 'Vila Florida', :zip_code => '85.926-700', :state => state); c.save 
c = City.new(:name => 'Ipiranga', :zip_code => '85.926-750', :state => state); c.save 
c = City.new(:name => 'Sao Paulo', :zip_code => '85.926-800', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '85.926-850', :state => state); c.save 
c = City.new(:name => 'Tres Bocas', :zip_code => '85.926-900', :state => state); c.save 
c = City.new(:name => 'Nova Videira', :zip_code => '85.926-950', :state => state); c.save 
c = City.new(:name => 'Nova Concordia', :zip_code => '85.927-500', :state => state); c.save 
c = City.new(:name => 'General Osorio', :zip_code => '85.927-550', :state => state); c.save 
c = City.new(:name => 'Xaxim', :zip_code => '85.927-600', :state => state); c.save 
c = City.new(:name => 'Memoria', :zip_code => '85.927-700', :state => state); c.save 
c = City.new(:name => 'Lopei', :zip_code => '85.927-800', :state => state); c.save 
c = City.new(:name => 'Tapui', :zip_code => '85.927-850', :state => state); c.save 
c = City.new(:name => 'Sede Chaparral', :zip_code => '85.927-900', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel', :zip_code => '86.199-000', :state => state); c.save 
c = City.new(:name => 'Santa Lurdes', :zip_code => '86.199-200', :state => state); c.save 
c = City.new(:name => 'Cascatinha', :zip_code => '86.199-400', :state => state); c.save 
c = City.new(:name => 'Caramuru', :zip_code => '86.199-600', :state => state); c.save 
c = City.new(:name => 'Serrinha', :zip_code => '86.199-800', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '86.718-000', :state => state); c.save 
c = City.new(:name => 'Barreiros', :zip_code => '86.817-500', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '86.818-500', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '86.819-500', :state => state); c.save 
c = City.new(:name => 'Altaneira', :zip_code => '87.108-000', :state => state); c.save 
c = City.new(:name => 'Sao Marcos', :zip_code => '86.101-000', :state => state); c.save 
c = City.new(:name => 'Bairro Limoeiro', :zip_code => '86.102-000', :state => state); c.save 
c = City.new(:name => 'Sao Leonardo', :zip_code => '86.103-000', :state => state); c.save 
c = City.new(:name => 'Santa Margarida', :zip_code => '86.104-000', :state => state); c.save 
c = City.new(:name => 'Espirito Santo', :zip_code => '86.106-000', :state => state); c.save 
c = City.new(:name => 'Jardim', :zip_code => '86.107-000', :state => state); c.save 
c = City.new(:name => 'Selva', :zip_code => '86.108-000', :state => state); c.save 
c = City.new(:name => 'Ponta Grossa', :zip_code => '86.109-000', :state => state); c.save 
c = City.new(:name => 'Taquaruna', :zip_code => '86.113-000', :state => state); c.save 
c = City.new(:name => 'Guairaca', :zip_code => '86.114-000', :state => state); c.save 
c = City.new(:name => 'Colonia Saude', :zip_code => '86.118-000', :state => state); c.save 
c = City.new(:name => 'Barro Preto', :zip_code => '86.119-000', :state => state); c.save 
c = City.new(:name => 'Sutis', :zip_code => '86.122-000', :state => state); c.save 
c = City.new(:name => 'Silvolandia', :zip_code => '87.315-000', :state => state); c.save 
c = City.new(:name => 'Vila Roberto Brzezinski', :zip_code => '87.315-300', :state => state); c.save 
c = City.new(:name => 'Barreiro Das Frutas', :zip_code => '87.315-600', :state => state); c.save 
c = City.new(:name => 'Sao Bento', :zip_code => '87.316-000', :state => state); c.save 
c = City.new(:name => 'Usina', :zip_code => '87.316-300', :state => state); c.save 
c = City.new(:name => 'Barras', :zip_code => '87.316-600', :state => state); c.save 
c = City.new(:name => 'Serrinha', :zip_code => '87.316-800', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '87.317-000', :state => state); c.save 
c = City.new(:name => 'Sao Luiz', :zip_code => '87.317-300', :state => state); c.save 
c = City.new(:name => 'Sao Joao', :zip_code => '87.317-600', :state => state); c.save 
c = City.new(:name => 'Tres Placas', :zip_code => '87.523-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Boa Vista', :zip_code => '87.523-100', :state => state); c.save 
c = City.new(:name => 'Alto Alegre', :zip_code => '87.523-200', :state => state); c.save 
c = City.new(:name => 'Formigone', :zip_code => '87.523-300', :state => state); c.save 
c = City.new(:name => 'Pau Dalho Do Sul', :zip_code => '86.224-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova', :zip_code => '85.218-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova De Florenca', :zip_code => '86.278-000', :state => state); c.save 
c = City.new(:name => 'Borda Do Campo De Sao Sebastiao', :zip_code => '83.170-000', :state => state); c.save 
c = City.new(:name => 'Marcelino', :zip_code => '83.168-000', :state => state); c.save 
c = City.new(:name => 'Sao Marcos', :zip_code => '83.175-000', :state => state); c.save 
c = City.new(:name => 'Vitoria', :zip_code => '85.139-400', :state => state); c.save 

