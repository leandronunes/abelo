class BankAccountDisplay < DisplayConfiguration

  def self.available_fields
    ['bank','agency','variation','account', 'is_default']
  end


  def self.describe(field)
    {
      'bank' =>  I18n.t(:bank),
      'agency' => I18n.t(:agency),
      'variation' => I18n.t(:variation),
      'account' => I18n.t(:account),
      'is_default' => I18n.t(:is_it_default?),
    }[field] || field
  end

end
