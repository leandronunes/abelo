class Printer < ActiveRecord::Base

  acts_as_ferret :fields => [:serial, :computer_id]

  belongs_to :organization

  validates_presence_of :organization_id
  validates_presence_of :serial
  validates_presence_of :computer_id

  validates_uniqueness_of :computer_id

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

end
