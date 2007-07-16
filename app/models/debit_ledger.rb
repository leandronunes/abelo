# == Schema Information
# Schema version: 35
#
# Table name: ledgers
#
#  id                :integer       not null, primary key
#  owner_type        :string(255)   not null
#  owner_id          :integer       not null
#  type              :string(255)   not null
#  category_id       :integer       not null
#  value             :float         not null
#  description       :string(255)   
#  date              :date          not null
#  interests         :float         default(0.0)
#  interests_days    :integer       default(0)
#  number_of_parcels :integer       default(1)
#  parcel_number     :integer       default(1)
#  operational       :boolean       not null
#  organization_id   :integer       not null
#  is_foreseen       :boolean       not null
#

class DebitLedger < Ledger
end
