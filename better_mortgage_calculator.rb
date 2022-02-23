require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(msg)
  puts "=> #{msg}"
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

prompt(messages('greeting'))
prompt('------------------------------------------')

prompt(messages('name'))

name = ''
loop do
  name = gets.chomp
  if name.to_i.to_s == name
    prompt("Please enter a valid name.")
  else
    break
  end
end

prompt("Hello #{name.capitalize!}!")

loop do
  price = ''
  prompt(messages('price'))
  loop do
    price = gets.chomp
    if float?(price) || integer?(price)
      break
    else
      prompt(messages('valid_number_error'))
    end
  end

  tax = 0.0825
  price + (price * tax)

  down_payment = ''
  prompt(messages('down_payment'))
  loop do
    down_payment = gets.chomp
    if float?(down_payment) || integer?(down_payment)
      break
    else
      prompt(messages('valid_number_error'))
    end
  end

  loan_amount = price.to_f - down_payment.to_f
  apr = ''
  prompt(messages('apr'))
  loop do
    apr = gets.chomp
    if float?(apr) || integer?(apr)
      break
    else
      prompt(messages('valid_number_error'))
    end
  end

  apr = apr.to_f / 100

  loan_duration = '' # in months
  prompt(messages('loan_duration'))
  loop do
    loan_duration = gets.chomp
    if float?(loan_duration) || integer?(loan_duration)
      break
    else
      prompt(messages('valid_number_error'))
    end
  end

  monthly_payment = loan_amount.to_f * ((apr.to_f / 12) / (1 - (1 + (apr.to_f / 12))**(-loan_duration.to_f)))

  interest = ((monthly_payment.to_f * loan_duration.to_f) - loan_amount.to_f).round(2)

  answer = ''
  deferred = nil
  prompt(messages('deferred?'))
  loop do
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
    deferred = (price.to_f - down_payment.to_f) / loan_duration.to_f
    break
  end

  if deferred
    prompt("#{messages('monthly_payment')} $#{deferred.round(2)}.") 
    prompt("You will be paying an extra $#{interest} after those #{loan_duration} months.")
  else
    prompt("#{messages('monthly_payment')} $#{monthly_payment.round(2)}.")
    prompt("You will be paying an extra $#{interest} in interest.")
  end

  prompt('------------------------------------------')
  prompt(messages('try_again?'))
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("#{messages('thanks')} #{name}! Have a great day!")
