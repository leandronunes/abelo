require File.dirname(__FILE__) + '/../test_helper'

class WorkerTest < Test::Unit::TestCase

   def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_relation_with_catgory
    cat = WorkerCategory.create(:name => 'Supplier Category', :organization_id => @org.id)
    worker = Worker.new
    worker.category = cat
    assert_equal cat, worker.category
  end

end
