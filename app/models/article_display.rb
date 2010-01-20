class ArticleDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'body']
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'body' => t(:body),
    }[field] || field
  end

end
