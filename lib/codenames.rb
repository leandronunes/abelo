# important: this file MUST be UTF-8 encoded

class String

  TRANSLITERATIONS = {
    [ 'á', 'à', 'à', 'â', 'ã', 'ª' ] => 'a',
    [ 'é', 'è', 'ê', 'ë' ] => 'e',
    [ 'í', 'ì', 'î', 'ï' ] => 'i',
    [ 'ó', 'ò', 'ô', 'ö', 'õ', 'º' ] => 'o',
    [ 'ú', 'ù', 'û', 'ü' ] => 'u',
    [ 'ç' ] => 'c'
  }

  def transliterate
    new = self.clone
    TRANSLITERATIONS.each { |from,to|
      from.each { |seq|
        new.gsub!(seq, to)
      }
    }
    new
  end

end
