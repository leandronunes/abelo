class Tracker < ActiveRecord::Base

  belongs_to :organization

  validates_numericality_of :available_points, :only_integer => true, :allow_nil => true
  validates_numericality_of :product_points, :only_integer => true, :allow_nil => true
  validates_numericality_of :customer_points, :only_integer => true, :allow_nil => true
  validates_numericality_of :supplier_points, :only_integer => true, :allow_nil => true
  validates_numericality_of :worker_points, :only_integer => true, :allow_nil => true
  validates_numericality_of :ledger_points, :only_integer => true, :allow_nil => true
  validates_numericality_of :document_points, :only_integer => true, :allow_nil => true
  validates_numericality_of :points_per_user, :only_integer => true, :allow_nil => true
  validates_numericality_of :points_per_web_site, :only_integer => true, :allow_nil => true

  def self.describe(field)
    {
      'user' =>  _('User total points'),
      'web_site' => _('Web site total points'),
    }[field] || field
  end

end
