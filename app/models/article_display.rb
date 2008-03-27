class ArticleDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'body']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'body' => _('Body'),
    }[field] || field
  end

end
