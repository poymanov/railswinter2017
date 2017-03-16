# encoding: utf-8

(1..100).each do |number|

  # Проверка делимостей
  div3 = number % 3 == 0
  div5 = number % 5 == 0

  # Результат выбора
  if div3 && div5
    result = "тыры-пыры"
  elsif div3
    result = "тыры"
  elsif div5
    result = "пыры"
  else
    result = number
  end

  puts result
end