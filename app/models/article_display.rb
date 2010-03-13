class ArticleDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'body']
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
      'body' => I18n.t(:body),
    }[field] || field
  end

end
