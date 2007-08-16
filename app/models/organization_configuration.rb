class OrganizationConfiguration < ActiveRecord::Base
  serialize :full_product, Array
  serialize :lite_product, Array
  serialize :full_supplier, Array
  serialize :lite_supplier, Array
end
