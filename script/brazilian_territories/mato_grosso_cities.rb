#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Mato Grosso')
state ||= State.create!( :name => 'Mato Grosso', :code => 'MT', :country => country);

c = City.new(:name => 'Acorizal', :zip_code => '78.480-000', :state => state); c.save 
c = City.new(:name => 'Agua Boa', :zip_code => '78.635-000', :state => state); c.save 
c = City.new(:name => 'Agua Fria', :zip_code => '78.197-000', :state => state); c.save 
c = City.new(:name => 'Alcantilado', :zip_code => '78.762-000', :state => state); c.save 
c = City.new(:name => 'Alta Floresta', :zip_code => '78.580-000', :state => state); c.save 
c = City.new(:name => 'Alto Araguaia', :zip_code => '78.780-000', :state => state); c.save 
c = City.new(:name => 'Alto Coite', :zip_code => '78.803-000', :state => state); c.save 
c = City.new(:name => 'Alto Garcas', :zip_code => '78.770-000', :state => state); c.save 
c = City.new(:name => 'Alto Paraguai', :zip_code => '78.410-000', :state => state); c.save 
c = City.new(:name => 'Alto Paraiso', :zip_code => '78.585-000', :state => state); c.save 
c = City.new(:name => 'Apiacas', :zip_code => '78.595-000', :state => state); c.save 
c = City.new(:name => 'Araguaiana', :zip_code => '78.685-000', :state => state); c.save 
c = City.new(:name => 'Araguainha', :zip_code => '78.615-000', :state => state); c.save 
c = City.new(:name => 'Araputanga', :zip_code => '78.260-000', :state => state); c.save 
c = City.new(:name => 'Arenapolis', :zip_code => '78.420-000', :state => state); c.save 
c = City.new(:name => 'Aripuana', :zip_code => '78.325-000', :state => state); c.save 
c = City.new(:name => 'Arruda', :zip_code => '78.473-000', :state => state); c.save 
c = City.new(:name => 'Barao De Melgaco', :zip_code => '78.190-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Bugres', :zip_code => '78.390-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Garcas', :zip_code => '78.600-000', :state => state); c.save 
c = City.new(:name => 'Batovi', :zip_code => '78.776-000', :state => state); c.save 
c = City.new(:name => 'Bauxi', :zip_code => '78.474-000', :state => state); c.save 
c = City.new(:name => 'Boa Vista', :zip_code => '78.752-000', :state => state); c.save 
c = City.new(:name => 'Bom Sucesso', :zip_code => '78.166-000', :state => state); c.save 
c = City.new(:name => 'Brasnorte', :zip_code => '78.350-000', :state => state); c.save 
c = City.new(:name => 'Buriti', :zip_code => '78.764-000', :state => state); c.save 
c = City.new(:name => 'Caceres', :zip_code => '78.200-000', :state => state); c.save 
c = City.new(:name => 'Campinapolis', :zip_code => '78.630-000', :state => state); c.save 
c = City.new(:name => 'Canarana', :zip_code => '78.640-000', :state => state); c.save 
c = City.new(:name => 'Capao Grande', :zip_code => '78.164-000', :state => state); c.save 
c = City.new(:name => 'Cassununga', :zip_code => '78.778-000', :state => state); c.save 
c = City.new(:name => 'Catuai', :zip_code => '78.437-000', :state => state); c.save 
c = City.new(:name => 'Chapada Dos Guimaraes', :zip_code => '78.195-000', :state => state); c.save 
c = City.new(:name => 'Claudia', :zip_code => '78.540-000', :state => state); c.save 
c = City.new(:name => 'Cocalinho', :zip_code => '78.680-000', :state => state); c.save 
c = City.new(:name => 'Colider', :zip_code => '78.500-000', :state => state); c.save 
c = City.new(:name => 'Coronel Ponce', :zip_code => '78.843-000', :state => state); c.save 
c = City.new(:name => 'Coxipo Da Ponte', :zip_code => '78.000-000', :state => state); c.save 
c = City.new(:name => 'Cristinopolis', :zip_code => '78.272-000', :state => state); c.save 
c = City.new(:name => 'Cristo Rei', :zip_code => '78.110-000', :state => state); c.save 
c = City.new(:name => 'Gloria Doeste', :zip_code => '78.293-000', :state => state); c.save 
c = City.new(:name => 'Cuiaba', :zip_code => '78.000-000', :state => state); c.save 
c = City.new(:name => 'Denise', :zip_code => '78.380-000', :state => state); c.save 
c = City.new(:name => 'Diamantino', :zip_code => '78.400-000', :state => state); c.save 
c = City.new(:name => 'Dom Aquino', :zip_code => '78.830-000', :state => state); c.save 
c = City.new(:name => 'Engenho', :zip_code => '78.483-000', :state => state); c.save 
c = City.new(:name => 'Engenho Velho', :zip_code => '78.182-000', :state => state); c.save 
c = City.new(:name => 'Entre Rios', :zip_code => '78.833-000', :state => state); c.save 
c = City.new(:name => 'Estrela Do Leste', :zip_code => '78.768-000', :state => state); c.save 
c = City.new(:name => 'Figueiropolis D Oeste', :zip_code => '78.290-000', :state => state); c.save 
c = City.new(:name => 'Fontanilhas', :zip_code => '78.348-000', :state => state); c.save 
c = City.new(:name => 'Gaucha Do Norte', :zip_code => '78.875-000', :state => state); c.save 
c = City.new(:name => 'General Carneiro', :zip_code => '78.620-000', :state => state); c.save 
c = City.new(:name => 'Guaranta Do Norte', :zip_code => '78.520-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Da Guia', :zip_code => '78.104-000', :state => state); c.save 
c = City.new(:name => 'Guiratinga', :zip_code => '78.760-000', :state => state); c.save 
c = City.new(:name => 'Irenopolis', :zip_code => '78.813-000', :state => state); c.save 
c = City.new(:name => 'Itauba', :zip_code => '78.510-000', :state => state); c.save 
c = City.new(:name => 'Itiquira', :zip_code => '78.790-000', :state => state); c.save 
c = City.new(:name => 'Jaciara', :zip_code => '78.820-000', :state => state); c.save 
c = City.new(:name => 'Jangada', :zip_code => '78.490-000', :state => state); c.save 
c = City.new(:name => 'Jarudore', :zip_code => '78.806-000', :state => state); c.save 
c = City.new(:name => 'Jatoba', :zip_code => '78.823-000', :state => state); c.save 
c = City.new(:name => 'Jauru', :zip_code => '78.255-000', :state => state); c.save 
c = City.new(:name => 'Joselandia', :zip_code => '78.192-000', :state => state); c.save 
c = City.new(:name => 'Juara', :zip_code => '78.575-000', :state => state); c.save 
c = City.new(:name => 'Juina', :zip_code => '78.320-000', :state => state); c.save 
c = City.new(:name => 'Juruena', :zip_code => '78.340-000', :state => state); c.save 
c = City.new(:name => 'Juscimeira', :zip_code => '78.810-000', :state => state); c.save 
c = City.new(:name => 'Lambari Doeste', :zip_code => '78.278-000', :state => state); c.save 
c = City.new(:name => 'Lavouras', :zip_code => '78.414-000', :state => state); c.save 
c = City.new(:name => 'Lucas Do Rio Verde', :zip_code => '78.455-000', :state => state); c.save 
c = City.new(:name => 'Lucialva', :zip_code => '78.258-000', :state => state); c.save 
c = City.new(:name => 'Luciara', :zip_code => '78.660-000', :state => state); c.save 
c = City.new(:name => 'Marcelandia', :zip_code => '78.535-000', :state => state); c.save 
c = City.new(:name => 'Nova Marilandia', :zip_code => '78.415-000', :state => state); c.save 
c = City.new(:name => 'Matupa', :zip_code => '78.525-000', :state => state); c.save 
c = City.new(:name => 'Marzagao', :zip_code => '78.478-000', :state => state); c.save 
c = City.new(:name => 'Mimoso', :zip_code => '78.188-000', :state => state); c.save 
c = City.new(:name => 'Mirassol Doeste', :zip_code => '78.280-000', :state => state); c.save 
c = City.new(:name => 'Nobres', :zip_code => '78.460-000', :state => state); c.save 
c = City.new(:name => 'Nortelandia', :zip_code => '78.430-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Do Livramento', :zip_code => '78.170-000', :state => state); c.save 
c = City.new(:name => 'Nova Bandeirantes', :zip_code => '78.565-000', :state => state); c.save 
c = City.new(:name => 'Nova Brasilandia', :zip_code => '78.860-000', :state => state); c.save 
c = City.new(:name => 'Nova Canaa Do Norte', :zip_code => '78.515-000', :state => state); c.save 
c = City.new(:name => 'Nova Galileia', :zip_code => '78.754-000', :state => state); c.save 
c = City.new(:name => 'Nova Mutum', :zip_code => '78.450-000', :state => state); c.save 
c = City.new(:name => 'Nova Olimpia', :zip_code => '78.370-000', :state => state); c.save 
c = City.new(:name => 'Nova Xavantina', :zip_code => '78.690-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte Do Norte', :zip_code => '78.570-000', :state => state); c.save 
c = City.new(:name => 'Novo Sao Joaquim', :zip_code => '78.625-000', :state => state); c.save 
c = City.new(:name => 'Paraiso Do Leste', :zip_code => '78.808-000', :state => state); c.save 
c = City.new(:name => 'Paranaita', :zip_code => '78.590-000', :state => state); c.save 
c = City.new(:name => 'Paranatinga', :zip_code => '78.870-000', :state => state); c.save 
c = City.new(:name => 'Pedra Preta', :zip_code => '78.795-000', :state => state); c.save 
c = City.new(:name => 'Peixoto De Azevedo', :zip_code => '78.530-000', :state => state); c.save 
c = City.new(:name => 'Pocone', :zip_code => '78.175-000', :state => state); c.save 
c = City.new(:name => 'Ponte Branca', :zip_code => '78.610-000', :state => state); c.save 
c = City.new(:name => 'Pontes E Lacerda', :zip_code => '78.250-000', :state => state); c.save 
c = City.new(:name => 'Porto Alegre Do Norte', :zip_code => '78.655-000', :state => state); c.save 
c = City.new(:name => 'Porto Dos Gauchos', :zip_code => '78.560-000', :state => state); c.save 
c = City.new(:name => 'Porto Esperidiao', :zip_code => '78.240-000', :state => state); c.save 
c = City.new(:name => 'Porto Estrela', :zip_code => '78.398-000', :state => state); c.save 
c = City.new(:name => 'Poxoreo', :zip_code => '78.800-000', :state => state); c.save 
c = City.new(:name => 'Primavera Do Leste', :zip_code => '78.850-000', :state => state); c.save 
c = City.new(:name => 'Progresso', :zip_code => '78.305-000', :state => state); c.save 
c = City.new(:name => 'Reserva Do Cabacal', :zip_code => '78.265-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Cascalheira', :zip_code => '78.675-000', :state => state); c.save 
c = City.new(:name => 'Ribeiraozinho', :zip_code => '78.613-000', :state => state); c.save 
c = City.new(:name => 'Rio Branco', :zip_code => '78.275-000', :state => state); c.save 
c = City.new(:name => 'Rondonopolis', :zip_code => '78.700-000', :state => state); c.save 
c = City.new(:name => 'Rosario Oeste', :zip_code => '78.470-000', :state => state); c.save 
c = City.new(:name => 'Salto Do Ceu', :zip_code => '78.270-000', :state => state); c.save 
c = City.new(:name => 'Santa Carmem', :zip_code => '78.545-000', :state => state); c.save 
c = City.new(:name => 'Santa Elvira', :zip_code => '78.816-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita', :zip_code => '78.463-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '78.650-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Leverger', :zip_code => '78.180-000', :state => state); c.save 
c = City.new(:name => 'Sao Felix Do Araguaia', :zip_code => '78.670-000', :state => state); c.save 
c = City.new(:name => 'Sao Joaquim', :zip_code => '78.306-000', :state => state); c.save 
c = City.new(:name => 'Sao Jorge', :zip_code => '78.311-000', :state => state); c.save 
c = City.new(:name => 'Sao Vicente', :zip_code => '78.106-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Planalto', :zip_code => '78.798-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Povo', :zip_code => '78.773-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Rio Claro', :zip_code => '78.435-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Xingu', :zip_code => '78.663-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Dos Quatro Marcos', :zip_code => '78.285-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco De Fatima', :zip_code => '78.818-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Da Cipa', :zip_code => '78.835-000', :state => state); c.save 
c = City.new(:name => 'Sinop', :zip_code => '78.550-000', :state => state); c.save 
c = City.new(:name => 'Sorriso', :zip_code => '78.890-000', :state => state); c.save 
c = City.new(:name => 'Tangara Da Serra', :zip_code => '78.300-000', :state => state); c.save 
c = City.new(:name => 'Tapurah', :zip_code => '78.555-000', :state => state); c.save 
c = City.new(:name => 'Alto Taquari', :zip_code => '78.785-000', :state => state); c.save 
c = City.new(:name => 'Terra Nova Do Norte', :zip_code => '78.505-000', :state => state); c.save 
c = City.new(:name => 'Tesouro', :zip_code => '78.775-000', :state => state); c.save 
c = City.new(:name => 'Toricueyje', :zip_code => '78.606-000', :state => state); c.save 
c = City.new(:name => 'Torixoreu', :zip_code => '78.695-000', :state => state); c.save 
c = City.new(:name => 'Vale Rico', :zip_code => '78.766-000', :state => state); c.save 
c = City.new(:name => 'Varzea Grande', :zip_code => '78.110-000', :state => state); c.save 
c = City.new(:name => 'Vera', :zip_code => '78.880-000', :state => state); c.save 
c = City.new(:name => 'Vila Bela Da Santissima Trindade', :zip_code => '78.245-000', :state => state); c.save 
c = City.new(:name => 'Vila Operaria', :zip_code => '78.758-000', :state => state); c.save 
c = City.new(:name => 'Vila Rica', :zip_code => '78.645-000', :state => state); c.save 
c = City.new(:name => 'Selma', :zip_code => '78.828-000', :state => state); c.save 
c = City.new(:name => 'Fazenda De Cima', :zip_code => '78.176-000', :state => state); c.save 
c = City.new(:name => 'Coxipo Do Ouro', :zip_code => '78.102-000', :state => state); c.save 
c = City.new(:name => 'Comodoro', :zip_code => '78.310-000', :state => state); c.save 
c = City.new(:name => 'Faval', :zip_code => '78.171-000', :state => state); c.save 
c = City.new(:name => 'Indiavai', :zip_code => '78.295-000', :state => state); c.save 
c = City.new(:name => 'Passagem Da Conceicao', :zip_code => '78.168-000', :state => state); c.save 
c = City.new(:name => 'Padronal', :zip_code => '78.316-000', :state => state); c.save 
c = City.new(:name => 'Pombas', :zip_code => '78.834-000', :state => state); c.save 
c = City.new(:name => 'Pirizal', :zip_code => '78.172-000', :state => state); c.save 
c = City.new(:name => 'Santo Afonso', :zip_code => '78.425-000', :state => state); c.save 
c = City.new(:name => 'Cangas', :zip_code => '78.178-000', :state => state); c.save 
c = City.new(:name => 'Ainhumas', :zip_code => '78.751-000', :state => state); c.save 
c = City.new(:name => 'Varginha', :zip_code => '78.184-000', :state => state); c.save 
c = City.new(:name => 'Campo Novo Do Parecis', :zip_code => '78.360-000', :state => state); c.save 
c = City.new(:name => 'Campo Verde', :zip_code => '78.840-000', :state => state); c.save 
c = City.new(:name => 'Nova Monte Verde', :zip_code => '78.593-000', :state => state); c.save 
c = City.new(:name => 'Ribeirao Dos Cocais', :zip_code => '78.173-000', :state => state); c.save 
c = City.new(:name => 'Sonho Azul', :zip_code => '78.284-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe', :zip_code => '78.288-000', :state => state); c.save 
c = City.new(:name => 'Aguapei', :zip_code => '78.248-000', :state => state); c.save 
c = City.new(:name => 'Sao Domingos', :zip_code => '78.253-000', :state => state); c.save 
c = City.new(:name => 'Nova Alvorada', :zip_code => '78.314-000', :state => state); c.save 
c = City.new(:name => 'Campos De Julio', :zip_code => '78.307-000', :state => state); c.save 
c = City.new(:name => 'Tapirapua', :zip_code => '78.396-000', :state => state); c.save 
c = City.new(:name => 'Assari', :zip_code => '78.394-000', :state => state); c.save 
c = City.new(:name => 'Baus', :zip_code => '78.481-000', :state => state); c.save 
c = City.new(:name => 'Novo Eldorado', :zip_code => '78.558-000', :state => state); c.save 
c = City.new(:name => 'Tabapora', :zip_code => '78.563-000', :state => state); c.save 
c = City.new(:name => 'Nova Maringa', :zip_code => '78.445-000', :state => state); c.save 
c = City.new(:name => 'Castanheira', :zip_code => '78.345-000', :state => state); c.save 
c = City.new(:name => 'Cotriguacu', :zip_code => '78.330-000', :state => state); c.save 
c = City.new(:name => 'Carlinda', :zip_code => '78.587-000', :state => state); c.save 
c = City.new(:name => 'Buriti', :zip_code => '78.782-000', :state => state); c.save 
c = City.new(:name => 'Capao Verde', :zip_code => '78.413-000', :state => state); c.save 
c = City.new(:name => 'Nova Ubirata', :zip_code => '78.888-000', :state => state); c.save 
c = City.new(:name => 'Primavera', :zip_code => '78.898-000', :state => state); c.save 
c = City.new(:name => 'Caravagio', :zip_code => '78.894-000', :state => state); c.save 
c = City.new(:name => 'Boa Esperanca', :zip_code => '78.896-000', :state => state); c.save 
c = City.new(:name => 'Vale Dos Sonhos', :zip_code => '78.608-000', :state => state); c.save 
c = City.new(:name => 'Rio Manso', :zip_code => '78.863-000', :state => state); c.save 
c = City.new(:name => 'Rancharia', :zip_code => '78.868-000', :state => state); c.save 
c = City.new(:name => 'Riolandia', :zip_code => '78.866-000', :state => state); c.save 
c = City.new(:name => 'Boa Uniao', :zip_code => '78.277-000', :state => state); c.save 
c = City.new(:name => 'Caramujo', :zip_code => '78.236-000', :state => state); c.save 
c = City.new(:name => 'Curvelandia', :zip_code => '78.232-000', :state => state); c.save 
c = City.new(:name => 'Vila Progresso', :zip_code => '78.274-000', :state => state); c.save 
c = City.new(:name => 'Bezerro Branco', :zip_code => '78.234-000', :state => state); c.save 
c = City.new(:name => 'Horizonte Do Oeste', :zip_code => '78.238-000', :state => state); c.save 
c = City.new(:name => 'Caite', :zip_code => '78.186-000', :state => state); c.save 
c = City.new(:name => 'Colorado Do Norte', :zip_code => '78.518-000', :state => state); c.save 
c = City.new(:name => 'Praia Rica', :zip_code => '78.198-000', :state => state); c.save 
c = City.new(:name => 'Alto Juruena', :zip_code => '78.318-000', :state => state); c.save 
c = City.new(:name => 'Nova Guarita', :zip_code => '78.508-000', :state => state); c.save 
c = City.new(:name => 'Querencia', :zip_code => '78.643-000', :state => state); c.save 
c = City.new(:name => 'Canabrava Do Norte', :zip_code => '78.658-000', :state => state); c.save 
c = City.new(:name => 'Alto Boa Vista', :zip_code => '78.665-000', :state => state); c.save 
c = City.new(:name => 'Planalto Da Serra', :zip_code => '78.855-000', :state => state); c.save 
c = City.new(:name => 'Coxipo Acu', :zip_code => '78.101-000', :state => state); c.save 
c = City.new(:name => 'Machado', :zip_code => '78.103-000', :state => state); c.save 
c = City.new(:name => 'Mata Dentro', :zip_code => '78.107-000', :state => state); c.save 
c = City.new(:name => 'Aguacu', :zip_code => '78.108-000', :state => state); c.save 
c = City.new(:name => 'Pai Andre', :zip_code => '78.167-000', :state => state); c.save 
c = City.new(:name => 'Guarita', :zip_code => '78.169-000', :state => state); c.save 
c = City.new(:name => 'Vila Paulista', :zip_code => '78.753-000', :state => state); c.save 
c = City.new(:name => 'Nova Catanduva', :zip_code => '78.755-000', :state => state); c.save 
c = City.new(:name => 'Tres Pontes', :zip_code => '78.757-000', :state => state); c.save 
c = City.new(:name => 'Ponte De Pedra', :zip_code => '78.759-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '78.313-000', :state => state); c.save 
c = City.new(:name => 'Filadelfia', :zip_code => '78.321-000', :state => state); c.save 
c = City.new(:name => 'Terra Roxa', :zip_code => '78.322-000', :state => state); c.save 
c = City.new(:name => 'Cidade Morena', :zip_code => '78.326-000', :state => state); c.save 
c = City.new(:name => 'Itamarati Norte', :zip_code => '78.361-000', :state => state); c.save 
c = City.new(:name => 'Del Rios', :zip_code => '78.405-000', :state => state); c.save 
c = City.new(:name => 'Novo Diamantino', :zip_code => '78.402-000', :state => state); c.save 
c = City.new(:name => 'Sumidouro', :zip_code => '78.404-000', :state => state); c.save 
c = City.new(:name => 'Campos Novos', :zip_code => '78.411-000', :state => state); c.save 
c = City.new(:name => 'Nonoai Do Norte', :zip_code => '78.502-000', :state => state); c.save 
c = City.new(:name => 'Cotrel', :zip_code => '78.522-000', :state => state); c.save 
c = City.new(:name => 'Novo Mundo', :zip_code => '78.528-000', :state => state); c.save 
c = City.new(:name => 'Flor Da Serra', :zip_code => '78.524-000', :state => state); c.save 
c = City.new(:name => 'Analandia Do Norte', :zip_code => '78.534-000', :state => state); c.save 
c = City.new(:name => 'Vila Atlantica', :zip_code => '78.536-000', :state => state); c.save 
c = City.new(:name => 'Sao Cristovao', :zip_code => '78.551-000', :state => state); c.save 
c = City.new(:name => 'Novo Parana', :zip_code => '78.562-000', :state => state); c.save 
c = City.new(:name => 'Aguas Claras', :zip_code => '78.572-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Apui', :zip_code => '78.583-000', :state => state); c.save 
c = City.new(:name => 'Vila Mutum', :zip_code => '78.585-000', :state => state); c.save 
c = City.new(:name => 'Sangradouro', :zip_code => '78.623-000', :state => state); c.save 
c = City.new(:name => 'Indianapolis', :zip_code => '78.603-000', :state => state); c.save 
c = City.new(:name => 'Santaninha', :zip_code => '78.648-000', :state => state); c.save 
c = City.new(:name => 'Confresa', :zip_code => '78.652-000', :state => state); c.save 
c = City.new(:name => 'Placa De Santo Antonio', :zip_code => '78.811-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Do Rio Bonito', :zip_code => '78.891-000', :state => state); c.save 
c = City.new(:name => 'Pontinopolis', :zip_code => '78.672-000', :state => state); c.save 
c = City.new(:name => 'Serra Nova', :zip_code => '78.673-000', :state => state); c.save 
c = City.new(:name => 'Vila Santo Antonio', :zip_code => '78.674-000', :state => state); c.save 
c = City.new(:name => 'Nova Brasilia', :zip_code => '78.691-000', :state => state); c.save 
c = City.new(:name => 'Pontal Do Araguaia', :zip_code => '78.698-000', :state => state); c.save 
c = City.new(:name => 'Vila Bueno', :zip_code => '78.757-000', :state => state); c.save 
c = City.new(:name => 'Bel Rios', :zip_code => '78.401-000', :state => state); c.save 
c = City.new(:name => 'Nova Lacerda', :zip_code => '78.243-000', :state => state); c.save 
c = City.new(:name => 'Sapezal', :zip_code => '78.365-000', :state => state); c.save 
c = City.new(:name => 'Uniao Do Sul', :zip_code => '78.543-000', :state => state); c.save 
c = City.new(:name => 'Feliz Natal', :zip_code => '78.885-000', :state => state); c.save 

