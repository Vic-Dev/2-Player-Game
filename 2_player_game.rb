player_1_life = 3
player_2_life = 3
turn = 1
player = 1

game_over = false
while !game_over
  num1 = rand(11)
  num2 = rand(11)
  if turn == 1
    player = 1
    turn = 2
  else
    player = 2
    turn = 1
  end
  puts "Player #{player}: What does #{num1} plus #{num2} equal?"
  answer = gets.to_i
  sum = num1 + num2
  if answer != sum
    puts "Wrong!"
    if player == 1
      player_1_life -= 1
      puts "Player #{player} life: #{player_1_life}"
      if player_1_life == 0
        puts "Player #{player} lost."
        game_over = true
      end
    else
      player_2_life -= 1
      puts "Player #{player} life: #{player_2_life}"
      if player_2_life == 0
        puts "Player #{player} lost."
        game_over = true
      end
    end
  end  
end

def generate_question
end

def prompt_player_for_answer
end

def verify_answer
end
