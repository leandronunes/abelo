#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Piauí')
state ||= State.create!( :name => 'Piauí', :code => 'PI', :country => country);

c = City.new(:name => 'Agricolandia', :zip_code => '64.440-000', :state => state); c.save 
c = City.new(:name => 'Agua Branca', :zip_code => '64.460-000', :state => state); c.save 
c = City.new(:name => 'Alto Longa', :zip_code => '64.360-000', :state => state); c.save 
c = City.new(:name => 'Altos', :zip_code => '64.290-000', :state => state); c.save 
c = City.new(:name => 'Amarante', :zip_code => '64.400-000', :state => state); c.save 
c = City.new(:name => 'Angical Do Piaui', :zip_code => '64.410-000', :state => state); c.save 
c = City.new(:name => 'Anisio De Abreu', :zip_code => '64.780-000', :state => state); c.save 
c = City.new(:name => 'Antonio Almeida', :zip_code => '64.855-000', :state => state); c.save 
c = City.new(:name => 'Aroazes', :zip_code => '64.310-000', :state => state); c.save 
c = City.new(:name => 'Arraial', :zip_code => '64.480-000', :state => state); c.save 
c = City.new(:name => 'Avelino Lopes', :zip_code => '64.965-000', :state => state); c.save 
c = City.new(:name => 'Barras', :zip_code => '64.100-000', :state => state); c.save 
c = City.new(:name => 'Barreiras Do Piaui', :zip_code => '64.990-000', :state => state); c.save 
c = City.new(:name => 'Barro Duro', :zip_code => '64.455-000', :state => state); c.save 
c = City.new(:name => 'Batalha', :zip_code => '64.190-000', :state => state); c.save 
c = City.new(:name => 'Beneditinos', :zip_code => '64.380-000', :state => state); c.save 
c = City.new(:name => 'Bertolinia', :zip_code => '64.870-000', :state => state); c.save 
c = City.new(:name => 'Bocaina', :zip_code => '64.630-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus', :zip_code => '64.900-000', :state => state); c.save 
c = City.new(:name => 'Buriti Dos Lopes', :zip_code => '64.230-000', :state => state); c.save 
c = City.new(:name => 'Campinas Do Piaui', :zip_code => '64.730-000', :state => state); c.save 
c = City.new(:name => 'Campo Maior', :zip_code => '64.280-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Canabrava', :zip_code => '64.635-000', :state => state); c.save 
c = City.new(:name => 'Canavieira', :zip_code => '64.833-000', :state => state); c.save 
c = City.new(:name => 'Canto Do Buriti', :zip_code => '64.890-000', :state => state); c.save 
c = City.new(:name => 'Capitao De Campos', :zip_code => '64.270-000', :state => state); c.save 
c = City.new(:name => 'Caracol', :zip_code => '64.795-000', :state => state); c.save 
c = City.new(:name => 'Castelo Do Piaui', :zip_code => '64.340-000', :state => state); c.save 
c = City.new(:name => 'Cocal', :zip_code => '64.235-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Caninde', :zip_code => '64.740-000', :state => state); c.save 
c = City.new(:name => 'Corrente', :zip_code => '64.980-000', :state => state); c.save 
c = City.new(:name => 'Cristalandia Do Piaui', :zip_code => '64.995-000', :state => state); c.save 
c = City.new(:name => 'Cristino Castro', :zip_code => '64.920-000', :state => state); c.save 
c = City.new(:name => 'Curimata', :zip_code => '64.960-000', :state => state); c.save 
c = City.new(:name => 'Dom Inocencio', :zip_code => '64.790-000', :state => state); c.save 
c = City.new(:name => 'Demerval Lobao', :zip_code => '64.390-000', :state => state); c.save 
c = City.new(:name => 'Dirceu Arcoverde', :zip_code => '64.785-000', :state => state); c.save 
c = City.new(:name => 'Dom Expedito Lopes', :zip_code => '64.620-000', :state => state); c.save 
c = City.new(:name => 'Domingos Mourao', :zip_code => '64.250-000', :state => state); c.save 
c = City.new(:name => 'Elesbao Veloso', :zip_code => '64.325-000', :state => state); c.save 
c = City.new(:name => 'Eliseu Martins', :zip_code => '64.880-000', :state => state); c.save 
c = City.new(:name => 'Esperantina', :zip_code => '64.180-000', :state => state); c.save 
c = City.new(:name => 'Flores Do Piaui', :zip_code => '64.815-000', :state => state); c.save 
c = City.new(:name => 'Floriano', :zip_code => '64.800-000', :state => state); c.save 
c = City.new(:name => 'Francinopolis', :zip_code => '64.520-000', :state => state); c.save 
c = City.new(:name => 'Francisco Ayres', :zip_code => '64.475-000', :state => state); c.save 
c = City.new(:name => 'Francisco Santos', :zip_code => '64.645-000', :state => state); c.save 
c = City.new(:name => 'Fronteiras', :zip_code => '64.690-000', :state => state); c.save 
c = City.new(:name => 'Gilbues', :zip_code => '64.930-000', :state => state); c.save 
c = City.new(:name => 'Guadalupe', :zip_code => '64.840-000', :state => state); c.save 
c = City.new(:name => 'Hugo Napoleao', :zip_code => '64.470-000', :state => state); c.save 
c = City.new(:name => 'Inhuma', :zip_code => '64.535-000', :state => state); c.save 
c = City.new(:name => 'Ipiranga Do Piaui', :zip_code => '64.540-000', :state => state); c.save 
c = City.new(:name => 'Isaias Coelho', :zip_code => '64.570-000', :state => state); c.save 
c = City.new(:name => 'Itainopolis', :zip_code => '64.565-000', :state => state); c.save 
c = City.new(:name => 'Itaueira', :zip_code => '64.820-000', :state => state); c.save 
c = City.new(:name => 'Jaicos', :zip_code => '64.575-000', :state => state); c.save 
c = City.new(:name => 'Jerumenha', :zip_code => '64.830-000', :state => state); c.save 
c = City.new(:name => 'Joaquim Pires', :zip_code => '64.170-000', :state => state); c.save 
c = City.new(:name => 'Jose De Freitas', :zip_code => '64.110-000', :state => state); c.save 
c = City.new(:name => 'Landri Sales', :zip_code => '64.850-000', :state => state); c.save 
c = City.new(:name => 'Luis Correia', :zip_code => '64.220-000', :state => state); c.save 
c = City.new(:name => 'Luzilandia', :zip_code => '64.160-000', :state => state); c.save 
c = City.new(:name => 'Manoel Emidio', :zip_code => '64.875-000', :state => state); c.save 
c = City.new(:name => 'Marcos Parente', :zip_code => '64.845-000', :state => state); c.save 
c = City.new(:name => 'Matias Olimpio', :zip_code => '64.150-000', :state => state); c.save 
c = City.new(:name => 'Miguel Alves', :zip_code => '64.130-000', :state => state); c.save 
c = City.new(:name => 'Miguel Leao', :zip_code => '64.445-000', :state => state); c.save 
c = City.new(:name => 'Monsenhor Gil', :zip_code => '64.450-000', :state => state); c.save 
c = City.new(:name => 'Monsenhor Hipolito', :zip_code => '64.650-000', :state => state); c.save 
c = City.new(:name => 'Monte Alegre Do Piaui', :zip_code => '64.940-000', :state => state); c.save 
c = City.new(:name => 'Nazare Do Piaui', :zip_code => '64.825-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora Dos Remedios', :zip_code => '64.140-000', :state => state); c.save 
c = City.new(:name => 'Novo Oriente Do Piaui', :zip_code => '64.530-000', :state => state); c.save 
c = City.new(:name => 'Colonia Do Gurgueia', :zip_code => '64.885-000', :state => state); c.save 
c = City.new(:name => 'Oeiras', :zip_code => '64.500-000', :state => state); c.save 
c = City.new(:name => 'Padre Marcos', :zip_code => '64.680-000', :state => state); c.save 
c = City.new(:name => 'Paes Landim', :zip_code => '64.710-000', :state => state); c.save 
c = City.new(:name => 'Palmeira Do Piaui', :zip_code => '64.925-000', :state => state); c.save 
c = City.new(:name => 'Palmeirais', :zip_code => '64.420-000', :state => state); c.save 
c = City.new(:name => 'Parnagua', :zip_code => '64.970-000', :state => state); c.save 
c = City.new(:name => 'Parnaiba', :zip_code => '64.200-000', :state => state); c.save 
c = City.new(:name => 'Paulistana', :zip_code => '64.750-000', :state => state); c.save 
c = City.new(:name => 'Pedro Ii', :zip_code => '64.255-000', :state => state); c.save 
c = City.new(:name => 'Picos', :zip_code => '64.600-000', :state => state); c.save 
c = City.new(:name => 'Pimenteiras', :zip_code => '64.320-000', :state => state); c.save 
c = City.new(:name => 'Pio Ix', :zip_code => '64.660-000', :state => state); c.save 
c = City.new(:name => 'Piracuruca', :zip_code => '64.240-000', :state => state); c.save 
c = City.new(:name => 'Piripiri', :zip_code => '64.260-000', :state => state); c.save 
c = City.new(:name => 'Porto', :zip_code => '64.145-000', :state => state); c.save 
c = City.new(:name => 'Prata Do Piaui', :zip_code => '64.370-000', :state => state); c.save 
c = City.new(:name => 'Redencao Do Gurgueia', :zip_code => '64.915-000', :state => state); c.save 
c = City.new(:name => 'Regeneracao', :zip_code => '64.490-000', :state => state); c.save 
c = City.new(:name => 'Ribeiro Goncalves', :zip_code => '64.865-000', :state => state); c.save 
c = City.new(:name => 'Rio Grande Do Piaui', :zip_code => '64.835-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Do Piaui', :zip_code => '64.545-000', :state => state); c.save 
c = City.new(:name => 'Santa Filomena', :zip_code => '64.945-000', :state => state); c.save 
c = City.new(:name => 'Santa Luz', :zip_code => '64.910-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio De Lisboa', :zip_code => '64.640-000', :state => state); c.save 
c = City.new(:name => 'Santo Inacio Do Piaui', :zip_code => '64.560-000', :state => state); c.save 
c = City.new(:name => 'Sao Felix Do Piaui', :zip_code => '64.375-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco Do Piaui', :zip_code => '64.550-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Piaui', :zip_code => '64.435-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Serra', :zip_code => '64.350-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Piaui', :zip_code => '64.760-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Divino', :zip_code => '64.245-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Peixe', :zip_code => '64.555-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Piaui', :zip_code => '64.625-000', :state => state); c.save 
c = City.new(:name => 'Sao Juliao', :zip_code => '64.670-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Tapuio', :zip_code => '64.330-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro Do Piaui', :zip_code => '64.430-000', :state => state); c.save 
c = City.new(:name => 'Sao Raimundo Nonato', :zip_code => '64.770-000', :state => state); c.save 
c = City.new(:name => 'Simoes', :zip_code => '64.585-000', :state => state); c.save 
c = City.new(:name => 'Simplicio Mendes', :zip_code => '64.700-000', :state => state); c.save 
c = City.new(:name => 'Socorro Do Piaui', :zip_code => '64.720-000', :state => state); c.save 
c = City.new(:name => 'Teresina', :zip_code => '64.000-000', :state => state); c.save 
c = City.new(:name => 'Uniao', :zip_code => '64.120-000', :state => state); c.save 
c = City.new(:name => 'Urucui', :zip_code => '64.860-000', :state => state); c.save 
c = City.new(:name => 'Valenca Do Piaui', :zip_code => '64.300-000', :state => state); c.save 
c = City.new(:name => 'Varzea Grande', :zip_code => '64.525-000', :state => state); c.save 
c = City.new(:name => 'Novo Nilo', :zip_code => '64.125-000', :state => state); c.save 
c = City.new(:name => 'Alagoinha Do Piaui', :zip_code => '64.655-000', :state => state); c.save 
c = City.new(:name => 'Cabeceiras Do Piaui', :zip_code => '64.105-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Alegre', :zip_code => '64.138-000', :state => state); c.save 
c = City.new(:name => 'Brasileira', :zip_code => '64.265-000', :state => state); c.save 
c = City.new(:name => 'Bom Principio Do Piaui', :zip_code => '64.225-000', :state => state); c.save 
c = City.new(:name => 'Santa Cruz Dos Milagres', :zip_code => '64.315-000', :state => state); c.save 
c = City.new(:name => 'Coivaras', :zip_code => '64.335-000', :state => state); c.save 
c = City.new(:name => 'Sigefredo Pacheco', :zip_code => '64.285-000', :state => state); c.save 
c = City.new(:name => 'Buriti Dos Montes', :zip_code => '64.345-000', :state => state); c.save 
c = City.new(:name => 'Passagem Franca Do Piaui', :zip_code => '64.395-000', :state => state); c.save 
c = City.new(:name => 'Jardim Do Mulato', :zip_code => '64.495-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa Do Piaui', :zip_code => '64.518-000', :state => state); c.save 
c = City.new(:name => 'Colonia Do Piaui', :zip_code => '64.516-000', :state => state); c.save 
c = City.new(:name => 'Patos Do Piaui', :zip_code => '64.580-000', :state => state); c.save 
c = City.new(:name => 'Santana Do Piaui', :zip_code => '64.615-000', :state => state); c.save 
c = City.new(:name => 'Caldeirao Grande Do Piaui', :zip_code => '64.695-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Barro Do Piaui', :zip_code => '64.768-000', :state => state); c.save 
c = City.new(:name => 'Coronel Jose Dias', :zip_code => '64.793-000', :state => state); c.save 
c = City.new(:name => 'Bonfim Do Piaui', :zip_code => '64.775-000', :state => state); c.save 
c = City.new(:name => 'Fartura Do Piaui', :zip_code => '64.788-000', :state => state); c.save 
c = City.new(:name => 'Sao Braz Do Piaui', :zip_code => '64.783-000', :state => state); c.save 
c = City.new(:name => 'Jacobina Do Piaui', :zip_code => '64.755-000', :state => state); c.save 
c = City.new(:name => 'Alegrete Do Piaui', :zip_code => '64.675-000', :state => state); c.save 
c = City.new(:name => 'Baixa Grande Do Ribeiro', :zip_code => '64.868-000', :state => state); c.save 
c = City.new(:name => 'Marcolandia', :zip_code => '64.685-000', :state => state); c.save 
c = City.new(:name => 'Queimada Nova', :zip_code => '64.758-000', :state => state); c.save 
c = City.new(:name => 'Sao Lourenco Do Piaui', :zip_code => '64.778-000', :state => state); c.save 
c = City.new(:name => 'Varzea Branca', :zip_code => '64.773-000', :state => state); c.save 
c = City.new(:name => 'Boa Hora', :zip_code => '64.108-000', :state => state); c.save 
c = City.new(:name => 'Campo Largo Do Piaui', :zip_code => '64.148-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Arraial', :zip_code => '64.155-000', :state => state); c.save 
c = City.new(:name => 'Joca Marques', :zip_code => '64.165-000', :state => state); c.save 
c = City.new(:name => 'Madeiro', :zip_code => '64.168-000', :state => state); c.save 
c = City.new(:name => 'Murici Dos Portelas', :zip_code => '64.175-000', :state => state); c.save 
c = City.new(:name => 'Morro Do Chapeu Do Piaui', :zip_code => '64.178-000', :state => state); c.save 
c = City.new(:name => 'Cajueiro Da Praia', :zip_code => '64.222-000', :state => state); c.save 
c = City.new(:name => 'Ilha Grande', :zip_code => '64.224-000', :state => state); c.save 
c = City.new(:name => 'Caxingo', :zip_code => '64.228-000', :state => state); c.save 
c = City.new(:name => 'Caraubas Do Piaui', :zip_code => '64.233-000', :state => state); c.save 
c = City.new(:name => 'Cocal Dos Alves', :zip_code => '64.238-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Fronteira', :zip_code => '64.243-000', :state => state); c.save 
c = City.new(:name => 'Lagoa De Sao Francisco', :zip_code => '64.258-000', :state => state); c.save 
c = City.new(:name => 'Milton Brandao', :zip_code => '64.253-000', :state => state); c.save 
c = City.new(:name => 'Jatoba Do Piaui', :zip_code => '64.275-000', :state => state); c.save 
c = City.new(:name => 'Cocal De Telha', :zip_code => '64.278-000', :state => state); c.save 
c = City.new(:name => 'Boqueirao Do Piaui', :zip_code => '64.283-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora De Nazare', :zip_code => '64.288-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Sitio', :zip_code => '64.308-000', :state => state); c.save 
c = City.new(:name => 'Assuncao Do Piaui', :zip_code => '64.333-000', :state => state); c.save 
c = City.new(:name => 'Juazeiro Do Piaui', :zip_code => '64.343-000', :state => state); c.save 
c = City.new(:name => 'Novo Santo Antonio', :zip_code => '64.365-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Da Baixa Grande', :zip_code => '64.378-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Piaui', :zip_code => '64.388-000', :state => state); c.save 
c = City.new(:name => 'Santo Antonio Dos Milagres', :zip_code => '64.438-000', :state => state); c.save 
c = City.new(:name => 'Curralinhos', :zip_code => '64.453-000', :state => state); c.save 
c = City.new(:name => 'Lagoinha Do Piaui', :zip_code => '64.465-000', :state => state); c.save 
c = City.new(:name => 'Olho Dagua Do Piaui', :zip_code => '64.468-000', :state => state); c.save 
c = City.new(:name => 'Tanque Do Piaui', :zip_code => '64.512-000', :state => state); c.save 
c = City.new(:name => 'Cajazeiras Do Piaui', :zip_code => '64.514-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Da Varjota', :zip_code => '64.510-000', :state => state); c.save 
c = City.new(:name => 'Barra Dalcantara', :zip_code => '64.528-000', :state => state); c.save 
c = City.new(:name => 'Wall Ferraz', :zip_code => '64.548-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Fidalgo', :zip_code => '64.558-000', :state => state); c.save 
c = City.new(:name => 'Floresta Do Piaui', :zip_code => '64.563-000', :state => state); c.save 
c = City.new(:name => 'Vera Mendes', :zip_code => '64.568-000', :state => state); c.save 
c = City.new(:name => 'Massape Do Piaui', :zip_code => '64.573-000', :state => state); c.save 
c = City.new(:name => 'Campo Grande Do Piaui', :zip_code => '64.578-000', :state => state); c.save 
c = City.new(:name => 'Caridade Do Piaui', :zip_code => '64.590-000', :state => state); c.save 
c = City.new(:name => 'Curral Novo Do Piaui', :zip_code => '64.595-000', :state => state); c.save 
c = City.new(:name => 'Geminiano', :zip_code => '64.613-000', :state => state); c.save 
c = City.new(:name => 'Paqueta', :zip_code => '64.618-000', :state => state); c.save 
c = City.new(:name => 'Sussuapara', :zip_code => '64.610-000', :state => state); c.save 
c = City.new(:name => 'Sao Luis Do Piaui', :zip_code => '64.638-000', :state => state); c.save 
c = City.new(:name => 'Belem Do Piaui', :zip_code => '64.678-000', :state => state); c.save 
c = City.new(:name => 'Francisco Macedo', :zip_code => '64.683-000', :state => state); c.save 
c = City.new(:name => 'Vila Nova Do Piaui', :zip_code => '64.688-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista Do Piaui', :zip_code => '64.705-000', :state => state); c.save 
c = City.new(:name => 'Sao Francisco De Assis Do Piaui', :zip_code => '64.745-000', :state => state); c.save 
c = City.new(:name => 'Acaua', :zip_code => '64.748-000', :state => state); c.save 
c = City.new(:name => 'Betania Do Piaui', :zip_code => '64.753-000', :state => state); c.save 
c = City.new(:name => 'Capitao Gervasio Oliveira', :zip_code => '64.763-000', :state => state); c.save 
c = City.new(:name => 'Nova Santa Rita', :zip_code => '64.764-000', :state => state); c.save 
c = City.new(:name => 'Joao Costa', :zip_code => '64.765-000', :state => state); c.save 
c = City.new(:name => 'Ribeira Do Piaui', :zip_code => '64.725-000', :state => state); c.save 
c = City.new(:name => 'Campo Alegre Do Fidalgo', :zip_code => '64.767-000', :state => state); c.save 
c = City.new(:name => 'Pedro Laurentino', :zip_code => '64.728-000', :state => state); c.save 
c = City.new(:name => 'Jurema', :zip_code => '64.782-000', :state => state); c.save 
c = City.new(:name => 'Guaribas', :zip_code => '64.798-000', :state => state); c.save 
c = City.new(:name => 'Pavussu', :zip_code => '64.838-000', :state => state); c.save 
c = City.new(:name => 'Porto Alegre Do Piaui', :zip_code => '64.858-000', :state => state); c.save 
c = City.new(:name => 'Sebastiao Leal', :zip_code => '64.873-000', :state => state); c.save 
c = City.new(:name => 'Tamboril Do Piaui', :zip_code => '64.893-000', :state => state); c.save 
c = City.new(:name => 'Brejo Do Piaui', :zip_code => '64.895-000', :state => state); c.save 
c = City.new(:name => 'Pajeu Do Piaui', :zip_code => '64.898-000', :state => state); c.save 
c = City.new(:name => 'Currais', :zip_code => '64.905-000', :state => state); c.save 
c = City.new(:name => 'Alvorada Do Gurgueia', :zip_code => '64.923-000', :state => state); c.save 
c = City.new(:name => 'Julio Borges', :zip_code => '64.963-000', :state => state); c.save 
c = City.new(:name => 'Morro Cabeca No Tempo', :zip_code => '64.968-000', :state => state); c.save 
c = City.new(:name => 'Riacho Frio', :zip_code => '64.975-000', :state => state); c.save 
c = City.new(:name => 'Sebastiao Barros', :zip_code => '64.985-000', :state => state); c.save 
c = City.new(:name => 'Sao Goncalo Do Gurgueia', :zip_code => '64.993-000', :state => state); c.save 

