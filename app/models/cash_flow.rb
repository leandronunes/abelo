class CashFlow < ActiveRecord::Base
  belongs_to :historical
  belongs_to :organization
end
