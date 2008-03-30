require File.dirname(__FILE__) + '/../test_helper'

class ArticleTest < Test::Unit::TestCase

  def setup
    Organization.destroy_all
    @organization = create_organization
    @environment = Environment.find(:first)
  end

  def test_associated_to_environment
    a = Article.new
    a.environment =  @environment
    assert_not_nil a.environment
  end

  def test_presence_of_name
    Article.destroy_all
    a = Article.new
    a.valid?
    assert a.errors.invalid?(:name)

    a.name = 'some'
    a.valid?
    assert !a.errors.invalid?(:name)
  end

  def test_presence_of_slug
    Article.destroy_all
    a = Article.new
    a.valid?
    assert a.errors.invalid?(:slug)

    a.slug = 'some'
    a.valid?
    assert !a.errors.invalid?(:slug)
  end

  def test_presence_of_path
    Article.destroy_all
    a = Article.new
    a.valid?
    assert a.errors.invalid?(:path)

    a.path = 'some'
    a.valid?
    assert !a.errors.invalid?(:path)
  end

  def test_uniqueness_of_slug
    a1 = create_article(:slug => 'another_slug', :environment => @environment)
    a2 = Article.new
    a2.slug = 'another_slug'
    a2.environment = @environment
    a2.valid?
    assert a2.errors.invalid?(:slug), "You cannot have more than one same slug article with the same environment"

    a3 = Article.new
    a3.slug = 'another_slug'
    a3.parent = a1
    a3.valid?
    assert a2.errors.invalid?(:slug), "You cannot have more than one same slug article with the same parent"
  end

  should 'act as versioned' do
    a = create_article(:name => 'my article', :body => 'my text', :environment => @environment)
    assert_equal 1, a.versions(true).size
    a.name = 'some other name'
    a.save!
    assert_equal 2, a.versions(true).size
  end

  should 'act as taggable' do 
    a = create_article(:name => 'my article')
    a.tag_list = ['one', 'two']
    tags = a.tag_list.names
    assert tags.include?('one')
    assert tags.include?('two')
  end

  should 'act as filesystem' do
    a = create_article(:name => 'my article')
    b = a.children.build(:name => 'child article', :environment => @environment)
    b.save!
    assert_equal 'my-article/child-article', b.path

    a.name = 'another name'
    a.save!

    assert_equal 'another-name/child-article', Article.find(b.id).path
  end

  def test_top_level_for
    a1 = create_article(:name => 'article 1', :environment => @environment)  
    a2 = create_article(:name => 'article 2', :environment => @environment)  

    create_article(:name => 'article 3', :parent => a1, :environment => @environment)  
    create_article(:name => 'article 4', :parent => a2, :environment => @environment)  
    assert_equal 2, Article.top_level_for(@environment).length
  end

  def test_recent
    a1 = create_article(:name => 'article 1', :environment => @environment)  
    a2 = create_article(:name => 'article 2', :environment => @environment)  
    a3 = create_article(:name => 'article 3', :environment => @environment)  
    assert_equal a3, Article.recent(1)[0]
    assert_equal a2, Article.recent(2)[1]
    assert_equal a1, Article.recent(3)[2]
  end

  def test_title
    a = Article.new(:name => 'article 1')
    assert_equal 'article 1', a.title
  end

  should "have the position" do
    a = Article.new
    a.valid?
    assert_not_nil a.position
    assert_equal 1, a.position
  end

  should "increment the position" do
    a = create_article(:name => 'article 1')
    assert_equal 1, a.position
    a = create_article(:name => 'article 2')
    assert_equal 2, a.position
    a = create_article(:name => 'article 3')
    assert_equal 3, a.position

    env = create_environment
    env.articles.destroy_all
    a = create_article(:name => 'article 4', :environment => env)
    assert_equal 1, a.position, "this is a position of another environment"
  end

  should "have a unique position on environment and parent_id scope" do
    a = create_article(:name => 'article 1', :environment => @environment)
    a2 = Article.new(:environment => @environment )
    a2.position = a.position
    a2.valid?
    assert a2.errors.invalid?(:position)

    env = create_environment
    env.articles.destroy_all
    a3 = Article.new(:environment => env)
    a3.position = a.position
    assert !a3.errors.invalid?(:position)
  end



end
