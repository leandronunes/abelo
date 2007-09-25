class CreateLedgers < ActiveRecord::Migration
  def self.up
    create_table :ledgers do |t|
      t.column :owner_type,             :string, :null => false
      t.column :owner_id,               :integer, :null => false
      t.column :type,                   :string, :null => false
      t.column :type_of,                :string, :limit => 1, :null => false
      t.column :category_id,            :integer, :null => false
      t.column :foreseen_value,         :float
      t.column :effective_value,        :float
      t.column :description,            :string, :default => ''
      # The attribute date must be always nil it was created to solve a problem with date passed by view
      t.column :date,                   :date 
      t.column :foreseen_date,          :date
      t.column :effective_date,         :date
      t.column :interests,              :float, :default => 0
      t.column :interests_days,         :integer, :default => 0
      t.column :number_of_parcels,      :integer, :default => 1
      t.column :parcel_number,          :integer, :default => 1
      t.column :operational,            :boolean, :default => false, :null => false
      t.column :bank_account_id,        :integer,  :null => false
      t.column :is_foreseen,            :boolean,  :null => false, :default => false
      t.column :is_operational,         :boolean,  :default => false
      t.column :schedule_ledger_id,     :integer
      t.column :payment_id,             :integer
    
      # payment with credit card
      t.column :credit_card_number,         :string
      t.column :credit_card_validity,       :date
      t.column :credit_card_secutiry_code,  :string
      t.column :credit_card_owner_name,     :string
      t.column :credit_card_cnpj,           :string
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
      t.column :check_cnpj,                 :string

      # payment with automatic debit
      t.column :automatic_debit_owner_name,      :string
      t.column :automatic_debit_bank_id,         :integer
      t.column :automatic_debit_account_agency,  :string
      t.column :automatic_debit_account_number,  :string

    end
    
    add_index :ledgers, :category_id
  end

  def self.down
    remove_index  :ledgers, :category_id
    drop_table :ledgers
  end
end
