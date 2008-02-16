class MassMail < ActiveRecord::Base

  belongs_to :organization
  has_many :attachments
  validates_presence_of :organization_id
  
  acts_as_ferret :remote => true

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end


end
