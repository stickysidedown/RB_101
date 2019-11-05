VALID_CHOICES = %w(rock paper scissors spock lizard r p s v l)
COMPUTER_CHOICES = %w(rock paper scissors spock lizard)
VALID_EXIT = %w(y yes n no Y Yes N No)
WINNING_SCORE = 5

def blank_line
  prompt("---------------------------- <=")
end

def prompt(message)
  puts("=> #{message}")
end

def welcome(player_choice, welcome_text)
  loop do
  prompt("Welcome to rock, paper, scissors, spock, lizard!")
  puts welcome_text
  player_choice = gets.chomp.downcase

   if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  player_choice
end

def player_case(player)
  case player
  when "r"
    "rock"
  when "s"
    "scissors"
  when "v"
    "spock"
  when "l"
    "lizard"
  when "p"
    "paper"
  else
    player
  end
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

def current_score(player_score, computer_score)
  puts "Your score is: #{player_score}"
  puts "The computer's score is: #{computer_score}"
  puts prompt("The first player to score #{WINNING_SCORE} points wins!")
end

def winner_or_loser(player_score, computer_score)
  if player_score == WINNING_SCORE
    puts "You beat the computer"
    puts "Thank You for playing"
  elsif computer_score == WINNING_SCORE
    puts "You lost to the computer!"
    puts "Thank you for playing"
  end
end

def clear
  system('clear') || system('cls')
end

intro_text = <<-MSG
"Please enter:
'r' for 'rock'
'p' for 'paper'
's' for 'scissors'
'l' for 'lizard'
'v' for 'spock'"
=>
MSG

answer = ""
def play_again(answer)
  loop do
  puts("Do you want to play again?")
  answer = gets.chomp.downcase
    if VALID_EXIT.include?(answer)
      break
    else
      puts("Please enter Yes or No")
    end
  end
  answer
end

player_score = 0
computer_score = 0

loop do
  clear
  choice = ""

  choice = welcome(choice, intro_text)

  choice = player_case(choice)

  computer_choice = COMPUTER_CHOICES.sample

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

  break if computer_score == WINNING_SCORE || player_score == WINNING_SCORE

  answer = play_again(answer)

  break unless answer == "y" || answer == "yes"
end
