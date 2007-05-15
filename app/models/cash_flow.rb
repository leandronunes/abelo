class CashFlow < ActiveRecord::Base
  has_one :transaction
end
