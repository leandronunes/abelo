class TypeTransaction

  CREDIT = 'C'
  DEBIT = 'D'

  def self.find_all
    a = Array.new
    ts = TransactionSupport.new
    ts.id = 'C'
    ts.name = 'credit'
    a.push(ts)

    ts = TransactionSupport.new
    ts.id = 'D'
    ts.name = 'debit'
    a.push(ts)
    return a
  end

end 

class TransactionSupport
  attr_accessor :id, :name
end
