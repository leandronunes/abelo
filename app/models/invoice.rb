class Invoice < ActiveRecord::Base

  validates_presence_of :number
  validates_presence_of :serie
  validates_presence_of :supplier_id
  validates_presence_of :issue_date
  validates_presence_of :status

  belongs_to :supplier
  belongs_to :organization
  has_many :stock_buys, :dependent => :destroy
  has_many :ledgers, :as => :owner, :dependent => :destroy

#  acts_as_ferret :remote => true, :fields => ['number', 'serie']

  before_save do |invoice|
    invoice.stock_buys.each do |s|
      s.status = invoice.status
      s.save!
    end

    invoice.ledgers.each do |l|
      l.status = invoice.status
      l.save
    end
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

  # Return the total cost of a invoice
  def total_cost
    self.stock_buys.collect(&:total_cost).sum
  end

  # Return the total amount of a invoice
  def total_amount
    self.stock_buys.sum(:amount) || 0
  end

  # Return all payments made to pay the invoice
  def total_payment
    self.ledgers.sum(:foreseen_value) || 0
  end
 
  # Return the balance of a invoice. The balance is the total cost
  # minus the all payments made.
  def balance
    self.total_cost + self.total_payment
  end 

  # Return the description of some fields of the object.
  # If is no't the status field nil is returned
  def describe_field(field, value)
    case field
      when 'status':
        description = {
          '0' => I18n.t(:pending),
          '1' => I18n.t(:done),
          '2' => I18n.t(:cancelled),
        }[value.to_s]
      else
        description = nil
    end
    description 
  end


end
