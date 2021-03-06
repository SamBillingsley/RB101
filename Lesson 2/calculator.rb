require 'yaml'
MESSAGES = YAML.load_file('/Users/sambillingsley/Documents/School Work/RB101/calculator_messages.yml')

LANGUAGE = 'es'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  puts "=> #{message}"
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def op_to_msg(op)
  msg = case op
        when "1"
          "Adding"
        when "2"
          "Subtracting"
        when "3"
          "Multiplying"
        when "4"
          "Dividing"
        end
  msg
end

prompt(messages('welcome', LANGUAGE)) 
name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt(messages('valid_name', LANGUAGE)) 
  else
    break
  end
end

prompt("#{messages('name_greeting', LANGUAGE)} #{name.capitalize!}!") 

loop do
  num1 = ''
  num2 = ''
  operator = ''

  loop do
    prompt(messages('first_number?', LANGUAGE)) 
    num1 = gets.chomp

    if float?(num1) || integer?(num1)
      break
    else
      prompt(messages('valid_number_error', LANGUAGE)) 
    end
  end

  loop do
    prompt(messages('second_number?', LANGUAGE)) 
    num2 = gets.chomp

    if float?(num2) || integer?(num2)
      break
    else
      prompt(messages('valid_number_error', LANGUAGE)) 
    end
  end

  op_prompt_en = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
    MSG
  
  op_prompt_es = <<-MSG
    ¿Qué operación le gustaría realizar?
    1) añadir
    2) restar
    3) multiplicar
    4) dividir
    MSG

    if LANGUAGE == 'en'
      prompt(op_prompt_en)
    else
      prompt(op_prompt_es)
    end

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('valid_operation?', LANGUAGE)) 
    end
  end

  prompt("#{op_to_msg(operator)} #{messages('operator_action', LANGUAGE)}") 

  result = case operator
           when "1"
             num1.to_f + num2.to_f
           when "2"
             num1.to_f - num2.to_f
           when "3"
             num1.to_f * num2.to_f
           when "4"
             num1.to_f / num2.to_f
           end

  prompt("#{messages('result', LANGUAGE)} #{result}.") 

  prompt(messages('retry?', LANGUAGE)) 
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("#{messages('exit', LANGUAGE)} #{name}.")


