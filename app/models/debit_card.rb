class DebitCard < Ledger

  belongs_to :bank, :foreign_key => :check_bank_id

  validates_presence_of :category_id
  validates_presence_of :automatic_debit_owner_name
  validates_presence_of :automatic_debit_bank_id
  validates_presence_of :automatic_debit_account_agency
  validates_presence_of :automatic_debit_account_number

  def person_type
    self.type_person ||= self.check_cnpj.nil? ? PersonType::NATURAL : PersonType::JURISTIC
  end

  def person_type= type
    self.type_person = type == PersonType::JURISTIC ? PersonType::JURISTIC : PersonType::NATURAL
  end

  protected

  attr_accessor :type_person


end
