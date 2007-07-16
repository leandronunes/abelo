module CategoriesHelper
  def type_of_str(type)
    if type == 'I'
      return "Entrada"
    else
      return "Saída"
    end
  end
end
