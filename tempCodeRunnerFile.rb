require 'yaml'
MESSAGES = YAML.load_file('/Users/sambillingsley/Documents/School Work/RB101/mortgage_messages.yml')

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
end