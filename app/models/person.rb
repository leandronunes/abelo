# == Schema Information
# Schema version: 35
#
# Table name: people
#
#  id                        :integer       not null, primary key
#  type                      :string(255)   
#  login                     :string(255)   
#  administrator             :boolean       
#  email                     :string(255)   
#  crypted_password          :string(40)    
#  salt                      :string(40)    
#  created_at                :datetime      
#  updated_at                :datetime      
#  remember_token            :string(255)   
#  remember_token_expires_at :datetime      
#

class Person < ActiveRecord::Base
end
