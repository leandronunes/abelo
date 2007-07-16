# == Schema Information
# Schema version: 35
#
# Table name: commercial_proposal_items
#
#  id                             :integer       not null, primary key
#  commercial_proposal_section_id :integer       not null
#  quantity                       :integer       not null
#  number                         :integer       
#  unitary_value                  :float         not null
#  product_id                     :integer       
#  service_id                     :integer       
#

class CommercialProposalItem < ActiveRecord::Base
  validates_presence_of :quantity
  validates_presence_of :unitary_value
  validates_presence_of :commercial_proposal_section_id
  belongs_to :product

  def total_value
    quantity * unitary_value
  end

  def description
    self.product.description if self.product 
  end

  def validate
    filled = [:product_id, :service_id].find_all { |i| self.send(i) != nil }
    if filled.length != 1
      self.errors.add(_('You must choose a type of item'))
    end
  end

end
