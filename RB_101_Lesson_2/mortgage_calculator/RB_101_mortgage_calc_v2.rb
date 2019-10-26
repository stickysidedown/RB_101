require 'yaml'

MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

# Input methods
def prompt(message)
  puts "=>>#{message}"
end

def valid_loan_amount
  loop do
    prompt(MESSAGES['loan_amount?'])
    @loan_amount = gets.chomp
    if @loan_amount.to_i <= 0
      prompt(MESSAGES['valid_loan_amount?'])
    else
      break
    end
  end
  @loan_amount = @loan_amount.to_i
end
puts @loan_amount

def interest_rate?
  loop do
    prompt(MESSAGES['interest_rate?'])
    @rate = gets.chomp
    if @rate.to_f > 0 && @rate.to_f < 20
      prompt(MESSAGES['your_rate'])
      puts @rate.to_f.to_s
      break
    else
      prompt(MESSAGES['valid_rate'])
    end
  end
  @rate = (@rate.to_f / 100) / 12
end

def loan_length_years
  loop do
    prompt(MESSAGES['loan_length?'])
    @loan_length = gets.chomp
    if @loan_length.to_f <= 0.0 || @loan_length.empty?
      prompt(MESSAGES['invalid_loan_length'])
      prompt(MESSAGES['example_loan_length'])
    else
      break
    end
  end
  @loan_length = (@loan_length.to_i * 12)
end

# Calculation method

def loan_formula(loan_amount, loan_rate, loan_length)
  @monthly_pmt = loan_amount * (loan_rate / (1 - (1 + loan_rate)**-loan_length))
  @monthly_pmt = @monthly_pmt.to_i
end

# End methods

def output
  prompt(MESSAGES['the_payment'])
  pretty_rate = (@rate * 12.0 * 100.0)
  puts("#{@monthly_pmt} per month for")
  puts "#{@loan_length / 12} years at a rate of #{pretty_rate}%"
end

def valid_answer(answer)
  ["y", "yes", "n", "no"].include?(answer)
end

def the_end
  loop do
    prompt(MESSAGES['the_end?'])
    @answer = gets.chomp

    if valid_answer(@answer.downcase) == false
      prompt(MESSAGES['invalid_answer'])
    else
      break
    end
  end
end

# program

loop do
  prompt(MESSAGES['welcome'])
  prompt(MESSAGES['line_break'])
  prompt(MESSAGES['welcome2'])

  valid_loan_amount

  interest_rate?

  loan_length_years

  loan_formula(@loan_amount, @rate, @loan_length)

  # output

  output

  the_end

  break unless @answer.downcase() == "y" || @answer.downcase() == "yes"
end
