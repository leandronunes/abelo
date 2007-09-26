#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Rio de Janeiro')
state ||= State.create!( :name => 'Rio de Janeiro', :code => 'RJ', :country => country);

c = City.new(:name => 'Abarracamento', :zip_code => '27.670-000', :state => state); c.save 
c = City.new(:name => 'Abraao', :zip_code => '23.960-000', :state => state); c.save 
c = City.new(:name => 'Afonso Arinos', :zip_code => '25.875-000', :state => state); c.save 
c = City.new(:name => 'Agulhas Negras', :zip_code => '27.500-000', :state => state); c.save 
c = City.new(:name => 'Amparo', :zip_code => '28.600-000', :state => state); c.save 
c = City.new(:name => 'Andrade Pinto', :zip_code => '27.770-000', :state => state); c.save 
c = City.new(:name => 'Angra Dos Reis', :zip_code => '23.900-000', :state => state); c.save 
c = City.new(:name => 'Anta', :zip_code => '25.882-000', :state => state); c.save 
c = City.new(:name => 'Aperibe', :zip_code => '28.495-000', :state => state); c.save 
c = City.new(:name => 'Araruama', :zip_code => '28.970-000', :state => state); c.save 
c = City.new(:name => 'Areal', :zip_code => '25.845-000', :state => state); c.save 
c = City.new(:name => 'Armacao De Buzios', :zip_code => '28.950-000', :state => state); c.save 
c = City.new(:name => 'Arraial Do Cabo', :zip_code => '28.930-000', :state => state); c.save 
c = City.new(:name => 'Arrozal', :zip_code => '27.185-000', :state => state); c.save 
c = City.new(:name => 'Avelar', :zip_code => '26.980-000', :state => state); c.save 
c = City.new(:name => 'Bacaxa', :zip_code => '28.993-000', :state => state); c.save 
c = City.new(:name => 'Baltazar', :zip_code => '28.473-000', :state => state); c.save 
c = City.new(:name => 'Banquete', :zip_code => '28.662-000', :state => state); c.save 
c = City.new(:name => 'Barao De Juparana', :zip_code => '27.640-000', :state => state); c.save 
c = City.new(:name => 'Barcelos', :zip_code => '28.220-000', :state => state); c.save 
c = City.new(:name => 'Barra Alegre', :zip_code => '28.666-000', :state => state); c.save 
c = City.new(:name => 'Barra De Macae', :zip_code => '27.900-000', :state => state); c.save 
c = City.new(:name => 'Barra De Sao Joao', :zip_code => '28.880-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Pirai', :zip_code => '27.000-000', :state => state); c.save 
c = City.new(:name => 'Barra Mansa', :zip_code => '27.300-000', :state => state); c.save 
c = City.new(:name => 'Barra Seca', :zip_code => '28.240-000', :state => state); c.save 
c = City.new(:name => 'Belford Roxo', :zip_code => '26.100-000', :state => state); c.save 
c = City.new(:name => 'Bemposta', :zip_code => '25.840-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '28.810-000', :state => state); c.save 
c = City.new(:name => 'Boa Sorte', :zip_code => '28.525-000', :state => state); c.save 
c = City.new(:name => 'Boa Ventura', :zip_code => '28.340-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim', :zip_code => '28.660-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Itabapoana', :zip_code => '28.360-000', :state => state); c.save 
c = City.new(:name => 'Cabo Frio', :zip_code => '28.900-000', :state => state); c.save 
c = City.new(:name => 'Cabucu', :zip_code => '24.860-000', :state => state); c.save 
c = City.new(:name => 'Cachoeiras De Macacu', :zip_code => '28.680-000', :state => state); c.save 
c = City.new(:name => 'Cachoeiros', :zip_code => '27.990-000', :state => state); c.save 
c = City.new(:name => 'Calheiros', :zip_code => '28.368-000', :state => state); c.save 
c = City.new(:name => 'Cambiasca', :zip_code => '28.425-000', :state => state); c.save 
c = City.new(:name => 'Cambuci', :zip_code => '28.430-000', :state => state); c.save 
c = City.new(:name => 'Campo Do Coelho', :zip_code => '28.600-000', :state => state); c.save 
c = City.new(:name => 'Campos Dos Goytacazes', :zip_code => '28.000-000', :state => state); c.save 
c = City.new(:name => 'Campos Elyseos', :zip_code => '25.000-000', :state => state); c.save 
c = City.new(:name => 'Cantagalo', :zip_code => '28.500-000', :state => state); c.save 
c = City.new(:name => 'Carabucu', :zip_code => '28.372-000', :state => state); c.save 
c = City.new(:name => 'Carapebus', :zip_code => '27.900-000', :state => state); c.save 
c = City.new(:name => 'Cardoso Moreira', :zip_code => '28.180-000', :state => state); c.save 
c = City.new(:name => 'Carmo', :zip_code => '28.640-000', :state => state); c.save 
c = City.new(:name => 'Cascatinha', :zip_code => '25.600-000', :state => state); c.save 
c = City.new(:name => 'Casimiro De Abreu', :zip_code => '28.860-000', :state => state); c.save 
c = City.new(:name => 'Cava', :zip_code => '26.000-000', :state => state); c.save 
c = City.new(:name => 'Coelho Da Rocha', :zip_code => '25.500-000', :state => state); c.save 
c = City.new(:name => 'Colonia', :zip_code => '28.420-000', :state => state); c.save 
c = City.new(:name => 'Comendador Levy Gasparian', :zip_code => '25.870-000', :state => state); c.save 
c = City.new(:name => 'Comendador Venancio', :zip_code => '28.348-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Jacarei', :zip_code => '23.885-000', :state => state); c.save 
c = City.new(:name => 'Conceicao De Macabu', :zip_code => '28.740-000', :state => state); c.save 
c = City.new(:name => 'Conrado', :zip_code => '26.920-000', :state => state); c.save 
c = City.new(:name => 'Conselheiro Paulino', :zip_code => '28.600-000', :state => state); c.save 
c = City.new(:name => 'Conservatoria', :zip_code => '27.655-000', :state => state); c.save 
c = City.new(:name => 'Cordeiro', :zip_code => '28.540-000', :state => state); c.save 
c = City.new(:name => 'Coroa Grande', :zip_code => '23.800-000', :state => state); c.save 
c = City.new(:name => 'Corrego Da Prata', :zip_code => '28.642-000', :state => state); c.save 
c = City.new(:name => 'Corrego Do Ouro', :zip_code => '27.980-000', :state => state); c.save 
c = City.new(:name => 'Correntezas', :zip_code => '28.830-000', :state => state); c.save 
c = City.new(:name => 'Cunhambebe', :zip_code => '23.907-000', :state => state); c.save 
c = City.new(:name => 'Dorandia', :zip_code => '27.160-000', :state => state); c.save 
c = City.new(:name => 'Dores De Macabu', :zip_code => '28.115-000', :state => state); c.save 
c = City.new(:name => 'Doutor Elias', :zip_code => '28.757-000', :state => state); c.save 
c = City.new(:name => 'Doutor Loreti', :zip_code => '28.772-000', :state => state); c.save 
c = City.new(:name => 'Duas Barras', :zip_code => '28.650-000', :state => state); c.save 
c = City.new(:name => 'Duque De Caxias', :zip_code => '25.000-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Passos', :zip_code => '27.555-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Paulo De Frontin', :zip_code => '26.650-000', :state => state); c.save 
c = City.new(:name => 'Engenheiro Pedreira', :zip_code => '26.000-000', :state => state); c.save 
c = City.new(:name => 'Estrada Nova', :zip_code => '28.590-000', :state => state); c.save 
c = City.new(:name => 'Euclidelandia', :zip_code => '28.520-000', :state => state); c.save 
c = City.new(:name => 'Falcao', :zip_code => '27.400-000', :state => state); c.save 
c = City.new(:name => 'Floriano', :zip_code => '27.300-000', :state => state); c.save 
c = City.new(:name => 'Fumaca', :zip_code => '27.550-000', :state => state); c.save 
c = City.new(:name => 'Funil', :zip_code => '28.440-000', :state => state); c.save 
c = City.new(:name => 'Gavioes', :zip_code => '28.825-000', :state => state); c.save 
c = City.new(:name => 'Getulandia', :zip_code => '27.465-000', :state => state); c.save 
c = City.new(:name => 'Glicerio', :zip_code => '27.985-000', :state => state); c.save 
c = City.new(:name => 'Governador Portela', :zip_code => '26.910-000', :state => state); c.save 
c = City.new(:name => 'Guapimirim', :zip_code => '25.940-000', :state => state); c.save 
c = City.new(:name => 'Guia De Pacobaiba', :zip_code => '25.930-000', :state => state); c.save 
c = City.new(:name => 'Ibitiguacu', :zip_code => '28.485-000', :state => state); c.save 
c = City.new(:name => 'Ibitioca', :zip_code => '28.120-000', :state => state); c.save 
c = City.new(:name => 'Ibituporanga', :zip_code => '23.800-000', :state => state); c.save 
c = City.new(:name => 'Iguaba Grande', :zip_code => '28.960-000', :state => state); c.save 
c = City.new(:name => 'Imbarie', :zip_code => '25.000-000', :state => state); c.save 
c = City.new(:name => 'Inconfidencia', :zip_code => '25.865-000', :state => state); c.save 
c = City.new(:name => 'Inhomirim', :zip_code => '25.935-000', :state => state); c.save 
c = City.new(:name => 'Inoa', :zip_code => '24.910-000', :state => state); c.save 
c = City.new(:name => 'Ipiabas', :zip_code => '27.170-000', :state => state); c.save 
c = City.new(:name => 'Ipiiba', :zip_code => '24.400-000', :state => state); c.save 
c = City.new(:name => 'Ipuca', :zip_code => '28.405-000', :state => state); c.save 
c = City.new(:name => 'Itabapoana', :zip_code => '28.245-000', :state => state); c.save 
c = City.new(:name => 'Itaborai', :zip_code => '24.800-000', :state => state); c.save 
c = City.new(:name => 'Itacurussa', :zip_code => '23.880-000', :state => state); c.save 
c = City.new(:name => 'Itaguai', :zip_code => '23.800-000', :state => state); c.save 
c = City.new(:name => 'Itaipava', :zip_code => '25.600-000', :state => state); c.save 
c = City.new(:name => 'Itaipu', :zip_code => '24.000-000', :state => state); c.save 
c = City.new(:name => 'Itajara', :zip_code => '28.345-000', :state => state); c.save 
c = City.new(:name => 'Italva', :zip_code => '28.250-000', :state => state); c.save 
c = City.new(:name => 'Itambi', :zip_code => '24.850-000', :state => state); c.save 
c = City.new(:name => 'Itaocara', :zip_code => '28.570-000', :state => state); c.save 
c = City.new(:name => 'Itaperuna', :zip_code => '28.300-000', :state => state); c.save 
c = City.new(:name => 'Itatiaia', :zip_code => '27.580-000', :state => state); c.save 
c = City.new(:name => 'Jacuecanga', :zip_code => '23.905-000', :state => state); c.save 
c = City.new(:name => 'Jaguarembe', :zip_code => '28.575-000', :state => state); c.save 
c = City.new(:name => 'Jamapara', :zip_code => '25.887-000', :state => state); c.save 
c = City.new(:name => 'Japeri', :zip_code => '26.400-000', :state => state); c.save 
c = City.new(:name => 'Japuiba', :zip_code => '28.685-000', :state => state); c.save 
c = City.new(:name => 'Laje Do Muriae', :zip_code => '28.350-000', :state => state); c.save 
c = City.new(:name => 'Laranjais', :zip_code => '28.580-000', :state => state); c.save 
c = City.new(:name => 'Lidice', :zip_code => '27.475-000', :state => state); c.save 
c = City.new(:name => 'Lumiar', :zip_code => '28.600-000', :state => state); c.save 
c = City.new(:name => 'Macabuzinho', :zip_code => '28.745-000', :state => state); c.save 
c = City.new(:name => 'Macae', :zip_code => '27.900-000', :state => state); c.save 
c = City.new(:name => 'Macuco', :zip_code => '28.545-000', :state => state); c.save 
c = City.new(:name => 'Mage', :zip_code => '25.900-000', :state => state); c.save 
c = City.new(:name => 'Mambucaba', :zip_code => '23.908-000', :state => state); c.save 
c = City.new(:name => 'Mangaratiba', :zip_code => '23.860-000', :state => state); c.save 
c = City.new(:name => 'Maniva', :zip_code => '28.235-000', :state => state); c.save 
c = City.new(:name => 'Manoel Ribeiro', :zip_code => '24.920-000', :state => state); c.save 
c = City.new(:name => 'Manuel Duarte', :zip_code => '27.690-000', :state => state); c.save 
c = City.new(:name => 'Marangatu', :zip_code => '28.476-000', :state => state); c.save 
c = City.new(:name => 'Marica', :zip_code => '24.900-000', :state => state); c.save 
c = City.new(:name => 'Mendes', :zip_code => '26.700-000', :state => state); c.save 
c = City.new(:name => 'Mesquita', :zip_code => '26.000-000', :state => state); c.save 
c = City.new(:name => 'Miguel Pereira', :zip_code => '26.900-000', :state => state); c.save 
c = City.new(:name => 'Miracema', :zip_code => '28.460-000', :state => state); c.save 
c = City.new(:name => 'Monera', :zip_code => '28.655-000', :state => state); c.save 
c = City.new(:name => 'Monjolo', :zip_code => '24.400-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre', :zip_code => '28.490-000', :state => state); c.save 
c = City.new(:name => 'Monte Verde', :zip_code => '28.445-000', :state => state); c.save 
c = City.new(:name => 'Monumento', :zip_code => '27.190-000', :state => state); c.save 
c = City.new(:name => 'Morangaba', :zip_code => '28.125-000', :state => state); c.save 
c = City.new(:name => 'Morro Do Coco', :zip_code => '28.178-000', :state => state); c.save 
c = City.new(:name => 'Morro Grande', :zip_code => '28.975-000', :state => state); c.save 
c = City.new(:name => 'Mussurepe', :zip_code => '28.143-000', :state => state); c.save 
c = City.new(:name => 'Natividade', :zip_code => '28.380-000', :state => state); c.save 
c = City.new(:name => 'Neves', :zip_code => '24.400-000', :state => state); c.save 
c = City.new(:name => 'Nhunguacu', :zip_code => '25.998-000', :state => state); c.save 
c = City.new(:name => 'Nilopolis', :zip_code => '26.500-000', :state => state); c.save 
c = City.new(:name => 'Niteroi', :zip_code => '24.000-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Aparecida', :zip_code => '25.886-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Penha', :zip_code => '28.335-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Amparo', :zip_code => '27.300-000', :state => state); c.save 
c = City.new(:name => 'Nova Friburgo', :zip_code => '28.600-000', :state => state); c.save 
c = City.new(:name => 'Nova Iguacu', :zip_code => '26.000-000', :state => state); c.save 
c = City.new(:name => 'Olinda', :zip_code => '26.500-000', :state => state); c.save 
c = City.new(:name => 'Ourania', :zip_code => '28.383-000', :state => state); c.save 
c = City.new(:name => 'Papucaia', :zip_code => '28.695-000', :state => state); c.save 
c = City.new(:name => 'Paquequer Pequeno', :zip_code => '25.996-000', :state => state); c.save 
c = City.new(:name => 'Paracambi', :zip_code => '26.600-000', :state => state); c.save 
c = City.new(:name => 'Paraiba Do Sul', :zip_code => '25.850-000', :state => state); c.save 
c = City.new(:name => 'Paraiso Do Tobias', :zip_code => '28.463-000', :state => state); c.save 
c = City.new(:name => 'Paraoquena', :zip_code => '28.483-000', :state => state); c.save 
c = City.new(:name => 'Parapeuna', :zip_code => '27.650-000', :state => state); c.save 
c = City.new(:name => 'Parati', :zip_code => '23.970-000', :state => state); c.save 
c = City.new(:name => 'Parati Mirim', :zip_code => '23.972-000', :state => state); c.save 
c = City.new(:name => 'Passa Tres', :zip_code => '27.470-000', :state => state); c.save 
c = City.new(:name => 'Paty Do Alferes', :zip_code => '26.950-000', :state => state); c.save 
c = City.new(:name => 'Pedra Selada', :zip_code => '27.560-000', :state => state); c.save 
c = City.new(:name => 'Pedro Do Rio', :zip_code => '25.600-000', :state => state); c.save 
c = City.new(:name => 'Penedo', :zip_code => '27.500-000', :state => state); c.save 
c = City.new(:name => 'Pentagna', :zip_code => '27.645-000', :state => state); c.save 
c = City.new(:name => 'Petropolis', :zip_code => '25.600-000', :state => state); c.save 
c = City.new(:name => 'Piabeta', :zip_code => '25.915-000', :state => state); c.save 
c = City.new(:name => 'Piao', :zip_code => '25.884-000', :state => state); c.save 
c = City.new(:name => 'Pinheiral', :zip_code => '27.197-000', :state => state); c.save 
c = City.new(:name => 'Pipeiras', :zip_code => '28.225-000', :state => state); c.save 
c = City.new(:name => 'Pirai', :zip_code => '27.175-000', :state => state); c.save 
c = City.new(:name => 'Pirangai', :zip_code => '27.565-000', :state => state); c.save 
c = City.new(:name => 'Pirapetinga De Bom Jesus', :zip_code => '28.365-000', :state => state); c.save 
c = City.new(:name => 'Porciuncula', :zip_code => '28.390-000', :state => state); c.save 
c = City.new(:name => 'Portela', :zip_code => '28.595-000', :state => state); c.save 
c = City.new(:name => 'Porto Das Caixas', :zip_code => '24.870-000', :state => state); c.save 
c = City.new(:name => 'Porto Real', :zip_code => '27.570-000', :state => state); c.save 
c = City.new(:name => 'Porto Velho Do Cunha', :zip_code => '28.644-000', :state => state); c.save 
c = City.new(:name => 'Posse', :zip_code => '25.600-000', :state => state); c.save 
c = City.new(:name => 'Praia De Aracatiba', :zip_code => '23.965-000', :state => state); c.save 
c = City.new(:name => 'Pureza', :zip_code => '28.415-000', :state => state); c.save 
c = City.new(:name => 'Purilandia', :zip_code => '28.396-000', :state => state); c.save 
c = City.new(:name => 'Quarteis', :zip_code => '28.835-000', :state => state); c.save 
c = City.new(:name => 'Quatis', :zip_code => '27.400-000', :state => state); c.save 
c = City.new(:name => 'Queimados', :zip_code => '26.300-000', :state => state); c.save 
c = City.new(:name => 'Quissama', :zip_code => '28.735-000', :state => state); c.save 
c = City.new(:name => 'Renascenca', :zip_code => '28.774-000', :state => state); c.save 
c = City.new(:name => 'Resende', :zip_code => '27.500-000', :state => state); c.save 
c = City.new(:name => 'Retiro Do Muriae', :zip_code => '28.330-000', :state => state); c.save 
c = City.new(:name => 'Rialto', :zip_code => '27.300-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao De Sao Joaquim', :zip_code => '27.400-000', :state => state); c.save 
c = City.new(:name => 'Rio Bonito', :zip_code => '28.800-000', :state => state); c.save 
c = City.new(:name => 'Rio Claro', :zip_code => '27.460-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Flores', :zip_code => '27.660-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Ostras', :zip_code => '28.890-000', :state => state); c.save 
c = City.new(:name => 'Rio De Janeiro', :zip_code => '20.000-000', :state => state); c.save 
c = City.new(:name => 'Riograndina', :zip_code => '28.600-000', :state => state); c.save 
c = City.new(:name => 'Rosal', :zip_code => '28.370-000', :state => state); c.save 
c = City.new(:name => 'Sacra Familia Do Tingua', :zip_code => '26.660-000', :state => state); c.save 
c = City.new(:name => 'Salutaris', :zip_code => '25.855-000', :state => state); c.save 
c = City.new(:name => 'Sambaetiba', :zip_code => '24.880-000', :state => state); c.save 
c = City.new(:name => 'Sampaio Correia', :zip_code => '28.997-000', :state => state); c.save 
c = City.new(:name => 'Sana', :zip_code => '27.995-000', :state => state); c.save 
c = City.new(:name => 'Santa Clara', :zip_code => '28.398-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz', :zip_code => '28.480-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Da Serra', :zip_code => '25.000-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel', :zip_code => '24.400-000', :state => state); c.save 
c = City.new(:name => 'Santa Isabel Do Rio Preto', :zip_code => '27.657-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '28.155-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Madalena', :zip_code => '28.770-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Da Floresta', :zip_code => '28.510-000', :state => state); c.save 
c = City.new(:name => 'Santanesia', :zip_code => '27.195-000', :state => state); c.save 
c = City.new(:name => 'Santo Aleixo', :zip_code => '25.920-000', :state => state); c.save 
c = City.new(:name => 'Santo Amaro De Campos', :zip_code => '28.140-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio De Padua', :zip_code => '28.470-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Imbe', :zip_code => '28.778-000', :state => state); c.save 
c = City.new(:name => 'Santo Eduardo', :zip_code => '28.160-000', :state => state); c.save 
c = City.new(:name => 'Sao Fidelis', :zip_code => '28.400-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Itabapoana', :zip_code => '28.230-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo', :zip_code => '24.400-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Barra', :zip_code => '28.200-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao De Meriti', :zip_code => '25.500-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Paraiso', :zip_code => '28.450-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Marcos', :zip_code => '27.472-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '28.195-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose De Uba', :zip_code => '28.455-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Ribeirao', :zip_code => '28.664-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Vale Do Rio Preto', :zip_code => '25.780-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Turvo', :zip_code => '27.165-000', :state => state); c.save 
c = City.new(:name => 'Sao Mateus', :zip_code => '25.500-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Da Aldeia', :zip_code => '28.940-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao De Campos', :zip_code => '28.145-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Alto', :zip_code => '28.550-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Paraiba', :zip_code => '28.530-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Dos Ferreiros', :zip_code => '27.705-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente De Paula', :zip_code => '28.980-000', :state => state); c.save 
c = City.new(:name => 'Sapucaia', :zip_code => '25.880-000', :state => state); c.save 
c = City.new(:name => 'Saquarema', :zip_code => '28.990-000', :state => state); c.save 
c = City.new(:name => 'Saracuruna', :zip_code => '25.000-000', :state => state); c.save 
c = City.new(:name => 'Sebastiao De Lacerda', :zip_code => '27.720-000', :state => state); c.save 
c = City.new(:name => 'Seropedica', :zip_code => '23.890-000', :state => state); c.save 
c = City.new(:name => 'Serrinha', :zip_code => '28.118-000', :state => state); c.save 
c = City.new(:name => 'Sete Pontes', :zip_code => '24.400-000', :state => state); c.save 
c = City.new(:name => 'Silva Jardim', :zip_code => '28.820-000', :state => state); c.save 
c = City.new(:name => 'Sodrelandia', :zip_code => '28.760-000', :state => state); c.save 
c = City.new(:name => 'Sossego', :zip_code => '28.777-000', :state => state); c.save 
c = City.new(:name => 'Subaio', :zip_code => '28.690-000', :state => state); c.save 
c = City.new(:name => 'Sumidouro', :zip_code => '28.637-000', :state => state); c.save 
c = City.new(:name => 'Surui', :zip_code => '25.925-000', :state => state); c.save 
c = City.new(:name => 'Taboas', :zip_code => '27.665-000', :state => state); c.save 
c = City.new(:name => 'Tamoios', :zip_code => '28.927-000', :state => state); c.save 
c = City.new(:name => 'Tangua', :zip_code => '24.890-000', :state => state); c.save 
c = City.new(:name => 'Tapera', :zip_code => '28.767-000', :state => state); c.save 
c = City.new(:name => 'Tarituba', :zip_code => '23.975-000', :state => state); c.save 
c = City.new(:name => 'Teresopolis', :zip_code => '25.950-000', :state => state); c.save 
c = City.new(:name => 'Tocos', :zip_code => '28.148-000', :state => state); c.save 
c = City.new(:name => 'Trajano De Morais', :zip_code => '28.750-000', :state => state); c.save 
c = City.new(:name => 'Travessao', :zip_code => '28.175-000', :state => state); c.save 
c = City.new(:name => 'Tres Irmaos', :zip_code => '28.435-000', :state => state); c.save 
c = City.new(:name => 'Tres Rios', :zip_code => '25.800-000', :state => state); c.save 
c = City.new(:name => 'Triunfo', :zip_code => '28.779-000', :state => state); c.save 
c = City.new(:name => 'Valao Do Barro', :zip_code => '28.555-000', :state => state); c.save 
c = City.new(:name => 'Valenca', :zip_code => '27.600-000', :state => state); c.save 
c = City.new(:name => 'Vargem Alegre', :zip_code => '27.155-000', :state => state); c.save 
c = City.new(:name => 'Varre-sai', :zip_code => '28.375-000', :state => state); c.save 
c = City.new(:name => 'Vassouras', :zip_code => '27.700-000', :state => state); c.save 
c = City.new(:name => 'Venda Das Flores', :zip_code => '28.466-000', :state => state); c.save 
c = City.new(:name => 'Vila Da Grama', :zip_code => '28.765-000', :state => state); c.save 
c = City.new(:name => 'Vila Do Frade', :zip_code => '23.903-000', :state => state); c.save 
c = City.new(:name => 'Vila Muriqui', :zip_code => '23.870-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova De Campos', :zip_code => '28.165-000', :state => state); c.save 
c = City.new(:name => 'Visconde De Imbe', :zip_code => '28.755-000', :state => state); c.save 
c = City.new(:name => 'Volta Redonda', :zip_code => '27.200-000', :state => state); c.save 
c = City.new(:name => 'Werneck', :zip_code => '25.860-000', :state => state); c.save 
c = City.new(:name => 'Xerem', :zip_code => '25.000-000', :state => state); c.save 
c = City.new(:name => 'Correas', :zip_code => '25.600-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Querendo', :zip_code => '28.388-000', :state => state); c.save 
c = City.new(:name => 'Venda Das Pedras', :zip_code => '24.885-000', :state => state); c.save 
c = City.new(:name => 'Goitacazes', :zip_code => '28.110-000', :state => state); c.save 
c = City.new(:name => 'Raposo', :zip_code => '28.333-000', :state => state); c.save 

