#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment'

BankAccount.find(:all).each do |b|
  b.ledgers.each do 
    l.organization = b.owner
    l.save
  end
end
