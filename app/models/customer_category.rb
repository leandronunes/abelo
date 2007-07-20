# == Schema Information
# Schema version: 35
#
# Table name: categories
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  type            :string(255)   not null
#  parent_id       :integer       
#  organization_id :integer       not null
#

class CustomerCategory < Category

 has_many :customers, :foreign_key => 'category_id'

end
