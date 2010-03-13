require 'acts_as_filesystem'
require 'acts_as_searchable'
class Article < ActiveRecord::Base

  belongs_to :environment
  validates_presence_of :name, :slug, :path

  validates_uniqueness_of :slug, :scope => ['environment_id', 'parent_id'], :message => I18n.t(:uniqueness_of_slug_required)
  # TODO fix it
  #t(:%{fn}_(the_code_generated_from_the_article_name)_is_already_being_used_by_another_article.)
  validates_uniqueness_of :position, :scope => ['environment_id', 'parent_id'], :message => I18n.t(:uniqueness_of_position_required)
  # TODO fix it
  #t(:%{fn}_(the_position_generated_to_the_page)_is_already_being_used_by_another_page.)
  validates_numericality_of :position, :only_integer => true

  belongs_to :last_changed_by, :class_name => Person.name, :foreign_key => 'last_changed_by_id'

  acts_as_taggable  
  # TODO fix it
  #Nt(:tag_list)

  acts_as_filesystem
#FIXME make the version control
#  acts_as_versioned

  acts_as_searchable :fields => [:name, :abstract, :body, :tag_list ]

  before_validation do |article|
    article.position ||= ((Article.maximum(:position, :conditions => {:environment_id => article.environment, :parent_id => article.parent}) || 0) + 1 || 1)
  end

  # retrieves all articles belonging to the given +environment+ that are not
  # sub-articles of any other article.
  def self.top_level_for(environment)
    self.find(:all, :conditions => { :parent_id => nil, :environment_id => environment }, :order => :position)
  end

  # retrieves the latest +limit+ articles, sorted from the most recent to the
  # oldest.
  def self.recent(limit)
    options = { :limit => limit, :order => 'created_on desc, articles.id desc' }
    self.find(:all, options)
  end

  # produces the HTML code that is to be displayed as this article's contents.
  #
  # The implementation in this class just provides the +body+ attribute as the
  # HTML.  Other article types can override this method to provide customized
  # views of themselves.
  def to_html
    body
  end

  # returns the data of the article. Must be overriden in each subclass to
  # provide the correct content for the article. 
  def data
    body
  end

  # provides the icon name to be used for this article. In this class this
  # method just returns 'text-html', but subclasses may (and should) override
  # to return their specific icons.
  #
  # FIXME use mime_type and generate this name dinamically
  def icon_name
    'text-html'
  end

  def mime_type
    'text/html'
  end

  def mime_type_description
    I18n.t(:html_text_document)
  end

  def title
    name
  end

  def self.short_description
    if self == Article
      I18n.t(:page)
    else
      self.article_type_name + I18n.t(:page)
    end
  end

  def self.description
    if self == Article
      I18n.t(:an_ordinary_page)
    else
      I18n.t(:an_page_of_type) + self.article_type_name
    end
  end

  def self.article_type_name
    self.name.gsub(/article$/i, '')
  end

  def url
    self.environment.url.merge(:page => path.split('/'))
  end

  def allow_children?
    true
  end

end
