class Player
  attr_accessor :name
  attr_reader :lives, :score

  @@players = []
  @@current_player = 0

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
    @@players << self
  end

  def choose_name
    puts "Enter your player name: "
    @name = gets.chomp
  end

  def gain_points
    @score += 1
  end

  def lose_life
    @lives -= 1
  end

  def lives_reset
    @lives = 3
  end
end

def generate_random_numbers
  num1 = rand(11)
  num2 = rand(11)
  return num1, num2
end

def sum(num1, num2)
  sum = num1 + num2
end

def generate_question(player_name, num1, num2)
  puts "#{player_name}: What does #{num1} plus #{num2} equal?"
  gets.to_i
end

def verify_answer(player_answer, correct_answer)
  player_answer == correct_answer
end

game_over = false
current_player = 0

players = []
players[0] = Player.new("Player 1")
players[1] = Player.new("Player 2")


while !game_over
  player_name = players[current_player].name
  num1, num2 = generate_random_numbers
  player_answer = generate_question(player_name, num1, num2)
  correct_answer = sum(num1, num2)
  verified = verify_answer(player_answer, correct_answer)
  if !verified
    players[current_player].lose_life
    lives = players[current_player].lives
    puts "Wrong! #{player_name} has #{lives} lives left."
    if lives == 0
      players[0].lives_reset
      players[1].lives_reset
      puts "Game over. #{player_name} loses."
      winning_player = (current_player + 1) % 2
      players[winning_player].gain_points
      player1_score = players[0].score
      player2_score = players[1].score
      puts "#{players[0].name} has score: #{player1_score}."
      puts "#{players[1].name} has score: #{player2_score}."
      puts "Play again?"
      play_again = gets.chomp
      if play_again == "no" || play_again == "n"
        game_over = true
      end
    end
  else
    lives = players[current_player].lives
    puts "Correct! #{player_name} still has #{lives} lives left."
  end
  current_player = (current_player + 1) % 2
end
