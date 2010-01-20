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
  validates_numericality_of :website_points, :only_integer => true, :allow_nil => true

  def self.describe(field)
    {
      'user' =>  t(:user_total_points),
      'website' => t(:website_points),
    }[field] || field
  end

  def user_points
    self.organization.users.length * self.points_per_user
  end

  def total_points
    self.product_points + self.customer_points + self.supplier_points + self.worker_points + self.ledger_points + self.document_points + self.website_points + self.user_points 
  end
end
