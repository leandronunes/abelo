module PaymentStrategy

  class Factory
    require 'payment_strategy/base'
    require 'payment_strategy/money'
    require 'payment_strategy/add_cash'
    require 'payment_strategy/remove_cash'
    require 'payment_strategy/check'
    require 'payment_strategy/credit_card'
    require 'payment_strategy/debit_card'
    def self.new(method)
      (Payment::PAYMENT_METHODS[method] || Money).new
    end
  end



end

