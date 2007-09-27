class Periodicity < ActiveRecord::Base
  belongs_to :organization

  validates_presence_of :organization_id
  validates_presence_of :number_of_days
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id

  acts_as_ferret

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

end
