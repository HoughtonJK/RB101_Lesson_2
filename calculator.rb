# ask user for two numbers
# ask user for opertation to perform
# perform operation on two numbers
# output result

#answer = Kernel.gets()
#Kernel.puts(answer)
def isinteger?(num)
  num == num.to_i.to_s
end

def isfloat?(num)
  num == num.to_f.to_s
end

def isnumber?(num)
  isinteger?(num) || isfloat?(num)
end

def iscomplex?(num)
  complex = num.split()
  return isnumber?(complex[0]) && isnumber?(complex[2])
end

def getint(ordinal)
  number = ''
  loop do
    Kernel.puts("What's the #{ordinal} number?")
    number = Kernel.gets().chomp()
    if isinteger?(number)
      return number.to_i
    end
    puts "Please enter a valid integer"
  end
end

def getfloat(ordinal)
  number = ''
  loop do
    Kernel.puts("What's the #{ordinal} number?")
    number = Kernel.gets().chomp()
    if isfloat?(number)
      return number.to_f
    end
    puts "Please enter a valid decimal number"
  end
end

def getcomplex(ordinal)
  number = ''
  loop do
    Kernel.puts("What's the #{ordinal} number? Write in 'a + b i' form. Use spaces.")
    number = Kernel.gets().chomp()
    number
    if iscomplex?(number)
      return number.split()
    end
    puts "Please enter a valid complex number"
  end
end

def calculate(num1, num2)
  loop do
    puts "Please type the operation you wish to perform (+,-,*,/,^)"
    operation = gets.chomp
    case operation
    when '+'
      return num1 + num2
    when '-'
      return num1 - num2
    when '*'
      return num1 * num2
    when '/'
      return num1 / num2.to_f
    when '^'
      return num1 ** num2 
    end
    puts "That is not a valid operation."
  end
end

def complex_calculate(num1, num2)
  loop do
    puts "Please type the operation you wish to perform (+,-,*,/)"
    operation = gets.chomp
    case operation
    when '+'
      return "#{num1[0].to_i + num2[0]}+#{num1[2] + num2[2]}i"
    when '-'
      return "#{num1[0] - num2[0]}+#{num1[2] - num2[2]}i"
    when '*'
      return "#{num1[0] * num2[0] - num1[2] * num2[2]}+" + \
             "#{num1[0] * num2[2] + num1[2] * num2[0]}i"
    when '/'
      return "#{num1[0] * num2[0] + num1[2] * num2[2]}/" + \
             "#{num2[0]**2 + num2[2]**2} " + \
             "#{num1[2] * num2[0] - num1[0] * num2[2]}/" + \
             "#{num2[0]**2 + num2[2]**2} i"
    end
    puts "That is not a valid operation."
  end
end

def mod_calculate(num1, num2, mod)
  loop do
    puts "Please type the operation you wish to perform (+,-,*,^)"
    operation = gets.chomp
    case operation
    when '+'
      return (num1 + num2)%mod
    when '-'
      return (num1 - num2)%mod
    when '*'
      return (num1 * num2)%mod
    when '^'
      return mod_exponents(num1, num2, mod)
    end
    puts "That is not a valid operation."
  end
end

def mod_exponents(num1, num2, mod)
  return num1%mod if num2 == 1
  if num2 % 2 == 0
    return mod_exponents(num1, num2 / 2, mod) % mod
  else
    return num1 * mod_exponents(num1, num2 / 2, mod) % mod
  end
end

Kernel.puts("Welcome to Calculator")
mode = ''
loop do
  puts "What mode do you wish to use? (Integer, Scientific, Complex, Modular)"
  mode = gets.chomp.downcase
  break if mode == 'integer' || mode == 'scientific' || mode == 'complex' || mode == 'modular'
  puts "That is not a valid mode."
end
case mode
when 'integer'
  number1 = getint('first')
  Kernel.puts("The number is: #{number1}.")
  number2 = getint('second')
  Kernel.puts("The numbers are: #{number1} and #{number2}!")
  result = calculate(number1, number2)
  Kernel.puts("The result is #{result}")
when 'scientific'
  number1 = getfloat('first')
  Kernel.puts("The number is: #{number1}.")
  number2 = getfloat('second')
  Kernel.puts("The numbers are: #{number1} and #{number2}!")
  result = calculate(number1, number2)
  Kernel.puts("The result is #{result}")
when 'complex'
  number1 = getcomplex('first')
  Kernel.puts("The number is: #{number1[0]}#{number1[1]}#{number1[2]}i.")
  number2 = getcomplex('second')
  Kernel.puts("The numbers are: #{number1[0]}#{number1[1]}#{number1[2]}i and #{number2[0]}#{number2[1]}#{number2[2]}i")
  result = complex_calculate(number1, number2)
  Kernel.puts("The result is #{result}")  
when 'modular'
  modulus = getint('mod')
  puts "The modulus is #{modulus}"
  number1 = getint('first')
  Kernel.puts("The number is: #{number1}.")
  number2 = getint('second')
  Kernel.puts("The numbers are: #{number1} and #{number2}!")
  result = mod_calculate(number1, number2, modulus)
  Kernel.puts("The result is #{result}")
end
