# encoding: utf-8

# Вычисление победителя
def game(player_one, player_two)
  # Сравниваем результаты
  if player_one == player_two
    # Ничья
    return 0
  else
    if (player_one == 0 && player_two == 1) ||
       (player_one == 1 && player_two == 2) ||
       (player_one == 2 && player_two == 0) ||
       (player_one == 3 && player_two == 1) ||
       (player_one == 3 && player_two == 2)
      # Победа первого игрока
      return 1
    else
      # Победа второго игрока
      return 2
    end
  end
end

values = ['Камень', 'Ножницы', 'Бумага', 'Огонь']
scenarios = ["Победила дружба", "Вы победили", "Победил компьютер"]

puts "введите вариант: 0 - камень, 1 - ножницы, 2 - бумага, 3 - огонь"

# Выбор пользователя
user_choice = gets.to_i
puts "Вы выбрали: " + values[user_choice]

# Выбор компьютера
computer_choice = rand(4)
puts "Компьютер выбрал: " + values[computer_choice]

# Подсчет результатов
result = game(user_choice, computer_choice)

# Результаты игры
puts scenarios[result]