# encoding: utf-8

(1..100).each do |number|
  original_number = number

  # Преобразование в массив
  number = number.to_s.split("")

  # Преобразование элементов массива в число
  number.map! { |i| i.to_i}

  # Сумма цифр числа
  sum = number.inject { |sum, x| sum + x }

  # Проверка делимостей
  div3 = sum % 3 == 0
  div5 = number.last == 0 || number.last == 5

  if div3 && div5
    result = "тыры-пыры"
  elsif div3
    result = "тыры"
  elsif div5
    result = "пыры"
  else
    result = original_number
  end

  puts result
end