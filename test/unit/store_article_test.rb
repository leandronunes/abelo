require File.dirname(__FILE__) + '/../test_helper'

class StoreArticleTest < Test::Unit::TestCase

  def test_short_description
    assert_not_nil StoreArticle.short_description
  end

  def test_description
    assert_not_nil StoreArticle.description
  end

end
