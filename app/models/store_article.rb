class StoreArticle < Article

  def self.short_description
    t(:store_page)
  end

  def self.description
    t(:page_that_generates_the_organization_store)
  end
end
