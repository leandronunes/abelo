class Configuration < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :organization

  serialize :full_product
  serialize :lite_product, Array
  #, Array TODO fix this problem
  #The serialize must be an array but if the value is nil
  #It craches 
end
