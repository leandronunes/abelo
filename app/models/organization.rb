class Organization < ActiveRecord::Base

  validates_presence_of :name

  validates_as_cnpj :cnpj
  validates_presence_of :cnpj

  validates_presence_of :nickname
  validates_format_of :nickname, :with => /^[a-z0-9_]*$/, :message => '%{fn} can only contain downcase letters, numbers and "_"'

end
