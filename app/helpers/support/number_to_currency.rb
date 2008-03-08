
def num_to_currency( num, show_sign = true )

  currency_separator = ','
  currency_delimiter = '.' 

  return '0'+ currency_separator +'00'  if num.nil?

  num = ( num * 100 ).round / 100.0
  body = num.to_i
  cents = ( ( num - body ) * 100 ).abs.round.to_s()
  cents = '0'+cents  if cents.length == 1

  body = body.abs unless show_sign

  new_body = ''
  body = body.to_s.reverse.split('')
  body.each_index do |i|
    if ( ( i % 3 ) == 0 ) && ( i > 0 ) && ( body[i] > '-' ) then
      new_body = currency_delimiter + new_body
    end
    new_body = body[i] + new_body
  end

  new_body + currency_separator + cents

end
	
