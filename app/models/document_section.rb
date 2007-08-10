class DocumentSection < ActiveRecord::Base
  has_many :document_items
  belongs_to :document
  validates_presence_of :name
  validates_presence_of :document_id
  validates_uniqueness_of :name, :scope => :document_id

  before_destroy{ |record| DocumentItem.destroy_all "document_section_id = #{record.id}" }
end
