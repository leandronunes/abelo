class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.column :sale_id,                    :integer, :null => false
      t.column :type,                       :string,  :null => false
      t.column :value,                      :float,   :null => false
      t.column :date,                       :date,    :null => false
      t.column :received,                   :boolean, :null => false

      # payment with cash
      t.column :cash,                       :float

      # payment with credit card
      t.column :credit_card_number,         :string
      t.column :credit_card_validity,       :date
      t.column :credit_card_secutiry_code,  :string
      t.column :credit_card_owner_name,     :string
      t.column :credit_card_cpf,            :string

      # payment with check
      t.column :check_bank_id,              :integer
      t.column :check_owner_name,           :string
      t.column :check_account_agency,       :string
      t.column :check_account_number,       :string
      t.column :check_number,               :string
      t.column :check_contact_telephone,    :string
      t.column :check_rg,                   :string
      t.column :check_cpf,                  :string

      # payment with automatic debit
      t.column :automatic_debit_owner_name, :string
      t.column :automatic_debit_account_agency, :string
      t.column :automatic_debit_account_number, :string

    end
  end

  def self.down
    drop_table :payments
  end
end
