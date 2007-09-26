#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

country = Country.find_by_name('Brazil')
country ||= Country.create(:name => 'Brazil')

state = country.states.find_by_name('Mato Grosso do Sul')
state ||= State.create!( :name => 'Mato Grosso do Sul', :code => 'MS', :country => country);

c = City.new(:name => 'Agua Boa', :zip_code => '79.452-000', :state => state); c.save 
c = City.new(:name => 'Agua Clara', :zip_code => '79.680-000', :state => state); c.save 
c = City.new(:name => 'Albuquerque', :zip_code => '79.362-000', :state => state); c.save 
c = City.new(:name => 'Alcinopolis', :zip_code => '79.530-000', :state => state); c.save 
c = City.new(:name => 'Alto Sucuriu', :zip_code => '79.682-000', :state => state); c.save 
c = City.new(:name => 'Amambai', :zip_code => '79.990-000', :state => state); c.save 
c = City.new(:name => 'Amandina', :zip_code => '79.742-000', :state => state); c.save 
c = City.new(:name => 'Amolar', :zip_code => '79.357-000', :state => state); c.save 
c = City.new(:name => 'Anastacio', :zip_code => '79.210-000', :state => state); c.save 
c = City.new(:name => 'Anaurilandia', :zip_code => '79.770-000', :state => state); c.save 
c = City.new(:name => 'Angelica', :zip_code => '79.785-000', :state => state); c.save 
c = City.new(:name => 'Anhandui', :zip_code => '79.125-000', :state => state); c.save 
c = City.new(:name => 'Antonio Joao', :zip_code => '79.910-000', :state => state); c.save 
c = City.new(:name => 'Aparecida Do Taboado', :zip_code => '79.570-000', :state => state); c.save 
c = City.new(:name => 'Aquidauana', :zip_code => '79.200-000', :state => state); c.save 
c = City.new(:name => 'Aral Moreira', :zip_code => '79.930-000', :state => state); c.save 
c = City.new(:name => 'Arapua', :zip_code => '79.654-000', :state => state); c.save 
c = City.new(:name => 'Areado', :zip_code => '79.492-000', :state => state); c.save 
c = City.new(:name => 'Arvore Grande', :zip_code => '79.502-000', :state => state); c.save 
c = City.new(:name => 'Baianopolis', :zip_code => '79.462-000', :state => state); c.save 
c = City.new(:name => 'Balsamo', :zip_code => '79.182-000', :state => state); c.save 
c = City.new(:name => 'Bandeirantes', :zip_code => '79.430-000', :state => state); c.save 
c = City.new(:name => 'Bataguassu', :zip_code => '79.780-000', :state => state); c.save 
c = City.new(:name => 'Bataipora', :zip_code => '79.760-000', :state => state); c.save 
c = City.new(:name => 'Baus', :zip_code => '79.554-000', :state => state); c.save 
c = City.new(:name => 'Bela Vista', :zip_code => '79.260-000', :state => state); c.save 
c = City.new(:name => 'Bocaja', :zip_code => '79.886-000', :state => state); c.save 
c = City.new(:name => 'Bocaja', :zip_code => '79.923-000', :state => state); c.save 
c = City.new(:name => 'Bodoquena', :zip_code => '79.390-000', :state => state); c.save 
c = City.new(:name => 'Bom Fim', :zip_code => '79.442-000', :state => state); c.save 
c = City.new(:name => 'Bonito', :zip_code => '79.290-000', :state => state); c.save 
c = City.new(:name => 'Boqueirao', :zip_code => '79.242-000', :state => state); c.save 
c = City.new(:name => 'Brasilandia', :zip_code => '79.670-000', :state => state); c.save 
c = City.new(:name => 'Caarapo', :zip_code => '79.940-000', :state => state); c.save 
c = City.new(:name => 'Cabeceira Do Apa', :zip_code => '79.908-000', :state => state); c.save 
c = City.new(:name => 'Cachoeira', :zip_code => '79.504-000', :state => state); c.save 
c = City.new(:name => 'Camapua', :zip_code => '79.420-000', :state => state); c.save 
c = City.new(:name => 'Camisao', :zip_code => '79.202-000', :state => state); c.save 
c = City.new(:name => 'Campestre', :zip_code => '79.912-000', :state => state); c.save 
c = City.new(:name => 'Campo Grande', :zip_code => '79.000-000', :state => state); c.save 
c = City.new(:name => 'Capao Seco', :zip_code => '79.174-000', :state => state); c.save 
c = City.new(:name => 'Caracol', :zip_code => '79.270-000', :state => state); c.save 
c = City.new(:name => 'Carumbe', :zip_code => '79.892-000', :state => state); c.save 
c = City.new(:name => 'Cassilandia', :zip_code => '79.540-000', :state => state); c.save 
c = City.new(:name => 'Cipolandia', :zip_code => '79.208-000', :state => state); c.save 
c = City.new(:name => 'Coimbra', :zip_code => '79.368-000', :state => state); c.save 
c = City.new(:name => 'Congonha', :zip_code => '79.432-000', :state => state); c.save 
c = City.new(:name => 'Corguinho', :zip_code => '79.460-000', :state => state); c.save 
c = City.new(:name => 'Coronel Sapucaia', :zip_code => '79.995-000', :state => state); c.save 
c = City.new(:name => 'Corumba', :zip_code => '79.300-000', :state => state); c.save 
c = City.new(:name => 'Costa Rica', :zip_code => '79.550-000', :state => state); c.save 
c = City.new(:name => 'Coxim', :zip_code => '79.400-000', :state => state); c.save 
c = City.new(:name => 'Cristalina', :zip_code => '79.944-000', :state => state); c.save 
c = City.new(:name => 'Cruzaltina', :zip_code => '79.883-000', :state => state); c.save 
c = City.new(:name => 'Culturama', :zip_code => '79.702-000', :state => state); c.save 
c = City.new(:name => 'Cupins', :zip_code => '79.573-000', :state => state); c.save 
c = City.new(:name => 'Deodapolis', :zip_code => '79.790-000', :state => state); c.save 
c = City.new(:name => 'Dois Irmaos Do Buriti', :zip_code => '79.215-000', :state => state); c.save 
c = City.new(:name => 'Douradina', :zip_code => '79.880-000', :state => state); c.save 
c = City.new(:name => 'Dourados', :zip_code => '79.800-000', :state => state); c.save 
c = City.new(:name => 'Eldorado', :zip_code => '79.970-000', :state => state); c.save 
c = City.new(:name => 'Fatima Do Sul', :zip_code => '79.700-000', :state => state); c.save 
c = City.new(:name => 'Figueirao', :zip_code => '79.422-000', :state => state); c.save 
c = City.new(:name => 'Garcias', :zip_code => '79.656-000', :state => state); c.save 
c = City.new(:name => 'Gloria De Dourados', :zip_code => '79.730-000', :state => state); c.save 
c = City.new(:name => 'Guacu', :zip_code => '79.874-000', :state => state); c.save 
c = City.new(:name => 'Guaculandia', :zip_code => '79.734-000', :state => state); c.save 
c = City.new(:name => 'Guadalupe Do Alto Parana', :zip_code => '79.658-000', :state => state); c.save 
c = City.new(:name => 'Guia Lopes Da Laguna', :zip_code => '79.230-000', :state => state); c.save 
c = City.new(:name => 'Iguatemi', :zip_code => '79.960-000', :state => state); c.save 
c = City.new(:name => 'Ilha Comprida', :zip_code => '79.652-000', :state => state); c.save 
c = City.new(:name => 'Indaia Do Sul', :zip_code => '79.542-000', :state => state); c.save 
c = City.new(:name => 'Inocencia', :zip_code => '79.580-000', :state => state); c.save 
c = City.new(:name => 'Ipezal', :zip_code => '79.787-000', :state => state); c.save 
c = City.new(:name => 'Itapora', :zip_code => '79.890-000', :state => state); c.save 
c = City.new(:name => 'Itaquirai', :zip_code => '79.965-000', :state => state); c.save 
c = City.new(:name => 'Itahum', :zip_code => '79.864-000', :state => state); c.save 
c = City.new(:name => 'Ivinhema', :zip_code => '79.740-000', :state => state); c.save 
c = City.new(:name => 'Jabuti', :zip_code => '79.292-000', :state => state); c.save 
c = City.new(:name => 'Jacarei', :zip_code => '79.988-000', :state => state); c.save 
c = City.new(:name => 'Japora', :zip_code => '79.985-000', :state => state); c.save 
c = City.new(:name => 'Jaraguari', :zip_code => '79.440-000', :state => state); c.save 
c = City.new(:name => 'Jardim', :zip_code => '79.240-000', :state => state); c.save 
c = City.new(:name => 'Jatei', :zip_code => '79.720-000', :state => state); c.save 
c = City.new(:name => 'Jauru', :zip_code => '79.406-000', :state => state); c.save 
c = City.new(:name => 'Juscelandia', :zip_code => '79.482-000', :state => state); c.save 
c = City.new(:name => 'Juti', :zip_code => '79.955-000', :state => state); c.save 
c = City.new(:name => 'Ladario', :zip_code => '79.370-000', :state => state); c.save 
c = City.new(:name => 'Lagoa Bonita', :zip_code => '79.792-000', :state => state); c.save 
c = City.new(:name => 'Laguna Carapa', :zip_code => '79.920-000', :state => state); c.save 
c = City.new(:name => 'Maracaju', :zip_code => '79.150-000', :state => state); c.save 
c = City.new(:name => 'Miranda', :zip_code => '79.380-000', :state => state); c.save 
c = City.new(:name => 'Montese', :zip_code => '79.896-000', :state => state); c.save 
c = City.new(:name => 'Morangas', :zip_code => '79.584-000', :state => state); c.save 
c = City.new(:name => 'Morraria Do Sul', :zip_code => '79.392-000', :state => state); c.save 
c = City.new(:name => 'Morumbi', :zip_code => '79.972-000', :state => state); c.save 
c = City.new(:name => 'Mundo Novo', :zip_code => '79.980-000', :state => state); c.save 
c = City.new(:name => 'Navirai', :zip_code => '79.950-000', :state => state); c.save 
c = City.new(:name => 'Nhecolandia', :zip_code => '79.364-000', :state => state); c.save 
c = City.new(:name => 'Nioaque', :zip_code => '79.220-000', :state => state); c.save 
c = City.new(:name => 'Nossa Senhora De Fatima', :zip_code => '79.262-000', :state => state); c.save 
c = City.new(:name => 'Nova Alvorada Do Sul', :zip_code => '79.140-000', :state => state); c.save 
c = City.new(:name => 'Nova America', :zip_code => '79.942-000', :state => state); c.save 
c = City.new(:name => 'Nova Andradina', :zip_code => '79.750-000', :state => state); c.save 
c = City.new(:name => 'Nova Esperanca', :zip_code => '79.722-000', :state => state); c.save 
c = City.new(:name => 'Nova Esperanca', :zip_code => '79.472-000', :state => state); c.save 
c = City.new(:name => 'Nova Jales', :zip_code => '79.508-000', :state => state); c.save 
c = City.new(:name => 'Oriente', :zip_code => '79.576-000', :state => state); c.save 
c = City.new(:name => 'Paiaguas', :zip_code => '79.359-000', :state => state); c.save 
c = City.new(:name => 'Palmeiras', :zip_code => '79.217-000', :state => state); c.save 
c = City.new(:name => 'Panambi', :zip_code => '79.876-000', :state => state); c.save 
c = City.new(:name => 'Paraiso', :zip_code => '79.552-000', :state => state); c.save 
c = City.new(:name => 'Paranaiba', :zip_code => '79.500-000', :state => state); c.save 
c = City.new(:name => 'Paranhos', :zip_code => '79.925-000', :state => state); c.save 
c = City.new(:name => 'Pedro Gomes', :zip_code => '79.410-000', :state => state); c.save 
c = City.new(:name => 'Picadinha', :zip_code => '79.866-000', :state => state); c.save 
c = City.new(:name => 'Pirapora', :zip_code => '79.894-000', :state => state); c.save 
c = City.new(:name => 'Piraputanga', :zip_code => '79.204-000', :state => state); c.save 
c = City.new(:name => 'Ponta Pora', :zip_code => '79.900-000', :state => state); c.save 
c = City.new(:name => 'Ponte Vermelha', :zip_code => '79.494-000', :state => state); c.save 
c = City.new(:name => 'Pontinha Do Cocho', :zip_code => '79.424-000', :state => state); c.save 
c = City.new(:name => 'Porto Esperanca', :zip_code => '79.366-000', :state => state); c.save 
c = City.new(:name => 'Porto Murtinho', :zip_code => '79.280-000', :state => state); c.save 
c = City.new(:name => 'Porto Vilma', :zip_code => '79.794-000', :state => state); c.save 
c = City.new(:name => 'Porto Xv De Novembro', :zip_code => '79.782-000', :state => state); c.save 
c = City.new(:name => 'Prudencio Thomaz', :zip_code => '79.134-000', :state => state); c.save 
c = City.new(:name => 'Quebra Coco', :zip_code => '79.173-000', :state => state); c.save 
c = City.new(:name => 'Ribas Do Rio Pardo', :zip_code => '79.180-000', :state => state); c.save 
c = City.new(:name => 'Rio Brilhante', :zip_code => '79.130-000', :state => state); c.save 
c = City.new(:name => 'Rio Negro', :zip_code => '79.470-000', :state => state); c.save 
c = City.new(:name => 'Rio Verde De Mato Grosso', :zip_code => '79.480-000', :state => state); c.save 
c = City.new(:name => 'Rochedinho', :zip_code => '79.127-000', :state => state); c.save 
c = City.new(:name => 'Rochedo', :zip_code => '79.450-000', :state => state); c.save 
c = City.new(:name => 'Sanga Puita', :zip_code => '79.902-000', :state => state); c.save 
c = City.new(:name => 'Santa Terezinha', :zip_code => '79.898-000', :state => state); c.save 
c = City.new(:name => 'Sao Gabriel Do Oeste', :zip_code => '79.490-000', :state => state); c.save 
c = City.new(:name => 'Sao Joao Do Apore', :zip_code => '79.512-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose', :zip_code => '79.712-000', :state => state); c.save 
c = City.new(:name => 'Sao Jose Do Sucuriu', :zip_code => '79.586-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '79.862-000', :state => state); c.save 
c = City.new(:name => 'Sao Pedro', :zip_code => '79.582-000', :state => state); c.save 
c = City.new(:name => 'Chapadao Do Sul', :zip_code => '79.560-000', :state => state); c.save 
c = City.new(:name => 'Sao Romao', :zip_code => '79.402-000', :state => state); c.save 
c = City.new(:name => 'Selviria', :zip_code => '79.590-000', :state => state); c.save 
c = City.new(:name => 'Sete Quedas', :zip_code => '79.935-000', :state => state); c.save 
c = City.new(:name => 'Sidrolandia', :zip_code => '79.170-000', :state => state); c.save 
c = City.new(:name => 'Sonora', :zip_code => '79.415-000', :state => state); c.save 
c = City.new(:name => 'Tacuru', :zip_code => '79.975-000', :state => state); c.save 
c = City.new(:name => 'Tamandare', :zip_code => '79.514-000', :state => state); c.save 
c = City.new(:name => 'Taquari', :zip_code => '79.405-000', :state => state); c.save 
c = City.new(:name => 'Taquarussu', :zip_code => '79.765-000', :state => state); c.save 
c = City.new(:name => 'Taunay', :zip_code => '79.206-000', :state => state); c.save 
c = City.new(:name => 'Terenos', :zip_code => '79.190-000', :state => state); c.save 
c = City.new(:name => 'Tres Lagoas', :zip_code => '79.600-000', :state => state); c.save 
c = City.new(:name => 'Velhacaria', :zip_code => '79.516-000', :state => state); c.save 
c = City.new(:name => 'Vicentina', :zip_code => '79.710-000', :state => state); c.save 
c = City.new(:name => 'Vila Formosa', :zip_code => '79.872-000', :state => state); c.save 
c = City.new(:name => 'Vila Uniao', :zip_code => '79.796-000', :state => state); c.save 
c = City.new(:name => 'Vila Vargas', :zip_code => '79.878-000', :state => state); c.save 
c = City.new(:name => 'Vista Alegre', :zip_code => '79.152-000', :state => state); c.save 
c = City.new(:name => 'Santa Rita Do Pardo', :zip_code => '79.690-000', :state => state); c.save 
c = City.new(:name => 'Indapolis', :zip_code => '79.868-000', :state => state); c.save 
c = City.new(:name => 'Indaia Grande', :zip_code => '79.506-000', :state => state); c.save 
c = City.new(:name => 'Vila Rica', :zip_code => '79.714-000', :state => state); c.save 
c = City.new(:name => 'Vila Marques', :zip_code => '79.932-000', :state => state); c.save 
c = City.new(:name => 'Quebracho', :zip_code => '79.774-000', :state => state); c.save 
c = City.new(:name => 'Presidente Castelo', :zip_code => '79.798-000', :state => state); c.save 
c = City.new(:name => 'Ilha Grande', :zip_code => '79.578-000', :state => state); c.save 
c = City.new(:name => 'Novo Horizonte Do Sul', :zip_code => '79.745-000', :state => state); c.save 
c = City.new(:name => 'Debrasa', :zip_code => '79.677-000', :state => state); c.save 

