class SystemActor < ActiveRecord::Base

  #relationships 
  belongs_to :organization
  has_many :contacts 

  acts_as_ferret :fields => ['name', 'description']

  #validations
  validates_presence_of :name, :organization_id, :category_id,:email    
  validates_as_cnpj :cnpj
  validates_as_cpf :cpf
  validates_uniqueness_of :cnpj, :scope => :organization_id, :if => lambda { |user| ! user.cnpj.blank? }, :message => _('This %{fn} already exist')
  validates_uniqueness_of :cpf, :scope => :organization_id, :if => lambda { |user| ! user.cpf.blank? }, :message => _('This %{fn} already exist')

  def validate
    if ((! self.cpf.blank?) && (! self.cnpj.blank?)) || (self.cpf.blank? && self.cnpj.blank?)
      errors.add('cnpj', 'Either %{fn} or CPF must be filled, and they cannot be filled at the same time.')
    end
  end

  def self.available_fields
    ['name', 'address', 'description', 'email', 'category_id', 'cnpj', 'cpf', 'rg', 'birthday']
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

  # maps an actor to an human-readable string
  def self.describe(actor)
    return {
      'customer' => _('Customer'),
      'worker' => _('Worker'),
      'supplier' => _('Supplier')
    }[actor]
  end

  def self.title_name
    _('Name')  
  end

  def self.title_address
    _('Address')  
  end

  def self.title_email
    _('Email')  
  end

  def self.title_category_id
    _('Category')  
  end

  def self.title_cnpj
    _('CNPJ')  
  end

  def self.title_cpf
    _('CPF')  
  end

  def self.title_rg
    _('RG')  
  end

  def self.title_birthday
    _('Birthday')  
  end

  def self.title_description
    _('Description')  
  end

  def category
  end

end
