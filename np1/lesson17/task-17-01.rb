# encoding: utf-8

# Спрашиваем у пользователя строку, отрезаем у неё крайние пробелы (и символ
# переноса заодно) методом strip, а затем и приводим строку к нижнему регистру
# методом downcase. Результат записываем в переменную original_string.
original_string = gets.strip.downcase
original_string.tr!(', ','')

# Получаем перевернутую строку и записываем её в переменную reverse_string.
reverse_string = original_string.reverse

# Сравниваем обе строки и выносим вердикт
if reverse_string == original_string
  puts "Да, это палиндром"
else
  puts "Нет, это не палиндром"
end