require File.dirname(__FILE__) + '/../test_helper'

class WorkerTest < Test::Unit::TestCase
  fixtures :workers
  
  # Replace this with your real tests.
  def test_mandatory_fields
   
    count = Worker.count

    w = Worker.new
    assert !w.save

    w.name = 'A test worker'
    assert !w.save

    w.cpf = '65255789143'
    assert !w.save

    w.rg = '0266451411'
    assert !w.save

    w.address = 'A test address'
    assert !w.save

    w.birthday = '2007-01-01'
    assert !w.save

    w.description = 'A test description'
    assert !w.save

    w.function = 'Officeboy'
    assert !w.save

    w.organization_id = 1
    assert w.save

    assert_equal count + 1, Worker.count
  end

  def test_cpf_format
    count = Worker.count
    w = Worker.new(:name => 'A worker for testing CPF format', :organization_id => 1)
    w.cpf = '00000000000'
    assert !w.save
   
    w.cpf = '67223288485'
    assert w.save
    
    assert_equal count + 1, Worker.count
  end

  def test_cpf_uniq
    count = Worker.count
    w1 = Worker.new(:name => 'Testing unique CPF (first)', :organization_id => 1)
    w1.cpf = '18385961437'
    assert w1.save
    assert_equal count + 1, Worker.count

    # the same organization cannot have the same worker registered twice
    count = Worker.count
    w2 = Worker.new(:name => 'Testing unique CPF (second)', :organization_id => 1)
    w2.cpf = '18385961437'
    assert !w2.save
    assert_equal count, Worker.count

    # another organization can have the same supplier registered
    count = Worker.count
    w3 = Worker.new(:name => 'Testing unique CPF (another organization)', :organization_id => 2)
    w3.cpf = '18385961437'
    assert w3.save
    assert_equal count + 1, Worker.count
  end

end
