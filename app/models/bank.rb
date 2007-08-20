class Bank < ActiveRecord::Base
  validates_presence_of :name, :code
  validates_uniqueness_of :code

  def self.options
    options = Array.new
    self.find(:all).each do |b|
      options.push([b.name,b.id])
    end
    options
  end


end
