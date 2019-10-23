
def prompt(message)
	Kernel.puts("=> #{message}")
end

def valid_number?(num)
	num.to_i != 0
end 

def valid_prompt?(operation)
	["1","2","3","4"].include?(operation)
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

prompt("Welcome to Calculator. Enter your name:")

name = ""
loop do
name = Kernel.gets().chomp()

	if name.empty?()
		prompt("Make sure to use a valid name.")
	else
		break
	end
end

prompt("Hi #{name}!")

loop do #Main Outer Loop

#Collecting INPUTS
number_1 = ""

loop do
	prompt("Whats the first number?")
	number_1 = Kernel.gets().chomp()

	if valid_number?(number_1)
		break
	else
		prompt("That is not a valid number")
	end
end

number_2 = ""

loop do
prompt("Whats the second number?")
number_2 = Kernel.gets().chomp()
	
	if valid_number?(number_2)
		break
	else
		prompt("That is not a valid number")
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
		prompt("That is not a valid operator")
	end
end

puts "#{operation_to_message(operator)} the numbers..."

#Input operation

result =  case operator
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
prompt("Do you want to perform another calculation? (Y or N)")
answer = Kernel.gets().chomp
break unless answer.downcase().start_with?("y")
end
prompt("Thank you for using my calculator!!!")
