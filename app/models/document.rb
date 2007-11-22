class Document < ActiveRecord::Base

  attr_accessor :document_owner 

  validates_presence_of :organization_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id

  acts_as_taggable

  acts_as_ferret

  has_many :document_sections
  has_and_belongs_to_many :departments
  belongs_to :owner, :polymorphic => true
  belongs_to :organization
  belongs_to :document_model, :class_name => 'Document', :foreign_key => 'document_model_id'

  #Allow gettext'
  def owner_class
    Document.describe(self.owner.class.to_s) unless owner.nil?
  end

  def document_owner_type
    self.owner.nil? ? self.document_owner : self.owner.class.name.downcase 
  end  

  def document_owner_type= value
    self.document_owner = self.owner.nil? ? value : self.owner.class.name.downcase 
  end  

  def validate
    self.errors.add(:document_model_id, _('You cannot have a document model in a model document')) if self.is_model? and not self.document_model.nil?
    self.errors.add( _('You have to choose almost an department to the document')) if  (not self.organization.nil?) and (not self.organization.departments.empty?) and (self.departments.empty?)
    self.errors.add( _("You can't associate a person/organization to a document model'")) if self.is_model? and not self.owner.nil?
    self.errors.add(:owner, _('You cannot have a non document model whitout a customer, supplier or worker associated to him')) if !self.is_model? and (self.owner_type.nil? or self.owner_id.nil?)
  end

  def validate_on_destroy
    if self.is_model? and !self.organization.nil? and self.organization.documents_by_model(self).size > 0
      self.errors.add( _("You can't destroy this model: Exist at least a document that references it.")) if self.is_model? and self.organization.documents_by_model(self).size > 0
    end
  end

  before_destroy :validate_on_destroy

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

  def self.models(options = {})
    local_options  = options.blank? ? :all : options
    self.find(local_options, :conditions => {:is_model => true})
  end

  def dclone
    return nil unless self.is_model
    d = self.clone 
    d.name = _("Change me")
    d.is_model = false
    d.departments = self.departments
    d.document_model = self
    d.tag_list = self.tag_list.names
    d
  end

  private

  def self.describe(field)
    {
      'Customer' => _('Customer'),
      'Supplier' => _('Supplier'),
      'Worker' => _('Worker')
    }[field] || field
  end

end
