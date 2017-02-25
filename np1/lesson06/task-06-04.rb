# encoding: utf-8

# Массив со значениями вариантов игры
values = ['Камень', 'Ножницы', 'Бумага']

# Тексты результатов игры
win_user = "Вы победили"
win_computer = "Победил компьютер"

puts "введите вариант: 0 - камень, 1 - ножницы, 2 - бумага"

# Выбор пользователя
user_choice = gets.to_i
puts "Вы выбрали: " + values[user_choice]

# Выбор компьютера
computer_choice = rand(3)
puts "Компьютер выбрал: " + values[computer_choice]
 
# Сравниваем результаты
if (user_choice == computer_choice)
  # Ничья
  puts "Победила дружба"
  exit
else
  if (user_choice == 0 && computer_choice == 1) ||
      (user_choice == 1 && computer_choice == 2) ||
      (user_choice == 2 && computer_choice == 0)
    # Победа пользователя
    puts win_user
    exit
  else
    # Во всех остальных случаях победа компьютера
    puts win_computer
    exit
  end  
end