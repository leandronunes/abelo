require File.dirname(__FILE__) + '/../test_helper'

class DictionaryTest < Test::Unit::TestCase

  def test_parser
    assert_not_equal 'I', Dictionary.parser('I'), "The description of the income payment was not described"
    assert_not_equal 'E', Dictionary.parser('E'), "The description of the outcome payment was not described"
  end
end
