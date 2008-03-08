#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../../config/environment'

LEDGER_MODELS = [
  DebitCardDisplay,
  CreditCardDisplay,
  MoneyDisplay,
  CheckDisplay,
]

LEDGER_MODELS.each{ |m| 
  m.find(:all).map do |l|
    if l.field == 'bank_account_id'
      l.update_attribute('field','bank_account')
    end
  end
}

Organization.find(:all).map do |o|
  a = Address.new
  a.country = BSC::Country.find_by_name('Brazil')
  a.state = BSC::State.find_by_name('Bahia')
  a.city = BSC::City.find_by_name('Salvador')
  a.owner = o
  a.save
end

Ledger.find(:all).map do |l|
  l.update_attribute('date', l.foreseen_date) if l.date.nil?

  if l.payment_method == 'Money'
    l.update_attribute('payment_method', Payment::MONEY)
  end
  if l.owner.kind_of?(Organization)
    l.update_attribute('organization', l.owner)
  elsif l.owner.kind_of?(Sale)
    l.update_attribute('organization', l.owner.organization)
  elsif l.owner.kind_of?(Till)
    l.update_attribute('organization', l.owner.organization)
  end
 
  l.update_attribute('value', l.value * -1) if l.expense?  
end

Ledger.find(:all) do |l|
  next unless l.find_balance_of_month.nil?
  b = l.create_balance_of_month
  b.refresh
end

ProductDisplay.find(:all).map do |d|
  d.destroy if d.field == 'description'
end

StockIn.find(:all).map do |s|
  s.update_attribute('type', 'StockBuy')
  next unless s.invoice.nil?
  i = Invoice.new(:issue_date => s.date, :supplier => s.supplier, :number => rand(1000000), :serie => rand(1000000))
  i.save!
  s.invoice = i
  s.save!
end

SaleItem.find(:all).map do |s|
  s.destroy unless s.valid?
end

Product.find(:all).map do |p|
  next if p.valid?
  p.update_attribute('code', p.suggest_code)
end

