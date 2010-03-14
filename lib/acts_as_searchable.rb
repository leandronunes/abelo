class << ActiveRecord::Base
  #FIXME make this test

  def acts_as_searchable(options = {})
    acts_as_ferret({ :remote => true }.merge(options))
  end

end
