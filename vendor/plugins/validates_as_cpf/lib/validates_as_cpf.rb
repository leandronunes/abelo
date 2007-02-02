# validates_as_cpf.rb - implement the validation of cpf
#  
#  Copyright (c) 2006 O.S. Systems
#  
#  Authors: André Ribeiro Camargo <andre@boaideia.inf.br>,
#           Luis Gustavo S. Barreto <gustavo@ossystems.com.br>
# 
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   General Public License for more details.
module ValidaCPF
  def self.valida_cpf(cpf = nil)
    return nil if cpf.nil?
    
    nulos = %w{12345678909
               11111111111
               22222222222
               33333333333
               44444444444
               55555555555
               66666666666
               77777777777
               88888888888
               99999999999
               00000000000}

    valor = cpf.scan(/[0-9]/).collect{|x| x.to_i}
    
    if valor.length == 11 and not nulos.member?(valor.to_s)
      # Calcula o primeiro digito verificador
      soma = 0
      0.upto(8) do |i|
        soma += valor[i] * (10 - i)
      end
        
      resto = soma % 11
      dv1 = resto < 2 ? 0 : 11 - resto

      if dv1 == valor[9]
        # Calcula o segundo digito verificador
        soma = 0
        0.upto(8) do |i|
          soma += valor[i] * (11 - i)
        end
        soma += dv1 * 2

        resto = soma % 11

        dv2 = resto < 2 ? 0 : 11 - resto

        return true if dv2 == valor[10]
      end
    end
    return nil
  end
end

module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_cpf(*attr_names)
        configuration = { :message => "is invalid" }
        configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)

        validates_each(attr_names, configuration) do |record, attr_name, value|
          next if value.blank?
          
          unless ValidaCPF::valida_cpf(value)
            record.errors.add(attr_name, configuration[:message])
          end
        end
      end
    end
  end
end
