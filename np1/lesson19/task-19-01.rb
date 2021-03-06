# encoding: utf-8

# Запрос чисел
puts "Первое число:"
value_one = STDIN.gets.to_i

puts

puts "Второе число:"
value_two = STDIN.gets.to_i

puts

puts "Выберите операцию (+ - * /):"
operation = STDIN.gets.chomp

# Подбор операции
case operation
when "+"
  result = value_one + value_two
when "-"
  result = value_one - value_two
when "*"
  result = value_one * value_two
when "/"
  begin
    result = value_one / value_two
  rescue ZeroDivisionError
    result = "На ноль делить нельзя"
  end
else
  result = nil
end

puts

# Вывод результатов
if result
  puts "Результат:"
  puts result
else
  puts "Неизвестная операция"
end