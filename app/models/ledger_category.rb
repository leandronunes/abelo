class LedgerCategory < ActiveRecord::Base
  has_many :ledgers, :foreign_key => 'category_id', :dependent => :delete_all
  
  TYPE_OF = {'I' => _('Income'), 'O' => _('Expense')}

  validates_presence_of :name, :type_of, :organization_id
  validates_uniqueness_of :name
  validates_length_of :name, :maximum=>15
  validates_inclusion_of :type_of, :in => TYPE_OF.keys
  belongs_to :organization

  def value
    0
  end

  def self.find_all_ordened(ids = :all, options = {})
#TODO see the better way to do that
#    options.merge! :order => "categories.type_of, categories.name"
    self.find ids, options
  end

  def income?
    self.type_of == 'I'
  end

  def expense?
    type_of == 'O'
  end

#TODO see
  def sum_ledgers
    ledgers.sum('value')
    30
  end

  def count_ledgers
    self.ledgers.count
  end

end
