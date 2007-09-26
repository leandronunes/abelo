#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Santa Catarina')
state ||= State.create!( :name => 'Santa Catarina', :code => 'SC', :country => country);

c = City.new(:name => 'Abdon Batista', :zip_code => '89.636-000', :state => state); c.save 
c = City.new(:name => 'Abelardo Luz', :zip_code => '89.830-000', :state => state); c.save 
c = City.new(:name => 'Agrolandia', :zip_code => '88.420-000', :state => state); c.save 
c = City.new(:name => 'Agronomica', :zip_code => '89.188-000', :state => state); c.save 
c = City.new(:name => 'Agua Doce', :zip_code => '89.654-000', :state => state); c.save 
c = City.new(:name => 'Aguas Brancas', :zip_code => '88.655-000', :state => state); c.save 
c = City.new(:name => 'Aguas De Chapeco', :zip_code => '89.883-000', :state => state); c.save 
c = City.new(:name => 'Aguas Frias', :zip_code => '89.843-000', :state => state); c.save 
c = City.new(:name => 'Aguas Mornas', :zip_code => '88.150-000', :state => state); c.save 
c = City.new(:name => 'Aguti', :zip_code => '88.280-000', :state => state); c.save 
c = City.new(:name => 'Aiure', :zip_code => '88.892-000', :state => state); c.save 
c = City.new(:name => 'Alfredo Wagner', :zip_code => '88.450-000', :state => state); c.save 
c = City.new(:name => 'Alto Alegre', :zip_code => '89.666-000', :state => state); c.save 
c = City.new(:name => 'Alto Da Serra', :zip_code => '89.816-300', :state => state); c.save 
c = City.new(:name => 'Anchieta', :zip_code => '89.970-000', :state => state); c.save 
c = City.new(:name => 'Angelina', :zip_code => '88.460-000', :state => state); c.save 
c = City.new(:name => 'Anita Garibaldi', :zip_code => '88.590-000', :state => state); c.save 
c = City.new(:name => 'Anitapolis', :zip_code => '88.475-000', :state => state); c.save 
c = City.new(:name => 'Anta Gorda', :zip_code => '89.564-000', :state => state); c.save 
c = City.new(:name => 'Antonio Carlos', :zip_code => '88.180-000', :state => state); c.save 
c = City.new(:name => 'Apiuna', :zip_code => '89.135-000', :state => state); c.save 
c = City.new(:name => 'Arabuta', :zip_code => '89.740-000', :state => state); c.save 
c = City.new(:name => 'Araquari', :zip_code => '89.245-000', :state => state); c.save 
c = City.new(:name => 'Ararangua', :zip_code => '88.900-000', :state => state); c.save 
c = City.new(:name => 'Armazem', :zip_code => '88.740-000', :state => state); c.save 
c = City.new(:name => 'Arroio Trinta', :zip_code => '89.590-000', :state => state); c.save 
c = City.new(:name => 'Arvoredo', :zip_code => '89.778-000', :state => state); c.save 
c = City.new(:name => 'Ascurra', :zip_code => '89.138-000', :state => state); c.save 
c = City.new(:name => 'Atalanta', :zip_code => '88.410-000', :state => state); c.save 
c = City.new(:name => 'Aterrado Torto', :zip_code => '89.173-000', :state => state); c.save 
c = City.new(:name => 'Aurora', :zip_code => '89.186-000', :state => state); c.save 
c = City.new(:name => 'Azambuja', :zip_code => '88.725-000', :state => state); c.save 
c = City.new(:name => 'Balneario Camboriu', :zip_code => '88.330-000', :state => state); c.save 
c = City.new(:name => 'Bandeirante', :zip_code => '89.905-000', :state => state); c.save 
c = City.new(:name => 'Barra Bonita', :zip_code => '89.909-000', :state => state); c.save 
c = City.new(:name => 'Barra Clara', :zip_code => '88.465-000', :state => state); c.save 
c = City.new(:name => 'Balneario Barra Do Sul', :zip_code => '89.247-000', :state => state); c.save 
c = City.new(:name => 'Barra Fria', :zip_code => '89.615-000', :state => state); c.save 
c = City.new(:name => 'Barra Grande', :zip_code => '89.696-000', :state => state); c.save 
c = City.new(:name => 'Barra Velha', :zip_code => '88.390-000', :state => state); c.save 
c = City.new(:name => 'Barreiros', :zip_code => '88.100-000', :state => state); c.save 
c = City.new(:name => 'Barro Branco', :zip_code => '88.882-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Sul', :zip_code => '89.310-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Toldo', :zip_code => '89.478-000', :state => state); c.save 
c = City.new(:name => 'Belmonte', :zip_code => '89.925-000', :state => state); c.save 
c = City.new(:name => 'Benedito Novo', :zip_code => '89.124-000', :state => state); c.save 
c = City.new(:name => 'Biguacu', :zip_code => '88.160-000', :state => state); c.save 
c = City.new(:name => 'Blumenau', :zip_code => '89.000-000', :state => state); c.save 
c = City.new(:name => 'Bocaina Do Sul', :zip_code => '88.538-000', :state => state); c.save 
c = City.new(:name => 'Boiteuxburgo', :zip_code => '88.265-000', :state => state); c.save 
c = City.new(:name => 'Bom Jardim Da Serra', :zip_code => '88.640-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus', :zip_code => '89.824-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Oeste', :zip_code => '89.873-000', :state => state); c.save 
c = City.new(:name => 'Bom Retiro', :zip_code => '88.680-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso', :zip_code => '89.566-000', :state => state); c.save 
c = City.new(:name => 'Bombinhas', :zip_code => '88.215-000', :state => state); c.save 
c = City.new(:name => 'Botuvera', :zip_code => '88.370-000', :state => state); c.save 
c = City.new(:name => 'Braco Do Norte', :zip_code => '88.750-000', :state => state); c.save 
c = City.new(:name => 'Braco Do Trombudo', :zip_code => '89.178-000', :state => state); c.save 
c = City.new(:name => 'Brusque', :zip_code => '88.350-000', :state => state); c.save 
c = City.new(:name => 'Cacador', :zip_code => '89.500-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira Do Bom Jesus', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Caibi', :zip_code => '89.888-000', :state => state); c.save 
c = City.new(:name => 'Calmon', :zip_code => '89.430-000', :state => state); c.save 
c = City.new(:name => 'Camboriu', :zip_code => '88.340-000', :state => state); c.save 
c = City.new(:name => 'Cambuinzal', :zip_code => '89.822-000', :state => state); c.save 
c = City.new(:name => 'Campo Alegre', :zip_code => '89.294-000', :state => state); c.save 
c = City.new(:name => 'Campo Belo Do Sul', :zip_code => '88.580-000', :state => state); c.save 
c = City.new(:name => 'Campo Ere', :zip_code => '89.980-000', :state => state); c.save 
c = City.new(:name => 'Campos Novos', :zip_code => '89.620-000', :state => state); c.save 
c = City.new(:name => 'Canasvieiras', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Canelinha', :zip_code => '88.230-000', :state => state); c.save 
c = City.new(:name => 'Canoas', :zip_code => '88.688-000', :state => state); c.save 
c = City.new(:name => 'Canoinhas', :zip_code => '89.460-000', :state => state); c.save 
c = City.new(:name => 'Capao Alto', :zip_code => '88.548-000', :state => state); c.save 
c = City.new(:name => 'Capinzal', :zip_code => '89.665-000', :state => state); c.save 
c = City.new(:name => 'Caraiba', :zip_code => '89.772-000', :state => state); c.save 
c = City.new(:name => 'Catanduvas', :zip_code => '89.670-000', :state => state); c.save 
c = City.new(:name => 'Catuira', :zip_code => '88.453-000', :state => state); c.save 
c = City.new(:name => 'Caxambu Do Sul', :zip_code => '89.880-000', :state => state); c.save 
c = City.new(:name => 'Cedro Alto', :zip_code => '89.122-000', :state => state); c.save 
c = City.new(:name => 'Celso Ramos', :zip_code => '88.598-000', :state => state); c.save 
c = City.new(:name => 'Cerro Negro', :zip_code => '88.585-000', :state => state); c.save 
c = City.new(:name => 'Chapeco', :zip_code => '89.800-000', :state => state); c.save 
c = City.new(:name => 'Claraiba', :zip_code => '88.275-000', :state => state); c.save 
c = City.new(:name => 'Cocal Do Sul', :zip_code => '88.845-000', :state => state); c.save 
c = City.new(:name => 'Concordia', :zip_code => '89.700-000', :state => state); c.save 
c = City.new(:name => 'Cordilheira Alta', :zip_code => '89.819-000', :state => state); c.save 
c = City.new(:name => 'Coronel Freitas', :zip_code => '89.840-000', :state => state); c.save 
c = City.new(:name => 'Coronel Martins', :zip_code => '89.837-000', :state => state); c.save 
c = City.new(:name => 'Passos Maia', :zip_code => '89.687-000', :state => state); c.save 
c = City.new(:name => 'Correia Pinto', :zip_code => '88.535-000', :state => state); c.save 
c = City.new(:name => 'Corupa', :zip_code => '89.280-000', :state => state); c.save 
c = City.new(:name => 'Criciuma', :zip_code => '88.800-000', :state => state); c.save 
c = City.new(:name => 'Cunha Pora', :zip_code => '89.890-000', :state => state); c.save 
c = City.new(:name => 'Curitibanos', :zip_code => '89.520-000', :state => state); c.save 
c = City.new(:name => 'Dal Pai', :zip_code => '89.626-000', :state => state); c.save 
c = City.new(:name => 'Dalbergia', :zip_code => '89.143-000', :state => state); c.save 
c = City.new(:name => 'Descanso', :zip_code => '89.910-000', :state => state); c.save 
c = City.new(:name => 'Dionisio Cerqueira', :zip_code => '89.950-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '89.628-000', :state => state); c.save 
c = City.new(:name => 'Dona Emma', :zip_code => '89.155-000', :state => state); c.save 
c = City.new(:name => 'Doutor Pedrinho', :zip_code => '89.126-000', :state => state); c.save 
c = City.new(:name => 'Engenho Velho', :zip_code => '89.720-000', :state => state); c.save 
c = City.new(:name => 'Enseada De Brito', :zip_code => '88.139-000', :state => state); c.save 
c = City.new(:name => 'Entre Rios', :zip_code => '89.862-000', :state => state); c.save 
c = City.new(:name => 'Ermo', :zip_code => '88.935-000', :state => state); c.save 
c = City.new(:name => 'Erval Velho', :zip_code => '89.613-000', :state => state); c.save 
c = City.new(:name => 'Espinilho', :zip_code => '89.622-000', :state => state); c.save 
c = City.new(:name => 'Estacao Cocal', :zip_code => '88.835-000', :state => state); c.save 
c = City.new(:name => 'Faxinal Dos Guedes', :zip_code => '89.694-000', :state => state); c.save 
c = City.new(:name => 'Felipe Schmidt', :zip_code => '89.473-000', :state => state); c.save 
c = City.new(:name => 'Figueira', :zip_code => '89.816-400', :state => state); c.save 
c = City.new(:name => 'Flor Do Sertao', :zip_code => '89.878-000', :state => state); c.save 
c = City.new(:name => 'Florianopolis', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Forquilhinha', :zip_code => '88.850-000', :state => state); c.save 
c = City.new(:name => 'Fraiburgo', :zip_code => '89.580-000', :state => state); c.save 
c = City.new(:name => 'Frederico Wastner', :zip_code => '89.994-000', :state => state); c.save 
c = City.new(:name => 'Frei Rogerio', :zip_code => '89.530-000', :state => state); c.save 
c = City.new(:name => 'Galvao', :zip_code => '89.838-000', :state => state); c.save 
c = City.new(:name => 'Garcia', :zip_code => '88.463-000', :state => state); c.save 
c = City.new(:name => 'Garopaba', :zip_code => '88.495-000', :state => state); c.save 
c = City.new(:name => 'Garuva', :zip_code => '89.248-000', :state => state); c.save 
c = City.new(:name => 'Gaspar', :zip_code => '89.110-000', :state => state); c.save 
c = City.new(:name => 'Goio-en', :zip_code => '89.816-200', :state => state); c.save 
c = City.new(:name => 'Governador Celso Ramos', :zip_code => '88.190-000', :state => state); c.save 
c = City.new(:name => 'Grao Para', :zip_code => '88.890-000', :state => state); c.save 
c = City.new(:name => 'Grapia', :zip_code => '89.907-000', :state => state); c.save 
c = City.new(:name => 'Gravatal', :zip_code => '88.735-000', :state => state); c.save 
c = City.new(:name => 'Guabiruba', :zip_code => '88.360-000', :state => state); c.save 
c = City.new(:name => 'Guaporanga', :zip_code => '88.165-000', :state => state); c.save 
c = City.new(:name => 'Guaraciaba', :zip_code => '89.920-000', :state => state); c.save 
c = City.new(:name => 'Guaramirim', :zip_code => '89.270-000', :state => state); c.save 
c = City.new(:name => 'Guaruja Do Sul', :zip_code => '89.940-000', :state => state); c.save 
c = City.new(:name => 'Guata', :zip_code => '88.884-000', :state => state); c.save 
c = City.new(:name => 'Guatambu', :zip_code => '89.817-000', :state => state); c.save 
c = City.new(:name => 'Hercilio Luz', :zip_code => '88.913-000', :state => state); c.save 
c = City.new(:name => 'Herciliopolis', :zip_code => '89.657-000', :state => state); c.save 
c = City.new(:name => 'Herval Doeste', :zip_code => '89.610-000', :state => state); c.save 
c = City.new(:name => 'Ibiam', :zip_code => '89.652-000', :state => state); c.save 
c = City.new(:name => 'Ibicare', :zip_code => '89.640-000', :state => state); c.save 
c = City.new(:name => 'Ibirama', :zip_code => '89.140-000', :state => state); c.save 
c = City.new(:name => 'Icara', :zip_code => '88.820-000', :state => state); c.save 
c = City.new(:name => 'Ilhota', :zip_code => '88.320-000', :state => state); c.save 
c = City.new(:name => 'Imarui', :zip_code => '88.770-000', :state => state); c.save 
c = City.new(:name => 'Imbituba', :zip_code => '88.780-000', :state => state); c.save 
c = City.new(:name => 'Imbuia', :zip_code => '88.440-000', :state => state); c.save 
c = City.new(:name => 'Indaial', :zip_code => '89.130-000', :state => state); c.save 
c = City.new(:name => 'Indios', :zip_code => '88.533-000', :state => state); c.save 
c = City.new(:name => 'Ingleses Do Rio Vermelho', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Invernada', :zip_code => '88.895-000', :state => state); c.save 
c = City.new(:name => 'Iomere', :zip_code => '89.558-000', :state => state); c.save 
c = City.new(:name => 'Ipira', :zip_code => '89.669-000', :state => state); c.save 
c = City.new(:name => 'Ipomeia', :zip_code => '89.555-000', :state => state); c.save 
c = City.new(:name => 'Ipora Do Oeste', :zip_code => '89.899-000', :state => state); c.save 
c = City.new(:name => 'Ipuacu', :zip_code => '89.832-000', :state => state); c.save 
c = City.new(:name => 'Ipumirim', :zip_code => '89.790-000', :state => state); c.save 
c = City.new(:name => 'Iraceminha', :zip_code => '89.891-000', :state => state); c.save 
c = City.new(:name => 'Irakitan', :zip_code => '89.646-000', :state => state); c.save 
c = City.new(:name => 'Irani', :zip_code => '89.680-000', :state => state); c.save 
c = City.new(:name => 'Iraputa', :zip_code => '89.344-000', :state => state); c.save 
c = City.new(:name => 'Irati', :zip_code => '89.856-000', :state => state); c.save 
c = City.new(:name => 'Irineopolis', :zip_code => '89.440-000', :state => state); c.save 
c = City.new(:name => 'Ita', :zip_code => '89.760-000', :state => state); c.save 
c = City.new(:name => 'Nova Itaberaba', :zip_code => '89.818-000', :state => state); c.save 
c = City.new(:name => 'Itaio', :zip_code => '89.348-000', :state => state); c.save 
c = City.new(:name => 'Itaiopolis', :zip_code => '89.340-000', :state => state); c.save 
c = City.new(:name => 'Itajai', :zip_code => '88.300-000', :state => state); c.save 
c = City.new(:name => 'Itajuba', :zip_code => '89.913-000', :state => state); c.save 
c = City.new(:name => 'Itapema', :zip_code => '88.220-000', :state => state); c.save 
c = City.new(:name => 'Itapiranga', :zip_code => '89.896-000', :state => state); c.save 
c = City.new(:name => 'Itapoa', :zip_code => '89.249-000', :state => state); c.save 
c = City.new(:name => 'Itapocu', :zip_code => '89.246-000', :state => state); c.save 
c = City.new(:name => 'Itoupava', :zip_code => '89.000-000', :state => state); c.save 
c = City.new(:name => 'Ituporanga', :zip_code => '88.400-000', :state => state); c.save 
c = City.new(:name => 'Jabora', :zip_code => '89.677-000', :state => state); c.save 
c = City.new(:name => 'Jacinto Machado', :zip_code => '88.950-000', :state => state); c.save 
c = City.new(:name => 'Jaguaruna', :zip_code => '88.715-000', :state => state); c.save 
c = City.new(:name => 'Jaragua Do Sul', :zip_code => '89.250-000', :state => state); c.save 
c = City.new(:name => 'Jardinopolis', :zip_code => '89.848-000', :state => state); c.save 
c = City.new(:name => 'Joacaba', :zip_code => '89.600-000', :state => state); c.save 
c = City.new(:name => 'Joinville', :zip_code => '89.200-000', :state => state); c.save 
c = City.new(:name => 'Jose Boiteux', :zip_code => '89.145-000', :state => state); c.save 
c = City.new(:name => 'Jupia', :zip_code => '89.839-000', :state => state); c.save 
c = City.new(:name => 'Lacerdopolis', :zip_code => '89.660-000', :state => state); c.save 
c = City.new(:name => 'Lajeado Grande', :zip_code => '89.828-000', :state => state); c.save 
c = City.new(:name => 'Lages', :zip_code => '88.500-000', :state => state); c.save 
c = City.new(:name => 'Lagoa', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Da Estiva', :zip_code => '88.595-000', :state => state); c.save 
c = City.new(:name => 'Laguna', :zip_code => '88.790-000', :state => state); c.save 
c = City.new(:name => 'Laurentino', :zip_code => '89.170-000', :state => state); c.save 
c = City.new(:name => 'Lauro Muller', :zip_code => '88.880-000', :state => state); c.save 
c = City.new(:name => 'Leao', :zip_code => '89.632-000', :state => state); c.save 
c = City.new(:name => 'Lebon Regis', :zip_code => '89.515-000', :state => state); c.save 
c = City.new(:name => 'Leoberto Leal', :zip_code => '88.445-000', :state => state); c.save 
c = City.new(:name => 'Lindoia Do Sul', :zip_code => '89.735-000', :state => state); c.save 
c = City.new(:name => 'Linha Das Palmeiras', :zip_code => '89.785-000', :state => state); c.save 
c = City.new(:name => 'Lontras', :zip_code => '89.182-000', :state => state); c.save 
c = City.new(:name => 'Lourdes', :zip_code => '89.568-000', :state => state); c.save 
c = City.new(:name => 'Luiz Alves', :zip_code => '89.115-000', :state => state); c.save 
c = City.new(:name => 'Luzerna', :zip_code => '89.609-000', :state => state); c.save 
c = City.new(:name => 'Macieira', :zip_code => '89.518-000', :state => state); c.save 
c = City.new(:name => 'Mafra', :zip_code => '89.300-000', :state => state); c.save 
c = City.new(:name => 'Major Gercino', :zip_code => '88.260-000', :state => state); c.save 
c = City.new(:name => 'Major Vieira', :zip_code => '89.480-000', :state => state); c.save 
c = City.new(:name => 'Maracaja', :zip_code => '88.915-000', :state => state); c.save 
c = City.new(:name => 'Marari', :zip_code => '89.648-000', :state => state); c.save 
c = City.new(:name => 'Marata', :zip_code => '89.836-000', :state => state); c.save 
c = City.new(:name => 'Maravilha', :zip_code => '89.874-000', :state => state); c.save 
c = City.new(:name => 'Marcilio Dias', :zip_code => '89.465-000', :state => state); c.save 
c = City.new(:name => 'Marechal Bormann', :zip_code => '89.816-100', :state => state); c.save 
c = City.new(:name => 'Marema', :zip_code => '89.860-000', :state => state); c.save 
c = City.new(:name => 'Mariflor', :zip_code => '89.933-000', :state => state); c.save 
c = City.new(:name => 'Marombas', :zip_code => '89.635-000', :state => state); c.save 
c = City.new(:name => 'Massaranduba', :zip_code => '89.108-000', :state => state); c.save 
c = City.new(:name => 'Matos Costa', :zip_code => '89.420-000', :state => state); c.save 
c = City.new(:name => 'Meleiro', :zip_code => '88.920-000', :state => state); c.save 
c = City.new(:name => 'Mirador', :zip_code => '89.153-000', :state => state); c.save 
c = City.new(:name => 'Mirim', :zip_code => '88.787-000', :state => state); c.save 
c = City.new(:name => 'Mirim Doce', :zip_code => '89.194-000', :state => state); c.save 
c = City.new(:name => 'Modelo', :zip_code => '89.872-000', :state => state); c.save 
c = City.new(:name => 'Mondai', :zip_code => '89.893-000', :state => state); c.save 
c = City.new(:name => 'Monte Carlo', :zip_code => '89.618-000', :state => state); c.save 
c = City.new(:name => 'Monte Castelo', :zip_code => '89.380-000', :state => state); c.save 
c = City.new(:name => 'Morro Da Fumaca', :zip_code => '88.830-000', :state => state); c.save 
c = City.new(:name => 'Morro Grande', :zip_code => '88.925-000', :state => state); c.save 
c = City.new(:name => 'Navegantes', :zip_code => '88.375-000', :state => state); c.save 
c = City.new(:name => 'Nova Cultura', :zip_code => '89.375-000', :state => state); c.save 
c = City.new(:name => 'Nova Erechim', :zip_code => '89.865-000', :state => state); c.save 
c = City.new(:name => 'Nova Petropolis', :zip_code => '89.607-000', :state => state); c.save 
c = City.new(:name => 'Nova Teutonia', :zip_code => '89.775-000', :state => state); c.save 
c = City.new(:name => 'Nova Trento', :zip_code => '88.270-000', :state => state); c.save 
c = City.new(:name => 'Nova Veneza', :zip_code => '88.865-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '89.998-000', :state => state); c.save 
c = City.new(:name => 'Orleans', :zip_code => '88.870-000', :state => state); c.save 
c = City.new(:name => 'Otacilio Costa', :zip_code => '88.540-000', :state => state); c.save 
c = City.new(:name => 'Ouro', :zip_code => '89.663-000', :state => state); c.save 
c = City.new(:name => 'Ouro Verde', :zip_code => '89.834-000', :state => state); c.save 
c = City.new(:name => 'Paial', :zip_code => '89.765-000', :state => state); c.save 
c = City.new(:name => 'Painel', :zip_code => '88.543-000', :state => state); c.save 
c = City.new(:name => 'Palhoca', :zip_code => '88.130-000', :state => state); c.save 
c = City.new(:name => 'Palma Sola', :zip_code => '89.985-000', :state => state); c.save 
c = City.new(:name => 'Brunopolis', :zip_code => '89.634-000', :state => state); c.save 
c = City.new(:name => 'Palmitos', :zip_code => '89.887-000', :state => state); c.save 
c = City.new(:name => 'Pantano Do Sul', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Papanduva', :zip_code => '89.370-000', :state => state); c.save 
c = City.new(:name => 'Paraiso', :zip_code => '89.906-000', :state => state); c.save 
c = City.new(:name => 'Passo De Torres', :zip_code => '88.980-000', :state => state); c.save 
c = City.new(:name => 'Passo Manso', :zip_code => '89.192-000', :state => state); c.save 
c = City.new(:name => 'Paula Pereira', :zip_code => '89.470-000', :state => state); c.save 
c = City.new(:name => 'Paulo Lopes', :zip_code => '88.490-000', :state => state); c.save 
c = City.new(:name => 'Pedras Grandes', :zip_code => '88.720-000', :state => state); c.save 
c = City.new(:name => 'Penha', :zip_code => '88.385-000', :state => state); c.save 
c = City.new(:name => 'Perico', :zip_code => '88.615-000', :state => state); c.save 
c = City.new(:name => 'Peritiba', :zip_code => '89.750-000', :state => state); c.save 
c = City.new(:name => 'Pescaria Brava', :zip_code => '88.798-000', :state => state); c.save 
c = City.new(:name => 'Petrolandia', :zip_code => '88.430-000', :state => state); c.save 
c = City.new(:name => 'Picarras', :zip_code => '88.380-000', :state => state); c.save 
c = City.new(:name => 'Pindotiba', :zip_code => '88.873-000', :state => state); c.save 
c = City.new(:name => 'Pinhalzinho', :zip_code => '89.870-000', :state => state); c.save 
c = City.new(:name => 'Pinheiral', :zip_code => '88.268-000', :state => state); c.save 
c = City.new(:name => 'Pinheiro Preto', :zip_code => '89.570-000', :state => state); c.save 
c = City.new(:name => 'Pinheiros', :zip_code => '89.476-000', :state => state); c.save 
c = City.new(:name => 'Pirabeiraba', :zip_code => '89.200-000', :state => state); c.save 
c = City.new(:name => 'Piratuba', :zip_code => '89.667-000', :state => state); c.save 
c = City.new(:name => 'Planalto Alegre', :zip_code => '89.882-000', :state => state); c.save 
c = City.new(:name => 'Poco Preto', :zip_code => '89.450-000', :state => state); c.save 
c = City.new(:name => 'Pomerode', :zip_code => '89.107-000', :state => state); c.save 
c = City.new(:name => 'Ponte Alta', :zip_code => '88.550-000', :state => state); c.save 
c = City.new(:name => 'Ponte Alta Do Norte', :zip_code => '89.535-000', :state => state); c.save 
c = City.new(:name => 'Ponte Serrada', :zip_code => '89.683-000', :state => state); c.save 
c = City.new(:name => 'Porto Belo', :zip_code => '88.210-000', :state => state); c.save 
c = City.new(:name => 'Porto Uniao', :zip_code => '89.400-000', :state => state); c.save 
c = City.new(:name => 'Pouso Redondo', :zip_code => '89.172-000', :state => state); c.save 
c = City.new(:name => 'Praia Grande', :zip_code => '88.990-000', :state => state); c.save 
c = City.new(:name => 'Presidente Castelo Branco', :zip_code => '89.745-000', :state => state); c.save 
c = City.new(:name => 'Presidente Getulio', :zip_code => '89.150-000', :state => state); c.save 
c = City.new(:name => 'Presidente Juscelino', :zip_code => '89.992-000', :state => state); c.save 
c = City.new(:name => 'Presidente Kennedy', :zip_code => '89.725-000', :state => state); c.save 
c = City.new(:name => 'Presidente Nereu', :zip_code => '89.184-000', :state => state); c.save 
c = City.new(:name => 'Princesa', :zip_code => '89.935-000', :state => state); c.save 
c = City.new(:name => 'Quilombo', :zip_code => '89.850-000', :state => state); c.save 
c = City.new(:name => 'Rancho Queimado', :zip_code => '88.470-000', :state => state); c.save 
c = City.new(:name => 'Ratones', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Da Ilha', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Pequeno', :zip_code => '88.794-000', :state => state); c.save 
c = City.new(:name => 'Rio Antinha', :zip_code => '88.435-000', :state => state); c.save 
c = City.new(:name => 'Rio Bonito', :zip_code => '88.405-000', :state => state); c.save 
c = City.new(:name => 'Rio Duna', :zip_code => '88.775-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Antas', :zip_code => '89.550-000', :state => state); c.save 
c = City.new(:name => 'Rio Das Furnas', :zip_code => '88.872-000', :state => state); c.save 
c = City.new(:name => 'Rio Do Campo', :zip_code => '89.198-000', :state => state); c.save 
c = City.new(:name => 'Rio Do Oeste', :zip_code => '89.180-000', :state => state); c.save 
c = City.new(:name => 'Rio Do Sul', :zip_code => '89.160-000', :state => state); c.save 
c = City.new(:name => 'Rio Dos Bugres', :zip_code => '88.403-000', :state => state); c.save 
c = City.new(:name => 'Rio Dos Cedros', :zip_code => '89.121-000', :state => state); c.save 
c = City.new(:name => 'Rio Fortuna', :zip_code => '88.760-000', :state => state); c.save 
c = City.new(:name => 'Rio Maina', :zip_code => '88.800-000', :state => state); c.save 
c = City.new(:name => 'Rio Negrinho', :zip_code => '89.295-000', :state => state); c.save 
c = City.new(:name => 'Rio Preto Do Sul', :zip_code => '89.315-000', :state => state); c.save 
c = City.new(:name => 'Rio Rufino', :zip_code => '88.658-000', :state => state); c.save 
c = City.new(:name => 'Riqueza', :zip_code => '89.895-000', :state => state); c.save 
c = City.new(:name => 'Rodeio', :zip_code => '89.136-000', :state => state); c.save 
c = City.new(:name => 'Romelandia', :zip_code => '89.908-000', :state => state); c.save 
c = City.new(:name => 'Sai', :zip_code => '89.243-000', :state => state); c.save 
c = City.new(:name => 'Salete', :zip_code => '89.196-000', :state => state); c.save 
c = City.new(:name => 'Salto Veloso', :zip_code => '89.595-000', :state => state); c.save 
c = City.new(:name => 'Sangao', :zip_code => '88.717-000', :state => state); c.save 
c = City.new(:name => 'Santa Cecilia', :zip_code => '89.540-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Timbo', :zip_code => '89.410-000', :state => state); c.save 
c = City.new(:name => 'Santa Helena', :zip_code => '89.915-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria', :zip_code => '89.125-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa Do Sul', :zip_code => '88.965-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa De Lima', :zip_code => '88.763-000', :state => state); c.save 
c = City.new(:name => 'Santo Amaro Da Imperatriz', :zip_code => '88.140-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio De Lisboa', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento Baixo', :zip_code => '88.867-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento Do Sul', :zip_code => '89.290-000', :state => state); c.save 
c = City.new(:name => 'Sao Bonifacio', :zip_code => '88.485-000', :state => state); c.save 
c = City.new(:name => 'Sao Carlos', :zip_code => '89.885-000', :state => state); c.save 
c = City.new(:name => 'Sao Cristovao Do Sul', :zip_code => '89.533-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '89.835-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Sul', :zip_code => '89.240-000', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel', :zip_code => '88.712-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Oeste', :zip_code => '89.897-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Batista', :zip_code => '88.240-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Itaperiu', :zip_code => '88.395-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Rio Vermelho', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Sul', :zip_code => '88.970-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '88.600-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '88.100-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Cedro', :zip_code => '89.930-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Cerrito', :zip_code => '88.570-000', :state => state); c.save 
c = City.new(:name => 'Sao Leonardo', :zip_code => '88.455-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco Do Oeste', :zip_code => '89.990-000', :state => state); c.save 
c = City.new(:name => 'Sao Ludgero', :zip_code => '88.730-000', :state => state); c.save 
c = City.new(:name => 'Uniao Do Oeste', :zip_code => '89.845-000', :state => state); c.save 
c = City.new(:name => 'Sao Martinho', :zip_code => '88.765-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Doeste', :zip_code => '89.900-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Da Boa Vista', :zip_code => '89.879-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro De Alcantara', :zip_code => '88.125-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Tobias', :zip_code => '89.960-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Arvoredo', :zip_code => '88.610-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Sul', :zip_code => '89.517-000', :state => state); c.save 
c = City.new(:name => 'Sapiranga', :zip_code => '88.923-000', :state => state); c.save 
c = City.new(:name => 'Saudades', :zip_code => '89.868-000', :state => state); c.save 
c = City.new(:name => 'Schroeder', :zip_code => '89.275-000', :state => state); c.save 
c = City.new(:name => 'Seara', :zip_code => '89.770-000', :state => state); c.save 
c = City.new(:name => 'Serra Alta', :zip_code => '89.871-000', :state => state); c.save 
c = City.new(:name => 'Sideropolis', :zip_code => '88.860-000', :state => state); c.save 
c = City.new(:name => 'Sombrio', :zip_code => '88.960-000', :state => state); c.save 
c = City.new(:name => 'Sorocaba Do Sul', :zip_code => '88.170-000', :state => state); c.save 
c = City.new(:name => 'Sul Brasil', :zip_code => '89.855-000', :state => state); c.save 
c = City.new(:name => 'Taio', :zip_code => '89.190-000', :state => state); c.save 
c = City.new(:name => 'Tangara', :zip_code => '89.642-000', :state => state); c.save 
c = City.new(:name => 'Taquara Verde', :zip_code => '89.513-000', :state => state); c.save 
c = City.new(:name => 'Taquaras', :zip_code => '88.474-000', :state => state); c.save 
c = City.new(:name => 'Tigrinhos', :zip_code => '89.875-000', :state => state); c.save 
c = City.new(:name => 'Tigipio', :zip_code => '88.245-000', :state => state); c.save 
c = City.new(:name => 'Tijucas', :zip_code => '88.200-000', :state => state); c.save 
c = City.new(:name => 'Timbe Do Sul', :zip_code => '88.940-000', :state => state); c.save 
c = City.new(:name => 'Timbo', :zip_code => '89.120-000', :state => state); c.save 
c = City.new(:name => 'Timbo Grande', :zip_code => '89.545-000', :state => state); c.save 
c = City.new(:name => 'Tres Barras', :zip_code => '89.490-000', :state => state); c.save 
c = City.new(:name => 'Treviso', :zip_code => '88.862-000', :state => state); c.save 
c = City.new(:name => 'Treze De Maio', :zip_code => '88.710-000', :state => state); c.save 
c = City.new(:name => 'Treze Tilias', :zip_code => '89.650-000', :state => state); c.save 
c = City.new(:name => 'Trombudo Central', :zip_code => '89.176-000', :state => state); c.save 
c = City.new(:name => 'Tubarao', :zip_code => '88.700-000', :state => state); c.save 
c = City.new(:name => 'Tunapolis', :zip_code => '89.898-000', :state => state); c.save 
c = City.new(:name => 'Tupitinga', :zip_code => '89.630-000', :state => state); c.save 
c = City.new(:name => 'Turvo', :zip_code => '88.930-000', :state => state); c.save 
c = City.new(:name => 'Fragosos', :zip_code => '89.294-800', :state => state); c.save 
c = City.new(:name => 'Urubici', :zip_code => '88.650-000', :state => state); c.save 
c = City.new(:name => 'Uruguai', :zip_code => '89.668-000', :state => state); c.save 
c = City.new(:name => 'Urupema', :zip_code => '88.625-000', :state => state); c.save 
c = City.new(:name => 'Urussanga', :zip_code => '88.840-000', :state => state); c.save 
c = City.new(:name => 'Vargeao', :zip_code => '89.690-000', :state => state); c.save 
c = City.new(:name => 'Vargem', :zip_code => '89.638-000', :state => state); c.save 
c = City.new(:name => 'Vargem Bonita', :zip_code => '89.675-000', :state => state); c.save 
c = City.new(:name => 'Vargem Do Cedro', :zip_code => '88.766-000', :state => state); c.save 
c = City.new(:name => 'Vidal Ramos', :zip_code => '88.443-000', :state => state); c.save 
c = City.new(:name => 'Videira', :zip_code => '89.560-000', :state => state); c.save 
c = City.new(:name => 'Vila Conceicao', :zip_code => '88.975-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova', :zip_code => '88.782-000', :state => state); c.save 
c = City.new(:name => 'Vitor Meireles', :zip_code => '89.148-000', :state => state); c.save 
c = City.new(:name => 'Alto Bela Vista', :zip_code => '89.730-000', :state => state); c.save 
c = City.new(:name => 'Witmarsum', :zip_code => '89.157-000', :state => state); c.save 
c = City.new(:name => 'Xanxere', :zip_code => '89.820-000', :state => state); c.save 
c = City.new(:name => 'Xavantina', :zip_code => '89.780-000', :state => state); c.save 
c = City.new(:name => 'Xaxim', :zip_code => '89.825-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora De Caravaggio', :zip_code => '88.868-000', :state => state); c.save 
c = City.new(:name => 'Arnopolis', :zip_code => '88.452-000', :state => state); c.save 
c = City.new(:name => 'Zortea', :zip_code => '89.633-000', :state => state); c.save 
c = City.new(:name => 'Sao Cristovao', :zip_code => '89.495-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '89.199-000', :state => state); c.save 
c = City.new(:name => 'Residencia Fuck', :zip_code => '89.384-000', :state => state); c.save 
c = City.new(:name => 'Sanga Da Toca', :zip_code => '88.912-000', :state => state); c.save 
c = City.new(:name => 'Bateias De Baixo', :zip_code => '89.294-600', :state => state); c.save 
c = City.new(:name => 'Balneario Arroio Do Silva', :zip_code => '88.914-000', :state => state); c.save 
c = City.new(:name => 'Santiago Do Sul', :zip_code => '89.854-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha Do Progresso', :zip_code => '89.983-000', :state => state); c.save 
c = City.new(:name => 'Formosa Do Sul', :zip_code => '89.859-000', :state => state); c.save 
c = City.new(:name => 'Quarta Linha', :zip_code => '88.800-000', :state => state); c.save 
c = City.new(:name => 'Sao Defende', :zip_code => '88.800-000', :state => state); c.save 
c = City.new(:name => 'Quilometro Doze', :zip_code => '88.300-000', :state => state); c.save 
c = City.new(:name => 'Rio Da Luz', :zip_code => '89.250-000', :state => state); c.save 
c = City.new(:name => 'Morro Do Meio', :zip_code => '89.200-000', :state => state); c.save 
c = City.new(:name => 'Colonia Santana', :zip_code => '88.123-000', :state => state); c.save 
c = City.new(:name => 'Colonia Santa Tereza', :zip_code => '88.124-000', :state => state); c.save 
c = City.new(:name => 'Sertao Do Maruim', :zip_code => '88.122-000', :state => state); c.save 
c = City.new(:name => 'Saltinho', :zip_code => '89.981-000', :state => state); c.save 
c = City.new(:name => 'Sao Bernardino', :zip_code => '89.982-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira De Fatima', :zip_code => '88.993-000', :state => state); c.save 
c = City.new(:name => 'Capivari De Baixo', :zip_code => '88.745-000', :state => state); c.save 
c = City.new(:name => 'Ouro Verde', :zip_code => '89.923-000', :state => state); c.save 
c = City.new(:name => 'Santa Helena', :zip_code => '89.608-000', :state => state); c.save 
c = City.new(:name => 'Aguas Claras', :zip_code => '89.320-000', :state => state); c.save 
c = City.new(:name => 'Palmeira', :zip_code => '88.545-000', :state => state); c.save 
c = City.new(:name => 'Santa Lucia', :zip_code => '89.664-000', :state => state); c.save 
c = City.new(:name => 'Santa Lucia', :zip_code => '89.887-500', :state => state); c.save 
c = City.new(:name => 'Baia Alta', :zip_code => '89.685-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Da Serra', :zip_code => '89.415-000', :state => state); c.save 
c = City.new(:name => 'Vila De Volta Grande', :zip_code => '89.298-000', :state => state); c.save 
c = City.new(:name => 'Cunhatai', :zip_code => '89.886-000', :state => state); c.save 
c = City.new(:name => 'Vila Milani', :zip_code => '89.836-500', :state => state); c.save 
c = City.new(:name => 'Santa Izabel', :zip_code => '88.620-000', :state => state); c.save 
c = City.new(:name => 'Sao Roque', :zip_code => '89.996-000', :state => state); c.save 
c = City.new(:name => 'Prata', :zip_code => '89.904-000', :state => state); c.save 
c = City.new(:name => 'Balneario Gaivota', :zip_code => '88.955-000', :state => state); c.save 
c = City.new(:name => 'Nova Guarita', :zip_code => '88.964-000', :state => state); c.save 
c = City.new(:name => 'Morro Chato', :zip_code => '88.934-000', :state => state); c.save 
c = City.new(:name => 'Barra Da Prata', :zip_code => '89.149-000', :state => state); c.save 
c = City.new(:name => 'Chapadao Do Lageado', :zip_code => '88.407-000', :state => state); c.save 
c = City.new(:name => 'Campinas', :zip_code => '88.100-000', :state => state); c.save 
c = City.new(:name => 'Fazenda Zandavalli', :zip_code => '89.817-500', :state => state); c.save 
c = City.new(:name => 'Sede Oldemburg', :zip_code => '89.887-700', :state => state); c.save 
c = City.new(:name => 'Monte Alegre', :zip_code => '88.348-000', :state => state); c.save 
c = City.new(:name => 'Balneario Morro Dos Conventos', :zip_code => '88.911-000', :state => state); c.save 
c = City.new(:name => 'Barra Da Lagoa', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Campeche', :zip_code => '88.000-000', :state => state); c.save 
c = City.new(:name => 'Machados', :zip_code => '88.378-000', :state => state); c.save 
c = City.new(:name => 'Rio Da Anta', :zip_code => '89.346-000', :state => state); c.save 
c = City.new(:name => 'Marombas Bossardi', :zip_code => '89.528-000', :state => state); c.save 
c = City.new(:name => 'Ibicui', :zip_code => '89.631-000', :state => state); c.save 
c = City.new(:name => 'Planalto', :zip_code => '89.728-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Laranjal', :zip_code => '89.892-000', :state => state); c.save 

