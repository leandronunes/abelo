class BankAccountDisplay < DisplayConfiguration

  def self.available_fields
    ['bank','agency','variation','account', 'is_default']
  end


  def self.describe(field)
    {
      'bank' =>  t(:bank),
      'agency' => t(:agency),
      'variation' => t(:variation),
      'account' => t(:account),
      'is_default' => t(:is_it_default?),
    }[field] || field
  end

end
