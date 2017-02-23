# encoding: utf-8

# Переменные, которые содержат числа для сравнения
param01 = 100
param02 = 200

# Переменная, в которой будет большее число
biggest = nil

# Сравнение чисел

if (param01 == param02)
  # Если числа равны
  puts "Числа равны #{param01} = #{param02}"
else
  # Поиск наибольшего числа
  if (param01 > param02)
    biggest = param01
  else
    biggest = param02
  end

  puts "Наибольшее число: #{biggest}"
end