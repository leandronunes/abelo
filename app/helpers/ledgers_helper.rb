module LedgersHelper
  def category_with_sign(category)
    category.type_of.to_s == 'O' ? _("(-) %s") % category.name :  _("(+) %s") % category.name
  end

end
