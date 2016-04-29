def last_player_check(player)
  if player == 1
    player = 2
  elsif player == 2
    player = 1
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

def lives_check(current_player)
player_lives = @players.select { |player| player }[current_player][:lives]
end


@players = [{ name: "Player 1", lives: 3 }, { name: "Player 2", lives: 3 }]
game_over = false
current_player = 0


while !game_over
  num1, num2 = generate_random_numbers
  player_name = @players.select { |player| player }[current_player][:name]
  player_answer = generate_question(player_name, num1, num2)
  correct_answer = sum(num1, num2)
  verified = verify_answer(player_answer, correct_answer)
  if !verified
    @players.select { |player| player }[current_player][:lives] -= 1
    lives = lives_check(current_player)
    puts "Wrong! #{player_name} has #{lives} lives left."
    if lives == 0
      game_over = true
      puts "Game over. #{player_name} loses."
    end
  else
    lives = lives_check(current_player)
    puts "Correct! #{player_name} still has #{lives} lives left."
  end
  current_player = (current_player + 1) % 2
end

