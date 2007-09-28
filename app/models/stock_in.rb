class StockIn < Stock

  attr_accessor :update_ledger

  belongs_to :supplier
  validates_presence_of :supplier_id
  has_many :ledgers, :as => :owner
  validates_presence_of :validity
  validates_presence_of :price
  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |entry| !entry.amount.nil? } 

  def total_cost
    self.amount * self.price
  end

#  before_save do |s|
#    s.ledger ||= Ledger.new_ledger
#    ledger = s.ledger
#    ledger.date = s.date
#    ledger.value = s.price
#    ledger.bank_account = s.organization.default_bank_account unless s.organization.nil?
#    ledger.owner = s.organization
##    ledger.save
#    s.ledger = ledger
##    super
#  end

#  def save
#    self.ledger ||= Ledger.new_ledger
#    transaction do
#      if self.update_ledger.nil?
#        ledger = self.ledger
#        ledger.date = self.date
#        ledger.value = self.price
#        ledger.bank_account = self.organization.default_bank_account unless self.organization.nil?
#        ledger.owner = self.organization
#        ledger.save
#        self.ledger = ledger
#        super
#      else
#        ledger = self.update_ledger
##        ledger.attributes = self.ledger.attributes.merge(ledger.attributes)
#        ledger.date = self.date
#        ledger.value = self.price
#        bli = self.ledger
#if bli.class != Money
#raise "ouxe %s" % bli.class.to_s
#end
#        self.ledger =nil
#        if ledger.save!
#          self.ledger = ledger
#          bli.destroy!
#        else
#          self.ledger = ledger
#        end
#        super
#      end
#    end
#  end

  def organization
    self.product.nil? ? nil : self.product.organization
  end

end
