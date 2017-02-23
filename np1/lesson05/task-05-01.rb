# encoding: utf-8

# Числа, в которых будут содержаться ответы
number1 = nil
number2 = nil
number3 = nil

# Спрашиваем числа
puts "Введите число 1:"
number1 = gets.to_i

puts "Введите число 2:"
number2 = gets.to_i

puts "Введите число 3:"
number3 = gets.to_i

# Подсчитываем среднее арифметическое
avg = (number1 + number2 + number3) / 3

# Выводим среднее арифметическое
puts "Среднее арифметическое: " + avg.to_s
