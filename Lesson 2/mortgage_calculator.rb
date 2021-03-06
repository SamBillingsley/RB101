require 'yaml'
MESSAGES = YAML.load_file( '/Users/sambillingsley/Documents/School Work/RB101/mortgage_messages.yml' )

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

loop do

  loan_amount = ''
  prompt(messages('loan_amount'))
    loop do
      loan_amount = gets.chomp
      if float?(loan_amount) || integer?(loan_amount)
        break
      else
        prompt(messages('valid_number_error'))
      end
    end
    

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

  loan_duration = ''  #in months
  prompt(messages('loan_duration'))
    loop do
      loan_duration = gets.chomp
      if float?(loan_duration) || integer?(loan_duration)
        break
      else
        prompt(messages('valid_number_error'))
      end
    end

    monthly_payment = ''
    monthly_payment = loan_amount.to_f * ((apr.to_f / 100 / 12) / (1 - (1 + (apr.to_f / 100 / 12))**(-loan_duration.to_f)))
    prompt("#{messages('monthly_payment')} #{monthly_payment}.") 

    prompt(messages('try_again?'))
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  prompt(messages('thanks'))