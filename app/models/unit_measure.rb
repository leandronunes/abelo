class UnitMeasure < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :name
  validates_presence_of :abbreviation
  validates_uniqueness_of :name, :scope => :organization_id
  validates_uniqueness_of :abbreviation, :scope => :organization_id
  validates_length_of :abbreviation, :maximum => 2

  acts_as_ferret :remote => true

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

end

