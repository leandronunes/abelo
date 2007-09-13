class TestController < ApplicationController

  skip_before_filter :check_access_control


  NUMBERS_TO_CURRENCY = %w[
     nil
     0
     1
     1.01
     1.012
     1.018
     1.112
     1.118
     1.11
     1.99
     1.992
     1.998
     1.9999
     12
     12.01
     12.012
     12.018
     12.112
     12.118
     12.11
     123
     1234
     12345
     123456
     1234567
     -1
     -1.01
     -1.012
     -1.018
     -1.112
     -1.118
     -1.11
     -1.99
     -1.992
     -1.998
     -1.9999
     -12
     -12.01
     -12.012
     -12.018
     -12.112
     -12.118
     -12.11
     -123
     -1234
     -12345
     -123456
     -1234567
  ]

  NUMBERS_TO_CURRENCY.each do |n|
    define_method("num_to_currency_#{n.gsub(/\.|-/, '_')}") do
      render :inline => "<%= num_to_currency #{n} %>"    
    end
  end

end
