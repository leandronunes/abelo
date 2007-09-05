class MassMail < ActiveRecord::Base

  belongs_to :organization
  has_many :attachments
  validates_presence_of :organization_id

  def self.configuration_class
    MassMailDisplay
  end

end
