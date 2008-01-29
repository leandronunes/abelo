class Address < ActiveRecord::Base

  # relationships
  ###############

  belongs_to :owner, :polymorphic => true


end
