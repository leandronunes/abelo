class Check < Ledger

  belongs_to :bank, :foreign_key => :check_bank_id

  validates_presence_of :category_id
  validates_presence_of :check_owner_name
  validates_presence_of :check_bank_id
  validates_presence_of :check_account_agency
  validates_presence_of :check_account_number
  validates_presence_of :check_number
  validates_presence_of :check_cpf, :if => lambda{|check| check.person_type != PersonType::JURISTIC }
  validates_presence_of :check_cnpj, :if => lambda{|check| check.person_type == PersonType::JURISTIC }

  def person_type 
    self.type_person ||= self.check_cnpj.nil? ? PersonType::NATURAL : PersonType::JURISTIC
  end

  def person_type= type
    self.type_person = type == PersonType::JURISTIC ? PersonType::JURISTIC : PersonType::NATURAL
  end

  protected

  attr_accessor :type_person

end
