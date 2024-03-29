VALID_CHOICES = %w(rock paper scissors spock lizard r p s sp l)
VALID_EXIT = %w(y yes n no Y Yes N No)

player_score = 0
computer_score = 0

intro_text = <<-MSG
"Please enter:
'r' for 'rock'
'p' for 'paper'
's' for 'scissors'
'l' for 'lizard'
'sp' for 'spock'"
MSG

def blank_line
  prompt("---------------------------- <=")
end

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  rules = { "rock" => ["scissors", "lizard"],
            "paper" => ["spock", "rock"],
            "scissors" => ["lizard", "paper"],
            "lizard" => ["paper", "spock"],
            "spock" => ["rock", "scissors"] }

  rules[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!!!")
  elsif win?(computer, player)
    prompt("You Lose :-(")
  else
    prompt("Tie Game")
  end
end

def current_score(p_score, c_score)
  puts "Your score is: #{p_score}"
  puts "The computer's score is: #{c_score}"
  puts prompt("The first player to score 5 points wins!")
end

def winner_or_loser(p_score, c_score)
  if p_score == 5
    puts "You beat the computer"
  elsif c_score == 5
    puts "You lost to the computer!"
  end
end

def clear
  system('clear') || system('cls')
end

loop do
  clear()
  choice = ""

  loop do
    prompt("Welcome to rock, paper, scissors, spock, lizard!")

    puts intro_text

    choice = gets.chomp

    case choice.downcase
    when "r"
      choice = "rock"
    when "s"
      choice = "scissors"
    when "sp"
      choice = "spock"
    when "l"
      choice = "lizard"
    when "p"
      choice = "paper"
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  case computer_choice.downcase
  when "r"
    computer_choice = "rock"
  when "s"
    computer_choice = "scissors"
  when "sp"
    computer_choice = "spock"
  when "l"
    computer_choice = "lizard"
  when "p"
    computer_choice = "paper"
  end

  display_results(choice, computer_choice)

  prompt("You chose: #{choice}.")

  prompt("Your opponent chose: #{computer_choice}")

  blank_line

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  current_score(player_score, computer_score)

  winner_or_loser(player_score, computer_score)

  if computer_score == 5 || player_score == 5
    puts "Thank you for playing!"
    break
  end

  answer = ""
  loop do
    prompt("Do you want to play again?")
    answer = gets.chomp

    if VALID_EXIT.include?(answer)
      break
    else
      prompt("Please enter Yes or No")
    end
  end

  break unless answer.downcase == "y" || answer.downcase == "yes"
end

# clear()
