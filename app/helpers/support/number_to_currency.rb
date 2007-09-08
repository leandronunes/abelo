
def num_to_currency( num )

  # FIXME: get from configuration
  currency_separator = ','
  currency_delimiter = '.' 

  return '0'+ @currency_separator +'00'  if num == nil

  num = ( num * 100 ).round / 100.0
  body = num.to_i
  cents = ( ( num - body ) * 100 ).abs.round.to_s()
  cents = '0'+cents  if cents.length == 1

  new_body = ''
  body = body.to_s.reverse.split('')
  body.each_index do |i|
    if ( ( i % 3 ) == 0 ) && ( i > 0 ) && ( body[i] > '-' ) then
      new_body = currency_delimiter + new_body
    end
    new_body = body[i] + new_body
  end

  return new_body + currency_separator + cents

end
	
# Teste Ok!
# puts num_to_currency(nil)
# puts num_to_currency(0)
# puts num_to_currency(1)
# puts num_to_currency(1.01)
# puts num_to_currency(1.012)
# puts num_to_currency(1.018)
# puts num_to_currency(1.112)
# puts num_to_currency(1.118)
# puts num_to_currency(1.11)
# puts num_to_currency(1.99)
# puts num_to_currency(1.992)
# puts num_to_currency(1.998)
# puts num_to_currency(1.9999)
# puts num_to_currency(12)
# puts num_to_currency(12.01)
# puts num_to_currency(12.012)
# puts num_to_currency(12.018)
# puts num_to_currency(12.112)
# puts num_to_currency(12.118)
# puts num_to_currency(12.11)
# puts num_to_currency(123)
# puts num_to_currency(1234)
# puts num_to_currency(12345)
# puts num_to_currency(123456)
# puts num_to_currency(1234567)
# puts num_to_currency(-1)
# puts num_to_currency(-1.01)
# puts num_to_currency(-1.012)
# puts num_to_currency(-1.018)
# puts num_to_currency(-1.112)
# puts num_to_currency(-1.118)
# puts num_to_currency(-1.11)
# puts num_to_currency(-1.99)
# puts num_to_currency(-1.992)
# puts num_to_currency(-1.998)
# puts num_to_currency(-1.9999)
# puts num_to_currency(-12)
# puts num_to_currency(-12.01)
# puts num_to_currency(-12.012)
# puts num_to_currency(-12.018)
# puts num_to_currency(-12.112)
# puts num_to_currency(-12.118)
# puts num_to_currency(-12.11)
# puts num_to_currency(-123)
# puts num_to_currency(-1234)
# puts num_to_currency(-12345)
# puts num_to_currency(-123456)
# puts num_to_currency(-1234567)

