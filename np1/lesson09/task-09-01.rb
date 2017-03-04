# encoding: utf-8

# Площадь круга
def square radius
  return Math::PI * radius**2
end

# Первый круг
puts "Введите радиус круга:"
square_input = STDIN.gets.to_f
square_one = square square_input
puts "Площадь круга: #{square_one}"

# Второй круг
puts "Введите радиус второго круга:"
square_input = STDIN.gets.to_f
square_two = square square_input
puts "Площадь второго круга: #{square_two}"