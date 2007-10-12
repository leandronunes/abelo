require File.dirname(__FILE__) + '/../test_helper'

class WorkerCategoryTest < Test::Unit::TestCase

  fixtures :organizations

  def setup
    @org = Organization.find_by_identifier('six') 
  end

  def test_relation_with_workers
    worker_cat = WorkerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    worker = Worker.new(:name => 'Worker for testing', :organization_id => @org.id, :email => 'testing@email', :cpf => '65870844274')
    worker_cat.workers.concat(worker)
    assert_equal 1, worker_cat.workers.count
  end

  def test_uniqueness_field_name
    worker_cat_1 = WorkerCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    
    worker_cat_2 = WorkerCategory.create(:name => 'Category for testing', :organization_id => @org.id)

    assert worker_cat_2.errors.invalid?(:name)
  end

end
