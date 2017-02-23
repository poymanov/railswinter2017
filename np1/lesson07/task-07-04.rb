# encoding: utf-8

# Исходный массив
array = [1, 2, 3, 4, 5, 6, 7];

# Измененный массив
arrayReverse = []

# Получаем количество элементов в массиве
size = array.size

# Счетчик для перебора элементов
count = size - 1

# Перебираем элементы

while count >= 0

  # Формируем новый массив
  arrayReverse.push(array[count])

  # Уменьшаем значение счетчика
  count -= 1
end

puts array.to_s
puts arrayReverse.to_s