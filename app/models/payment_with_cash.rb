# == Schema Information
# Schema version: 35
#
# Table name: payments
#
#  id                             :integer       not null, primary key
#  sale_id                        :integer       not null
#  type                           :string(255)   not null
#  value                          :float         not null
#  date                           :date          not null
#  received                       :boolean       not null
#  cash                           :float         
#  credit_card_number             :string(255)   
#  credit_card_validity           :date          
#  credit_card_secutiry_code      :string(255)   
#  credit_card_owner_name         :string(255)   
#  credit_card_cpf                :string(255)   
#  interests_id                   :integer       
#  check_bank_id                  :integer       
#  check_owner_name               :string(255)   
#  check_account_agency           :string(255)   
#  check_account_number           :string(255)   
#  check_number                   :string(255)   
#  check_contact_telephone        :string(255)   
#  check_rg                       :string(255)   
#  check_cpf                      :string(255)   
#  automatic_debit_owner_name     :string(255)   
#  automatic_debit_account_agency :string(255)   
#  automatic_debit_account_number :string(255)   
#  parcels_number                 :integer       
#  days                           :integer       
#

class PaymentWithCash < Payment

  validates_presence_of :cash
  validates_numericality_of :cash

  # calculates the change needed
  def change
    (cash > value) ? (cash - value) : 0.0
  end

end
