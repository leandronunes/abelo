# A Environment is like a website to be hosted in the platform. It may
# contain multiple Profile's and can be identified by several different
# domains.
class Environment < ActiveRecord::Base

  # #################################################
  # Relationships and applied behaviour
  # #################################################
  
  has_many :articles, :dependent => :destroy
  #FIXME make this test
  belongs_to :home_page, :class_name => Article.name, :foreign_key => :home_page_id, :dependent => :destroy

# FIXME see a way to validate it
#  validates_presence_of :home_page_id
#  validates_associated :home_page, :class_name => Article.name, :foreign_key => :home_page_id

  acts_as_design :root => File.join('designs', 'organization')

  before_validation :insert_default_homepage

  def design_root
    if self.is_default?
      File.join('designs', 'organization')
    else
      File.join('designs', 'web_site')
    end
  end

  def top_level_articles(reload = false)
    if reload
      @top_level_articles = nil
    end
    @top_level_articles ||= Article.top_level_for(self)
  end

  # One Environment can be reached by many domains
  has_many :domains, :as => :owner
  belongs_to :owner, :polymorphic => true

  # #################################################
  # Attributes
  # #################################################

  # store the Environment settings as YAML-serialized Hash.
  serialize :settings

  # returns a Hash containing the Environment configuration
  def settings
    self[:settings] ||= {}
  end
  
  # #################################################
  # Validations
  # #################################################

  # <tt>name</tt> is mandatory
  validates_presence_of :name

  # the default Environment.
  def self.default
    self.find(:first, :conditions => [ 'is_default = ?', true ] )
  end

  def is_default?
    self.is_default == true
  end

  #######################################
  # Home page methods. It's used by cms 
  #######################################

  #FIXME make this test
  def url
    generate_url(url_options.merge(:controller => 'content_viewer', :action => 'view_page', :page => []))
  end

  #FIXME make this test
  def generate_url(options)
    url_options.merge(options)
  end

  #FIXME make this test
  def url_options
    options = { :host => self.default_hostname, :profile => self.owner.identifier}

    # help developers by generating a suitable URL for development environment 
    if (ENV['RAILS_ENV'] == 'development')
      options.merge!(development_url_options)
    end

    options
  end

  def default_hostname
    if self.domains(true).empty?
      'localhost'
    else
      self.domains.find(:first, :order => 'id').name
    end
  end

  # FIXME couldn't think of a way to test this.
  #
  # Works (tested by hand) on Rails 2.0.2, with mongrel. Should work with
  # webrick too.
  def development_url_options # :nodoc:
    if Object.const_defined?('OPTIONS')
      { :port => OPTIONS[:port ]}
    else
      {}
    end
  end

  #FIXME make this test
  def insert_default_homepage
    self.home_page = self.articles.build(:name => _("%s's home page") % self.name, :body => _("<p>This is a default homepage created for %s. It can be changed though the control panel.</p>") % self.name)
#    self.home_page = Article.new(:name => _("%s's home page") % self.name, :body => _("<p>This is a default homepage created for %s. It can be changed though the control panel.</p>") % self.name)
  end

end
