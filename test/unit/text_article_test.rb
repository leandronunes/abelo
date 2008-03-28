require File.dirname(__FILE__) + '/../test_helper'

class TextArticleTest < Test::Unit::TestCase

  def test_short_description
    assert_not_nil TextArticle.short_description
  end

  def test_description
    assert_not_nil TextArticle.description
  end

end
