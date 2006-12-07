module ProductsHelper

  def select_unit(object, method)
    select(object, method, [
      [ _('Kilograms'), 'kg' ],
      [ _('Units'), 'un' ],
    ])
  end

end
