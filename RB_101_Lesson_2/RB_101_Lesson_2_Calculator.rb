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
	["1","2","3","4"].include?(operation)
end

def operation_to_message(operator)
	case operator
		when "1"
			return "Adding"
		when "2"
			return "Subracting"
		when "3"
			return "Multiplying"
		when "4"
			return "Dividing"
	end
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

prompt("Hi #{name}!")

loop do #Main Outer Loop

#Collecting INPUTS
number_1 = ""

loop do
	prompt(language('first number?', LANGUAGE))
	number_1 = Kernel.gets().chomp()

	if valid_number?(number_1)
		break
	else
		prompt(language('invalid number', LANGUAGE))
	end
end

number_2 = ""

loop do
prompt(language('second number?', LANGUAGE))
number_2 = Kernel.gets().chomp()

	if valid_number?(number_2)
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

#Input operation

result = case operator
		 		 when "1"
	 			 	  number_1.to_i() + number_2.to_i()
		     when "2"
				 		number_1.to_i() - number_2.to_i()
				 when "3"
				 		number_1.to_i() * number_2.to_i()
				 when "4"
				 		number_1.to_f() / number_2.to_f()
				 end
# Output
prompt("The answer is #{result}.")
prompt(language('another calculation?', LANGUAGE))
answer = Kernel.gets().chomp
break unless answer.downcase().start_with?("y")
end
prompt(language('thank you', LANGUAGE))
