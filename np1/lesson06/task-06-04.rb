# encoding: utf-8

# Массив со значениями вариантов игры
values = ['Камень', 'Ножницы', 'Бумага']

# Тексты результатов игры
winUser = "Вы победили"
winComputer = "Победил компьютер"

# Вопрос пользователю
puts "введите вариант: 0 - камень, 1 - ножницы, 2 - бумага"

# Получаем выбор пользователя
choice = gets.to_i

# Отображаем выбор пользователя
puts "Вы выбрали: " + values[choice]

# Получаем выбор компьютера
computerChoice = values.sample

# Отображаем выбор компьютера
puts "Компьютер выбрал: " + computerChoice
 
# Получаем индекс выбранного компьютером значения
indexComputerChoice = nil

if (values[0] == computerChoice)
  indexComputerChoice = 0
elsif (values[1] == computerChoice)
  indexComputerChoice = 1
elsif (values[2] == computerChoice)
  indexComputerChoice = 2
end

# Сравниваем результаты

#0 - камень, 1 - ножницы, 2 - бумага

if (choice == indexComputerChoice)
  # Ничья
  abort "Победила дружба"
else
  if choice == 0 && indexComputerChoice == 1
    # Камень/Ножницы
    abort winUser
  elsif choice == 0 && indexComputerChoice == 2
    # Камень/Бумага
    abort winComputer
  elsif choice == 1 && indexComputerChoice == 0
    # Ножницы/Камень
    abort winComputer
  elsif choice == 1 && indexComputerChoice == 2
    # Ножницы/Бумага
    abort winUser
  elsif choice == 2 && indexComputerChoice == 0
    # Бумага/Камень
    abort winUser
  elsif choice == 2 && indexComputerChoice == 1
    # Бумага/Ножницы
    abort winComputer
  end
end