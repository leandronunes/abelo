require File.dirname(__FILE__) + '/abstract_unit'
require '../lib/validates_as_cpf'

# Modelo
class CPFData < ActiveRecord::Base
  set_table_name "cpfs"
  
  validates_as_cpf :cpf
end

# Testes
class CPFsTest < Test::Unit::TestCase
  def test_deixa_passar_cpf_nulo_porque_devemos_barrar_com_validates_presence_of
    cpf_valido = CPFData.new(:id => 1, :cpf => nil)
    
    assert cpf_valido.save, "Nao salvou CPF nulo"
  end
  
  def test_deixa_passar_cpf_vazio_porque_devemos_barrar_com_validates_presence_of
    cpf_valido = CPFData.new(:id => 1, :cpf => "")
    
    assert cpf_valido.save, "Nao salvou CPF em branco"
  end
  
  def test_cpf_invalido_sem_pontuacao
    cpf_invalido = CPFData.new(:id => 1, :cpf => "00000000000")
    
    assert (not cpf_invalido.save), "CPF invalido foi salvo"
  end
  
  def test_cpf_valido_sem_pontuacao
    cpf_valido = CPFData.new(:id => 1, :cpf => "88318850068")
    
    assert cpf_valido.save, "CPF valido nao foi salvo"
  end
  
  def test_cpf_invalido_sem_pontuacao
    cpf_invalido = CPFData.new(:id => 1, :cpf => "10000007898")
    
    assert (not cpf_invalido.save), "CPF invalido foi salvo"
  end
  
  def test_cpf_invalido
    cpf_invalido = CPFData.create(:id => 1, :cpf => "542.123.456-98")

    assert ( not cpf_invalido.save ), "CPF invalido foi salvo."
  end

  def test_cpf_valido
    cpf_valido = CPFData.create(:id => 1, :cpf => "804.932.540-72")

    assert ( cpf_valido.save ), "CPF valido nao foi salvo."
  end
end
