class ArticleDisplay < DisplayConfiguration
  #FIXME make this test

  def self.available_fields
    ['name', 'body', 'abstract']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'body' => _('Body'),
      'abstract' => _('Abstract'),
    }[field] || field
  end

end
