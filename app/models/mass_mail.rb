class MassMail < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :subject
  validates_presence_of :body
  validates_associated :organization

  OPTIONS_FOR_RECIPIENTS = [
    t(:all),
    t(:groups)
  ]
  
  acts_as_ferret :remote => true

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

  def self.options_for_recipients
    MassMail::OPTIONS_FOR_RECIPIENTS
  end

  def recipients
  end
end
