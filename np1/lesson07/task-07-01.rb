# encoding: utf-8

# Начальные переменные
array = []
sum = 0
count = 1

# Выводим вопрос пользователю
puts "Введите N"

# Получаем введеное значение
qty = gets.to_i

while count <= qty do
  
  # Формируем массив
  array.push(count)

  # Подсчитываем сумму элементов
  sum += count

  # Увеличиваем значение счетчика
  count += 1
end

puts array.to_s
puts sum