require File.dirname(__FILE__) + '/../test_helper'

class EnvironmentTest < Test::Unit::TestCase

  def setup
    Organization.destroy_all
    @organization = create_organization
    @environment = Environment.find(:first)
  end

  should 'have articles' do
    env = create_environment
    assert_kind_of Array, env.articles
    assert_raise ActiveRecord::AssociationTypeMismatch do
      env.articles << 1
    end
    assert_nothing_raised do
      env.articles << Article.new
    end
  end

  should 'destroy articles when destroy environment' do
    env = create_environment
    a = create_article(:environment => env)
    count = Article.count
    assert env.destroy

    assert_equal count - 1, Article.count
  end

  should 'have article as homepage' do
    env = create_environment
    assert_raise ActiveRecord::AssociationTypeMismatch do
      env.home_page = 1
    end
    assert_nothing_raised do
      env.home_page = Article.new
    end
  end

  should 'have a path for design' do
    env = Environment.new
    assert_equal(File.join('designs','web_site'), env.design_root)

    env.is_default = true
    assert_equal(File.join('designs','organization'), env.design_root)
  end

  should 'have a top level article variable' do
    env = Environment.new
    assert_not_nil env.top_level_articles
    assert_kind_of Array, env.top_level_articles

    a1 = create_article(:name => 'article 1', :environment => @environment)
    a2 = create_article(:name => 'article 2', :environment => @environment)
    create_article(:name => 'article 3', :parent => a1, :environment => @environment)
    assert (env.top_level_articles - [a1,a2]).empty?
  end

  should 'have domains' do
    env = create_environment
    assert_kind_of Array, env.domains
    assert_raise ActiveRecord::AssociationTypeMismatch do
      env.domains << 1
    end
    assert_nothing_raised do
      env.domains << Domain.new
    end
  end

  should 'have owner' do
    env = create_environment
    assert_nothing_raised do
      env.owner = Organization.new
    end
  end

  should 'settings be a hash' do
    env = create_environment
    assert_kind_of Hash, env.settings
  end

  should 'return the default environment' do
    Environment.destroy_all
    env = create_environment(:is_default => true)
    assert_equal env.id, Environment.default.id
  end

  should 'return the boolean value for is_default varible' do
    env = create_environment
    assert_equal false, env.is_default?
    env.is_default = true
    assert_equal true, env.is_default?
  end

  should 'provide url to itself' do
    env = create_environment(:name => "Test Profile")
    create_domain(:owner => env, :name => 'mycolivre.net')

    assert_equal({ :host => 'mycolivre.net', :controller => 'content_viewer', :action => 'view_page', :page => []}, env.url)
  end

  should 'generate URL' do
    env = create_environment(:name => "Test Profile")
    create_domain(:owner => env, :name => 'mycolivre.net')

    assert_equal({ :host => 'mycolivre.net', :controller => 'content_viewer', :action => 'view_page' }, env.generate_url(:controller => 'content_viewer', :action => 'view_page'))
  end

  should 'help developers by adding a suitable port to url options' do
    env = create_environment(:name => "Test Environment")
    create_domain(:owner => env, :name => 'mycolivre.net')

    ENV.expects(:[]).with('RAILS_ENV').returns('development')
    env.expects(:development_url_options).returns({ :port => 9999 })
    assert_block('Profile#url_options must include port option when running in development mode') { env.url_options[:port] == 9999 }
  end

  should 'return the identifier' do
    env = Environment.new
    org = mock
    org.expects(:identifier).returns('some_id')
    Environment.any_instance.expects(:owner).returns(org)
    assert_equal 'some_id', env.identifier
  end


end
