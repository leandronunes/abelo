class StoreArticle < Article

  def self.short_description
    I18n.t(:store_page)
  end

  def self.description
    I18n.t(:page_that_generates_the_organization_store)
  end
end
