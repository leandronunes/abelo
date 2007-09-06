require File.dirname(__FILE__) + '/../test_helper'

class SystemActorDisplayTest < Test::Unit::TestCase

  def test_available_fields
    assert ['name', 'address', 'description', 'email', 'category_id', 'cnpj', 'cpf', 'rg', 'birthday'], SystemActorDisplay.available_fields
  end

  def test_title_name
    assert_kind_of String, SystemActorDisplay.title_name
  end

  def test_title_address
    assert_kind_of String, SystemActorDisplay.title_address
  end

  def test_title_email
    assert_kind_of String, SystemActorDisplay.title_email
  end

  def test_title_category_id
    assert_kind_of String, SystemActorDisplay.title_category_id
  end

  def test_title_cnpj
    assert_kind_of String, SystemActorDisplay.title_cnpj
  end

  def test_title_cpf
    assert_kind_of String, SystemActorDisplay.title_cpf
  end

  def test_title_rg
    assert_kind_of String, SystemActorDisplay.title_rg
  end

  def test_title_birthday
    assert_kind_of String, SystemActorDisplay.title_birthday
  end

  def test_title_description
    assert_kind_of String, SystemActorDisplay.title_description
  end

end
