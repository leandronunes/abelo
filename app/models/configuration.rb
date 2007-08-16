class Configuration < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :organization

  serialize :full_product
  #, Array TODO fix this problem
  #The serialize must be an array but if the value is nil
  #It craches 
  serialize :lite_product, Array
  serialize :full_supplier, Array
  serialize :lite_supplier, Array
end
