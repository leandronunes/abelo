#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Tocantins')
state ||= State.create!( :name => 'Tocantins', :code => 'TO', :country => country);

c = City.new(:name => 'Abreulandia', :zip_code => '77.693-000', :state => state); c.save 
c = City.new(:name => 'Alianca Do Tocantins', :zip_code => '77.455-000', :state => state); c.save 
c = City.new(:name => 'Almas', :zip_code => '77.310-000', :state => state); c.save 
c = City.new(:name => 'Alvorada', :zip_code => '77.480-000', :state => state); c.save 
c = City.new(:name => 'Anajanopolis', :zip_code => '77.712-000', :state => state); c.save 
c = City.new(:name => 'Ananas', :zip_code => '77.890-000', :state => state); c.save 
c = City.new(:name => 'Apinaje', :zip_code => '77.393-000', :state => state); c.save 
c = City.new(:name => 'Araguacema', :zip_code => '77.690-000', :state => state); c.save 
c = City.new(:name => 'Araguacu', :zip_code => '77.475-000', :state => state); c.save 
c = City.new(:name => 'Caseara', :zip_code => '77.680-000', :state => state); c.save 
c = City.new(:name => 'Araguaina', :zip_code => '77.800-000', :state => state); c.save 
c = City.new(:name => 'Araguana', :zip_code => '77.855-000', :state => state); c.save 
c = City.new(:name => 'Araguatins', :zip_code => '77.950-000', :state => state); c.save 
c = City.new(:name => 'Arapoema', :zip_code => '77.780-000', :state => state); c.save 
c = City.new(:name => 'Arraias', :zip_code => '77.330-000', :state => state); c.save 
c = City.new(:name => 'Augustinopolis', :zip_code => '77.960-000', :state => state); c.save 
c = City.new(:name => 'Aurora Do Tocantins', :zip_code => '77.325-000', :state => state); c.save 
c = City.new(:name => 'Axixa Do Tocantins', :zip_code => '77.930-000', :state => state); c.save 
c = City.new(:name => 'Babaculandia', :zip_code => '77.870-000', :state => state); c.save 
c = City.new(:name => 'Barrolandia', :zip_code => '77.665-000', :state => state); c.save 
c = City.new(:name => 'Bernardo Sayao', :zip_code => '77.755-000', :state => state); c.save 
c = City.new(:name => 'Bom Jesus Do Tocantins', :zip_code => '77.714-000', :state => state); c.save 
c = City.new(:name => 'Brejinho De Nazare', :zip_code => '77.560-000', :state => state); c.save 
c = City.new(:name => 'Cachoeirinha', :zip_code => '77.915-000', :state => state); c.save 
c = City.new(:name => 'Cana Brava', :zip_code => '77.333-000', :state => state); c.save 
c = City.new(:name => 'Cariri Do Tocantins', :zip_code => '77.453-000', :state => state); c.save 
c = City.new(:name => 'Cartucho', :zip_code => '77.772-000', :state => state); c.save 
c = City.new(:name => 'Chapada Da Natividade', :zip_code => '77.378-000', :state => state); c.save 
c = City.new(:name => 'Colinas Do Tocantins', :zip_code => '77.760-000', :state => state); c.save 
c = City.new(:name => 'Colmeia', :zip_code => '77.725-000', :state => state); c.save 
c = City.new(:name => 'Combinado', :zip_code => '77.350-000', :state => state); c.save 
c = City.new(:name => 'Conceicao Do Tocantins', :zip_code => '77.305-000', :state => state); c.save 
c = City.new(:name => 'Couto De Magalhaes', :zip_code => '77.750-000', :state => state); c.save 
c = City.new(:name => 'Craolandia', :zip_code => '77.774-000', :state => state); c.save 
c = City.new(:name => 'Cristalandia', :zip_code => '77.490-000', :state => state); c.save 
c = City.new(:name => 'Dianopolis', :zip_code => '77.300-000', :state => state); c.save 
c = City.new(:name => 'Divinopolis Do Tocantins', :zip_code => '77.670-000', :state => state); c.save 
c = City.new(:name => 'Dois Irmaos Do Tocantins', :zip_code => '77.685-000', :state => state); c.save 
c = City.new(:name => 'Duere', :zip_code => '77.485-000', :state => state); c.save 
c = City.new(:name => 'Fatima', :zip_code => '77.555-000', :state => state); c.save 
c = City.new(:name => 'Figueiropolis', :zip_code => '77.465-000', :state => state); c.save 
c = City.new(:name => 'Filadelfia', :zip_code => '77.795-000', :state => state); c.save 
c = City.new(:name => 'Formoso Do Araguaia', :zip_code => '77.470-000', :state => state); c.save 
c = City.new(:name => 'Goianorte', :zip_code => '77.695-000', :state => state); c.save 
c = City.new(:name => 'Goiatins', :zip_code => '77.770-000', :state => state); c.save 
c = City.new(:name => 'Guarai', :zip_code => '77.700-000', :state => state); c.save 
c = City.new(:name => 'Gurupi', :zip_code => '77.400-000', :state => state); c.save 
c = City.new(:name => 'Ipueiras', :zip_code => '77.553-000', :state => state); c.save 
c = City.new(:name => 'Itacaja', :zip_code => '77.720-000', :state => state); c.save 
c = City.new(:name => 'Itaguatins', :zip_code => '77.920-000', :state => state); c.save 
c = City.new(:name => 'Itapora Do Tocantins', :zip_code => '77.740-000', :state => state); c.save 
c = City.new(:name => 'Lizarda', :zip_code => '77.630-000', :state => state); c.save 
c = City.new(:name => 'Marianopolis Do Tocantins', :zip_code => '77.675-000', :state => state); c.save 
c = City.new(:name => 'Mateiros', :zip_code => '77.593-000', :state => state); c.save 
c = City.new(:name => 'Miracema Do Tocantins', :zip_code => '77.650-000', :state => state); c.save 
c = City.new(:name => 'Mirandopolis', :zip_code => '77.702-000', :state => state); c.save 
c = City.new(:name => 'Miranorte', :zip_code => '77.660-000', :state => state); c.save 
c = City.new(:name => 'Monte Do Carmo', :zip_code => '77.585-000', :state => state); c.save 
c = City.new(:name => 'Monte Lindo', :zip_code => '77.776-000', :state => state); c.save 
c = City.new(:name => 'Monte Santo Do Tocantins', :zip_code => '77.673-000', :state => state); c.save 
c = City.new(:name => 'Muricilandia', :zip_code => '77.850-000', :state => state); c.save 
c = City.new(:name => 'Natal', :zip_code => '77.953-000', :state => state); c.save 
c = City.new(:name => 'Natividade', :zip_code => '77.370-000', :state => state); c.save 
c = City.new(:name => 'Nazare', :zip_code => '77.895-000', :state => state); c.save 
c = City.new(:name => 'Nova Olinda', :zip_code => '77.790-000', :state => state); c.save 
c = City.new(:name => 'Novo Acordo', :zip_code => '77.610-000', :state => state); c.save 
c = City.new(:name => 'Novo Alegre', :zip_code => '77.353-000', :state => state); c.save 
c = City.new(:name => 'Palmeirante', :zip_code => '77.798-000', :state => state); c.save 
c = City.new(:name => 'Palmeiropolis', :zip_code => '77.365-000', :state => state); c.save 
c = City.new(:name => 'Paraiso Do Tocantins', :zip_code => '77.600-000', :state => state); c.save 
c = City.new(:name => 'Parana', :zip_code => '77.360-000', :state => state); c.save 
c = City.new(:name => 'Pedro Afonso', :zip_code => '77.710-000', :state => state); c.save 
c = City.new(:name => 'Peixe', :zip_code => '77.460-000', :state => state); c.save 
c = City.new(:name => 'Pequizeiro', :zip_code => '77.730-000', :state => state); c.save 
c = City.new(:name => 'Pindorama Do Tocantins', :zip_code => '77.380-000', :state => state); c.save 
c = City.new(:name => 'Piraque', :zip_code => '77.888-000', :state => state); c.save 
c = City.new(:name => 'Pium', :zip_code => '77.570-000', :state => state); c.save 
c = City.new(:name => 'Ponte Alta Do Bom Jesus', :zip_code => '77.315-000', :state => state); c.save 
c = City.new(:name => 'Ponte Alta Do Tocantins', :zip_code => '77.590-000', :state => state); c.save 
c = City.new(:name => 'Porto Nacional', :zip_code => '77.500-000', :state => state); c.save 
c = City.new(:name => 'Presidente Kennedy', :zip_code => '77.745-000', :state => state); c.save 
c = City.new(:name => 'Principe', :zip_code => '77.373-000', :state => state); c.save 
c = City.new(:name => 'Rio Da Conceicao', :zip_code => '77.303-000', :state => state); c.save 
c = City.new(:name => 'Rio Sono', :zip_code => '77.635-000', :state => state); c.save 
c = City.new(:name => 'Nova Rosalandia', :zip_code => '77.495-000', :state => state); c.save 
c = City.new(:name => 'Santa Rosa Do Tocantins', :zip_code => '77.375-000', :state => state); c.save 
c = City.new(:name => 'Santa Tereza Do Tocantins', :zip_code => '77.615-000', :state => state); c.save 
c = City.new(:name => 'Sao Bento Do Tocantins', :zip_code => '77.958-000', :state => state); c.save 
c = City.new(:name => 'Sao Sebastiao Do Tocantins', :zip_code => '77.990-000', :state => state); c.save 
c = City.new(:name => 'Silvanopolis', :zip_code => '77.580-000', :state => state); c.save 
c = City.new(:name => 'Sitio Novo Do Tocantins', :zip_code => '77.940-000', :state => state); c.save 
c = City.new(:name => 'Taguatinga', :zip_code => '77.320-000', :state => state); c.save 
c = City.new(:name => 'Taipas Do Tocantins', :zip_code => '77.308-000', :state => state); c.save 
c = City.new(:name => 'Tamboril', :zip_code => '77.898-000', :state => state); c.save 
c = City.new(:name => 'Tocantinia', :zip_code => '77.640-000', :state => state); c.save 
c = City.new(:name => 'Tocantinopolis', :zip_code => '77.900-000', :state => state); c.save 
c = City.new(:name => 'Tupirama', :zip_code => '77.704-000', :state => state); c.save 
c = City.new(:name => 'Tupirata', :zip_code => '77.748-000', :state => state); c.save 
c = City.new(:name => 'Wanderlandia', :zip_code => '77.860-000', :state => state); c.save 
c = City.new(:name => 'Xambioa', :zip_code => '77.880-000', :state => state); c.save 
c = City.new(:name => 'Praia Norte', :zip_code => '77.970-000', :state => state); c.save 
c = City.new(:name => 'Sao Valerio Da Natividade', :zip_code => '77.390-000', :state => state); c.save 
c = City.new(:name => 'Porto Alegre Do Tocantins', :zip_code => '77.395-000', :state => state); c.save 
c = City.new(:name => 'Aparecida Do Rio Negro', :zip_code => '77.620-000', :state => state); c.save 
c = City.new(:name => 'Buriti Do Tocantins', :zip_code => '77.995-000', :state => state); c.save 
c = City.new(:name => 'Sampaio', :zip_code => '77.980-000', :state => state); c.save 
c = City.new(:name => 'Aragacui', :zip_code => '77.683-000', :state => state); c.save 
c = City.new(:name => 'Palmas', :zip_code => '77.000-000', :state => state); c.save 
c = City.new(:name => 'Taquaralto', :zip_code => '77.270-000', :state => state); c.save 
c = City.new(:name => 'Taquarussu Do Tocantins', :zip_code => '77.260-000', :state => state); c.save 
c = City.new(:name => 'Novo Jardim', :zip_code => '77.318-000', :state => state); c.save 
c = City.new(:name => 'Sao Salvador Do Tocantins', :zip_code => '77.368-000', :state => state); c.save 
c = City.new(:name => 'Sucupira', :zip_code => '77.458-000', :state => state); c.save 
c = City.new(:name => 'Jau Do Tocantins', :zip_code => '77.450-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Da Confusao', :zip_code => '77.493-000', :state => state); c.save 
c = City.new(:name => 'Sao Felix Do Tocantins', :zip_code => '77.605-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Do Tocantins', :zip_code => '77.613-000', :state => state); c.save 
c = City.new(:name => 'Fortaleza Do Tabocao', :zip_code => '77.708-000', :state => state); c.save 
c = City.new(:name => 'Itapiratins', :zip_code => '77.718-000', :state => state); c.save 
c = City.new(:name => 'Lajeado', :zip_code => '77.645-000', :state => state); c.save 
c = City.new(:name => 'Rio Dos Bois', :zip_code => '77.655-000', :state => state); c.save 
c = City.new(:name => 'Juarina', :zip_code => '77.753-000', :state => state); c.save 
c = City.new(:name => 'Tupiratins', :zip_code => '77.743-000', :state => state); c.save 
c = City.new(:name => 'Riachinho', :zip_code => '77.893-000', :state => state); c.save 
c = City.new(:name => 'Sao Miguel Do Tocantins', :zip_code => '77.925-000', :state => state); c.save 
c = City.new(:name => 'Carrasco Bonito', :zip_code => '77.985-000', :state => state); c.save 
c = City.new(:name => 'Angico', :zip_code => '77.905-000', :state => state); c.save 
c = City.new(:name => 'Aragominas', :zip_code => '77.845-000', :state => state); c.save 
c = City.new(:name => 'Brasilandia Do Tocantins', :zip_code => '77.735-000', :state => state); c.save 
c = City.new(:name => 'Campos Lindos', :zip_code => '77.777-000', :state => state); c.save 
c = City.new(:name => 'Carmolandia', :zip_code => '77.840-000', :state => state); c.save 
c = City.new(:name => 'Centenario', :zip_code => '77.723-000', :state => state); c.save 
c = City.new(:name => 'Darcinopolis', :zip_code => '77.910-000', :state => state); c.save 
c = City.new(:name => 'Esperantina', :zip_code => '77.993-000', :state => state); c.save 
c = City.new(:name => 'Maurilandia Do Tocantins', :zip_code => '77.918-000', :state => state); c.save 
c = City.new(:name => 'Mosquito', :zip_code => '77.913-000', :state => state); c.save 
c = City.new(:name => 'Pau Darco', :zip_code => '77.785-000', :state => state); c.save 
c = City.new(:name => 'Recursolandia', :zip_code => '77.733-000', :state => state); c.save 
c = City.new(:name => 'Sandolandia', :zip_code => '77.478-000', :state => state); c.save 
c = City.new(:name => 'Santa Fe Do Araguaia', :zip_code => '77.848-000', :state => state); c.save 
c = City.new(:name => 'Santa Maria Do Tocantins', :zip_code => '77.716-000', :state => state); c.save 
c = City.new(:name => 'Crixas', :zip_code => '77.449-000', :state => state); c.save 
c = City.new(:name => 'Peixe', :zip_code => '77.835-200', :state => state); c.save 
c = City.new(:name => 'Pedro Ludovico', :zip_code => '77.835-400', :state => state); c.save 
c = City.new(:name => 'Barra Do Grota', :zip_code => '77.835-600', :state => state); c.save 
c = City.new(:name => 'Cocalandia', :zip_code => '77.836-000', :state => state); c.save 
c = City.new(:name => 'Correinha', :zip_code => '77.836-200', :state => state); c.save 
c = City.new(:name => 'Piloes', :zip_code => '77.836-400', :state => state); c.save 
c = City.new(:name => 'Escondido', :zip_code => '77.836-600', :state => state); c.save 
c = City.new(:name => 'Ilha Barreira Branca', :zip_code => '77.837-000', :state => state); c.save 
c = City.new(:name => 'Poraozinho', :zip_code => '77.837-200', :state => state); c.save 
c = City.new(:name => 'Brasilandia', :zip_code => '77.837-400', :state => state); c.save 
c = City.new(:name => 'Porto Lemos', :zip_code => '77.837-600', :state => state); c.save 
c = City.new(:name => 'Jussara', :zip_code => '77.837-000', :state => state); c.save 
c = City.new(:name => 'Pontes', :zip_code => '77.838-200', :state => state); c.save 
c = City.new(:name => 'Venus', :zip_code => '77.838-600', :state => state); c.save 
c = City.new(:name => 'Cocalinho', :zip_code => '77.839-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte', :zip_code => '77.839-200', :state => state); c.save 
c = City.new(:name => 'Pe Da Serra', :zip_code => '77.839-400', :state => state); c.save 
c = City.new(:name => 'Lavandeira', :zip_code => '77.328-000', :state => state); c.save 
c = City.new(:name => 'Crixas Do Tocantins', :zip_code => '77.463-000', :state => state); c.save 
c = City.new(:name => 'Talisma', :zip_code => '77.483-000', :state => state); c.save 
c = City.new(:name => 'Oliveira De Fatima', :zip_code => '77.558-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Tocantins', :zip_code => '77.565-000', :state => state); c.save 
c = City.new(:name => 'Chapada Da Areia', :zip_code => '77.575-000', :state => state); c.save 
c = City.new(:name => 'Pugmil', :zip_code => '77.603-000', :state => state); c.save 
c = City.new(:name => 'Bandeirantes Do Tocantins', :zip_code => '77.783-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha Do Tocantins', :zip_code => '77.885-000', :state => state); c.save 
c = City.new(:name => 'Luzinopolis', :zip_code => '77.903-000', :state => state); c.save 
c = City.new(:name => 'Aguiarnopolis', :zip_code => '77.908-000', :state => state); c.save 
c = City.new(:name => 'Barra Do Ouro', :zip_code => '77.765-000', :state => state); c.save 

