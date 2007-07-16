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

class Ledger < ActiveRecord::Base
  acts_as_taggable

  belongs_to :ledger_category, :foreign_key => 'category_id'
  validates_presence_of :date, :category_id
  validates_numericality_of :value


  def self.find_all_ordened(options = {})
    options.merge! :order => 'ledgers.date DESC, ledgers.id DESC'
    self.find :all, options
  end


  def self.sum_by_month(category_id, time = Time.now)
    date_init = time.at_beginning_of_month
    date_end  = time.months_since(1).at_beginning_of_month

    results = self.find_by_sql ["select sum(value) as total_ledgers from ledgers where ledgers.date >= ? and ledgers.date < ? and ledgers.category_id = ?", date_init, date_end, category_id]

    unless results.empty? || results.first.total_ledgers.nil?
      Float(results.first.total_ledgers)
    else
      nil
    end
  end

  protected
  def validate
    errors.add(:value, "should be at least 0.01" ) if value.nil? || value <= 0.00
  end

end
