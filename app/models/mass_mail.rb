# == Schema Information
# Schema version: 35
#
# Table name: mass_mails
#
#  id              :integer       not null, primary key
#  subject         :string(255)   not null
#  body            :text          not null
#  organization_id :integer       not null
#

class MassMail < ActiveRecord::Base

  belongs_to :organization

  validates_presence_of :subject, :body, :organization_id

end
