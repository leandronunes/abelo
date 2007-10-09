class CreditCard < Ledger

  validates_presence_of :category_id
  validates_presence_of :credit_card_number
  validates_presence_of :credit_card_validity
  validates_presence_of :credit_card_secutiry_code
  validates_presence_of :credit_card_owner_name
  validates_presence_of :credit_card_cnpj, :if => lambda{|check| check.person_type == PersonType::JURISTIC }
  validates_presence_of :credit_card_cpf, :if => lambda{|check| check.person_type != PersonType::JURISTIC }

  def person_type
    self.type_person ||= self.check_cnpj.nil? ? PersonType::NATURAL : PersonType::JURISTIC
  end

  def person_type= type
    self.type_person = type == PersonType::JURISTIC ? PersonType::JURISTIC : PersonType::NATURAL
  end

  protected

  attr_accessor :type_person
end
