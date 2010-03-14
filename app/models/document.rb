class Document < ActiveRecord::Base

  attr_accessor :document_owner 

  validates_presence_of :organization_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id

  acts_as_taggable

#  acts_as_ferret :remote => true

  has_many :document_sections
  has_and_belongs_to_many :departments
  belongs_to :owner, :polymorphic => true
  belongs_to :organization
  belongs_to :document_model, :class_name => 'Document', :foreign_key => 'document_model_id'

  after_create do |document|
    document.organization.update_tracker('document_points', document.organization.documents.count)
  end

  after_destroy do |document|
    document.organization.update_tracker('document_points', document.organization.documents.count) unless document.organization.nil?
  end

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
    self.errors.add(:document_model_id, I18n.t(:you_cannot_have_a_document_model_in_a_model_document)) if self.is_model? and not self.document_model.nil?
    self.errors.add( I18n.t(:you_have_to_choose_almost_an_department_to_the_document)) if  (not self.organization.nil?) and (not self.organization.departments.empty?) and (self.departments.empty?)
    self.errors.add(I18n.t(:you_can_not_associate_a_person_organization_to_a_document_model)) if self.is_model? and not self.owner.nil?
    self.errors.add(:owner, I18n.t(:you_cannot_have_a_non_document_model_whitout_a_customer_supplier_or_worker_associated_to_him)) if !self.is_model? and (self.owner_type.nil? or self.owner_id.nil?)
  end

  def validate_on_destroy
    if self.is_model? and !self.organization.nil? and self.organization.documents_by_model(self).size > 0
      self.errors.add( I18n.t(:you_can_not_destroy_this_model_exist_at_least_a_document_that_references_it)) if self.is_model? and self.organization.documents_by_model(self).size > 0
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
    d.name = I18n.t(:change_me)
    d.is_model = false
    d.departments = self.departments
    d.document_model = self
    d.tag_list = self.tag_list.names
    d
  end

  private

  def self.describe(field)
    {
      'Customer' => I18n.t(:customer),
      'Supplier' => I18n.t(:supplier),
      'Worker' => I18n.t(:worker)
    }[field] || field
  end

end
