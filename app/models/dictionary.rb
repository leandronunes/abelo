class Dictionary

  def self.parser(word)
    {
      'I' => Payment.describe('I'),
      'E' => Payment.describe('E')
    }[word] || word
  end

end
