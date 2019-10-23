require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def language(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def valid_prompt?(operation)
  ["1", "2", "3", "4"].include?(operation)
end

def operation_to_message(operator)
  case operator
  when "1"
    "Adding"
  when "2"
    "Subracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

def valid_answer(answer)
  ["y", "yes", "n", "no"].include?(answer)
end

prompt(language('welcome', LANGUAGE))

name = ""

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(language('valid name', LANGUAGE))
  else
    break
  end
end

pretty_name = name.split(" ")
prompt("Hi #{pretty_name[0]} #{pretty_name[1]} #{pretty_name[2]}")

# Main Outer Loop
loop do
  # Collecting INPUTS
  number1 = ""

  loop do
    prompt(language('first number?', LANGUAGE))
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt(language('invalid number', LANGUAGE))
    end
  end

  number2 = ""

  loop do
    prompt(language('second number?', LANGUAGE))
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(language('invalid number', LANGUAGE))
    end
  end

  operator = ""
  operator_prompt = <<-MSG
What operation would you like to perform?
1) add
2) subtract
3) multiply
4) divide
MSG

  loop do
    prompt(operator_prompt)

    operator = Kernel.gets().chomp()

    if valid_prompt?(operator)
      break
    else
      prompt(language('invalid operator', LANGUAGE))
    end
  end

  puts "#{operation_to_message(operator)} the numbers..."

  # Input operation

  result =  case operator
            when "1"
              number1.to_f() + number2.to_f()
            when "2"
              number1.to_f() - number2.to_f()
            when "3"
              number1.to_f() * number2.to_f()
            when "4"
              if number2.to_f != 0.0
                number1.to_f() / number2.to_f()
              else
                prompt("The denominator can not be zero.")
                prompt("Please enter numbers again.")
                next
              end
            end
  # Output
  prompt("The answer is #{result}.")
  answer = ""
  loop do
    prompt(language('another calculation?', LANGUAGE))
    answer = Kernel.gets().chomp

    if valid_answer(answer) == false
      prompt("The only valid answers are 'Y', 'N', 'Yes', or 'No' ")
    else
      break
    end
  end
  break unless answer.downcase() == "y" || answer.downcase() == "yes"
end
prompt(language('thank you', LANGUAGE))
