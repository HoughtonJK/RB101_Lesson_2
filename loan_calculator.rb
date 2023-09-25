# calculate loans and stuff

def number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def get_parameter(parameter)
  loop do
    puts "Please enter #{parameter}:"
    parameter_value = gets.chomp
    if number?(parameter_value)
      return parameter_value.to_f
    end
    puts "'#{parameter_value}' is not a valid number."
  end
end

def compute_payment(amount, rate, payments)
  rate /= 12
  amount * (rate / (1 - (1 + rate)**(-payments)))
end

loan_amount = get_parameter('loan amount')
annual_interest_rate = get_parameter('annual interest rate percentage') / 100
number_payments = get_parameter('number of monthly payments')
monthly_payments = compute_payment(loan_amount, annual_interest_rate, \
                                   number_payments)

puts "The monthly payments are $#{format('%.2f', monthly_payments)}."
puts "The total repayment amount is" +
      "$#{format('%.2f', monthly_payments * number_payments)}."
