require File.dirname(__FILE__) + '/../test_helper'

class WorkerCategoryTest < Test::Unit::TestCase

  fixtures :organizations

  def setup
    @organization = create_organization
    @worker_category = create_worker_category
  end

  def test_relation_with_workers
    worker = Worker.new(:name => 'Worker for testing', :organization => @organization, :email => 'testing@email', :cpf => '65870844274')
    @worker_category.workers.concat(worker)
    assert_equal 1, @worker_category.workers.count
  end

  def test_uniqueness_field_name
    worker_category_1 = WorkerCategory.create(:name => 'Category for testing', :organization => @organization)
    
    worker_category_2 = WorkerCategory.create(:name => 'Category for testing', :organization => @organization)

    assert worker_category_2.errors.invalid?(:name)
  end

end
