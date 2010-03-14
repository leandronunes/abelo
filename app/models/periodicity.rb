class Periodicity < ActiveRecord::Base
  belongs_to :organization

  validates_presence_of :organization_id
  validates_presence_of :number_of_days
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id
  validates_numericality_of :number_of_days, :only_integer => true

#  acts_as_ferret :remote => true

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

end
