class MassMail < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :subject, :body, :organization_id

end
