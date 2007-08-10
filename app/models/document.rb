class Document < ActiveRecord::Base

  validates_presence_of :organization_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id

  acts_as_ferret

  has_many :document_sections
  has_and_belongs_to_many :departments
  belongs_to :organization

  def validate
    self.errors.add('is_template', _('You have to choose an option to the template')) if self.is_template.nil?
    self.errors.add( _('You have to choose almost an department to the document')) if  (not self.organization.nil?) and (not self.organization.departments.empty?) and (self.departments.empty?)
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return [results.size, results]
  end

end
