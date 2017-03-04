# encoding: utf-8

# Варианты ответов
message1 = "Тепло (нужно больше)"
message2 = "Тепло (нужно меньше)"
message3 = "Холодно"

# Загаданное число
number = rand(16)

# Количество попыток
attempts = 3

count = 1

# Ядро игры
# number - загаданное число
def game(number)
  # Задаем пользователю вопрос
  puts "Загадано число от 0 до 15, отгадайте какое?"

  # Получаем ответ от пользователя
  choice = gets.to_i

  # Проверяем, насколько отличается
  # ответ пользователя от загаданного результата
  if (choice == number)
    # Пользователь угадал ответ
    abort "Ура, вы выиграли!"
  else
    # Различие в пределах 2
    if ((choice - number).abs <= 2)
      puts "Тепло"
    else
      puts "Холодно"
    end

    if (choice - number < 0)
      # Нужно больше
      puts "Нужно больше"
    elsif (choice - number > 0)
      # Нужно меньше
      puts "Нужно меньше"
    end
  end
end

# Запуск игры
while count <= attempts do
  game(number)
  count += 1
end

# Далее считаем, что пользователь проиграл
puts "Сожалеем, но вы проиграли."
puts "Загаданное число " + number.to_s