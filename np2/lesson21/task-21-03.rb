# encoding: utf-8

(1..100).each do |number|
  # Проверка делимостей
  div3 = number % 3 == 0
  div5 = number % 5 == 0

  # Результат выбора
  result = if div3 && div5
             "тыры-пыры"
           elsif div3
             "тыры"
           elsif div5
             "пыры"
           else
             number
           end

  puts result
end